(function(){
	'use strict';
	var rgen = angular.module('rgenServices');
	rgen.factory('Mod', ['Rest', 'Pop', 'Loader', function (Rest, Pop, Loader) {
		
		var fn = {};
			
			fn.get = function ($scope) {
				Loader.on('.rgen-container');
				var section = fn.section($scope);
				Rest.modGetsection($scope.db.group, section).then(function(response){
					$scope.modStorage = response.data;
					
					var datasize = _.size($scope.modStorage);

					// Call after new module save
					if ($scope.modType == 'new' && $scope.modId != null) {
						fn.getkey($scope, $scope.modId);
						Pop.pop_success(rgen_config.text_success);
					};

					// Call on fresh data
					if (datasize == 0 && $scope.modId == null) {
						fn.create($scope);
					}

					// Call on page load
					if(!$scope.modId && $scope.modType == 'new' && datasize != 0) {
						for (var id in $scope.modStorage) break;
						fn.getkey($scope, id);
					};

					// Call on edit case
					if ($scope.modType == 'edit' && $scope.modId != null) {
						//fn.getkey($scope, $scope.modId);
						Loader.off('.rgen-container');
						Pop.pop_success(rgen_config.text_success);
					};

					// Call on remove case
					if ($scope.modType == 'remove') {
						if (datasize != 0) {
							for (var id in $scope.modStorage) break;
							$scope.modId = id;
							Loader.off('.rgen-container');
							fn.getkey($scope, id);
							Pop.pop_success('Module data has been removed.');
						} else {
							fn.create($scope);
							Pop.pop_success('Module data has been removed.');
						};
					};

					//Loader.off('.rgen-container');
				}, function (error) {
					Pop.pop_error(error);
				});	
			}

			fn.getkey = function ($scope, id) {
				if (id != null && $scope.modType != 'new') {
					Loader.on('.rgen-container');
					Rest.modGetkey($scope.db.group, id).then(function(response){
						Loader.off('.rgen-container');
						fn.processkey(id, response.data, $scope);
					}, function (error) {
						Pop.pop_error(error);
					});
				} else {
					fn.processkey(id, $scope.modStorage[id], $scope);
				}
			}

			fn.processkey = function (id, source, $scope) {
				Loader.on('.rgen-container');
				setTimeout(function(){
					$scope.modConetnt = $.extend(true, $scope.modConetnt, source);
					$scope.$apply(function() {
						$scope.modType = 'edit';
						$scope.modId = id;
						Loader.off('.rgen-container');
					});
				}, 200);
			}

			fn.create = function ($scope) {
				Loader.on('.rgen-container');
				$scope.modId = null;
				$scope.modType = 'new';
				$scope.modConetnt.data = [];
				$scope.modConetnt.name = $scope.namePrefix+(_.size($scope.modStorage) < 9 ? ' 0' : ' ')+(_.size($scope.modStorage)+1);
				$scope.createCustomFn();
				setTimeout(function(){
					$scope.$apply(function() { Loader.off('.rgen-container'); });
				}, 100);
			}

			fn.remove = function ($scope) {
				var section = fn.section($scope);
				Loader.on('.rgen-container');
				Rest.modRemovekey($scope.db.group, section, $scope.removeid).then(function(response){
					$scope.modType = 'remove';
					fn.get($scope);
				}, function (error) {
					Pop.pop_error(error);
					Loader.off('.rgen-container');
				});
			}

			fn.newkey = function ($scope) {
				/*return  $scope.db.section+
						$scope.db.suffix+
						(_.size($scope.modStorage) < 9 ? '_0'+(_.size($scope.modStorage)+1) : '_'+(_.size($scope.modStorage)+1))+
						'_'+Rest.uid();*/
				return  $scope.db.assign+Rest.uid();
			}
			fn.section = function ($scope) {
				return $scope.db.prefix+$scope.db.section+$scope.db.suffix;
			}

			fn.assign = function ($scope) {
				Rest.modAssign($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.modConetnt.data[0]).then(function(response){
					fn.get($scope);
				}, function (error) {
					Pop.pop_error(error);
				});	
			}

			fn.save = function ($scope) {
				if ($scope.modId != null && $scope.modType == 'edit') {
					if ($scope.modConetnt.data.length != 0) {
						Loader.on('.rgen-container');
						var section = fn.section($scope);
						Rest.modEditkey($scope.db.group, section, $scope.modId, $scope.modConetnt).then(function(){
							if ($scope.db.type == "assign") {
								fn.assign($scope);
							} else if ($scope.db.type == "manage"){
								fn.get($scope);
							};
							//Loader.off('.rgen-container');
							//Pop.pop_success(rgen_config.text_success);
						}, function (error){
							Loader.off('.rgen-container');
							Pop.pop_error(error);
						});	
					} else { 
						Pop.pop_error('No data to save.');
					};
					
				} else {
					if ($scope.modConetnt.data.length != 0) {
						Loader.on('.rgen-container');
						var newKey = fn.newkey($scope);
						var section = fn.section($scope);
						Rest.modEditkey($scope.db.group, section, newKey, $scope.modConetnt).then(function(){
							$scope.modType = 'new';
							$scope.modId = newKey;
							if ($scope.db.type == "assign") {
								fn.assign($scope);
							} else if ($scope.db.type == "manage"){
								fn.get($scope);
							};
						}, function (error){
							Loader.off('.rgen-container');
							Pop.pop_error(error);
						});
					} else { 
						Pop.pop_error('No data to save.');
					};
				};
			}

			fn.getmodlist = function ($scope) {
				Loader.on('.rgen-container');
				Rest.modGetsection($scope.db.group, $scope.db.prefix+$scope.db.section).then(function(response){
					_.map(response.data, function(value, key, list){
						$scope.modList.push({ val: key, name: value.name });
					});
					Loader.off('.rgen-container');
				}, function (error) {
					Pop.pop_error(error);
				});
			}

			fn.positions = function () {
				return {
					list: [
						{ val:'content_top'          , name: 'Content Top' },
						{ val:'content_bottom'       , name: 'Content Bottom' },
						{ val:'column_left'          , name: 'Content Left' },
						{ val:'column_right'         , name: 'Content Right' },

						{ name: 'R.Gen - Top Upper'  , val:'rg_t_up' },
						{ name: 'R.Gen - Top Left'   , val:'rg_t_l' },
						{ name: 'R.Gen - Top Middle' , val:'rg_t_m' },
						{ name: 'R.Gen - Top Right'  , val:'rg_t_r' },
						{ name: 'R.Gen - Top Lower'  , val:'rg_t_lw' },

						{ name: 'R.Gen - Bottom Upper'  , val:'rg_b_up' },
						{ name: 'R.Gen - Bottom Left'   , val:'rg_b_l' },
						{ name: 'R.Gen - Bottom Middle' , val:'rg_b_m' },
						{ name: 'R.Gen - Bottom Right'  , val:'rg_b_r' },
						{ name: 'R.Gen - Bottom Lower'  , val:'rg_b_lw' }
					]
				}
			}

			fn.layouts = function ($scope) {
				Loader.on('.rgen-container');
				Rest.getLayouts().then(function(response){
					$scope.layoutList = response.data;
					$scope.layoutList.push({
						layout_id: "9999", 
						layout_route_id: "9999",
						name: "All Pages",
						route: ""
					})
					Loader.off('.rgen-container');
				}, function (error) {
					Pop.pop_error(error);
				});
			}

		return fn;	

	}]);
	
})();


