(function(){
	'use strict';

	angular.module('rgen').controller('themeCustomcode', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		function($scope, Rest, Pop, Loader){

			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix   : 'rgen_',
				group    : 'rgen_theme',
				settings : 'rgen_settings',
				modgroup : false,
				section  : 'customcode',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.modList    = [
				{ name:'Theme custom code' , val:'customcode' }
			];

			// Breadcrumb home link
			$scope.codetype = [
				{ label:'CSS Input', val:'css' },
				{ label:'CSS File', val:'cssf' },
				{ label:'JS Input', val:'js' },
				{ label:'JS file', val:'jsf' }
			];

			$scope.codetype_tab = 'css';
			$scope.codetype_fn = function (type) {
				$scope.codetype_tab = type;
			}

			$scope.themeDefault = function () {
				return {
					customcode: {
						status: true,
						css_status: false,
						js_status: false,
						cssfile_status: false,
						jsfile_status: false,
						css: '',
						js: '',
						cssfile: [{file: '' }],
						jsfile: [{file: ''}]
					}
				}
			}

			$scope.addFile = function (type) {
				if (type == 'css') {
					$scope.themeData.cssfile.push({file: '' });
				};
				if (type == 'js') {
					$scope.themeData.jsfile.push({file: '' });
				};
			}
			$scope.removeFile = function ($index, type) {
				if (type == 'css') {
					$scope.themeData.cssfile.splice($index, 1);
				};
				if (type == 'js') {
					$scope.themeData.jsfile.splice($index, 1);
				};
			}

			$scope.getkey = function (id) {
				$scope.modId = null;
				$scope.modId = id;
				$scope.themeData = new $scope.themeDefault()[id];
				
				// Marge data from response
				Loader.on('.rgen-container');
				Rest.themeGetkey($scope.db.group, $scope.modId).then(function(response){
					$scope.themeData = $.extend(true, $scope.themeData, response.data);
					setTimeout(function(){
						$scope.$apply(function() {
							Loader.off('.rgen-container');	
						});
					}, 200);
				}, function (error){
					Pop.pop_error(error);
				});
				//=========================
			}
			$scope.getkey('customcode');

			$scope.save = function(){
				
				// Settings
				$scope.settings = {
					css_status     : Rest.getVal($scope.themeData, 'css_status', false),
					js_status      : Rest.getVal($scope.themeData, 'js_status', false),
					cssfile_status : Rest.getVal($scope.themeData, 'cssfile_status', false),
					jsfile_status  : Rest.getVal($scope.themeData, 'jsfile_status', false),

					csscode        : Rest.getVal($scope.themeData, 'css', ''),
					jscode         : Rest.getVal($scope.themeData, 'js', ''),
					cssfiles       : Rest.getVal($scope.themeData, 'cssfile', ''),
					jsfiles        : Rest.getVal($scope.themeData, 'jsfile', '')
				};
				
				// Save data
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){
					
					if (_.size($scope.settings) > 0) {
						Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.settings);
					}

					// Save fonts
					Rest.themeSavefonts($scope.db.group, 'fonts', $scope.fonts).then(function(){
						Pop.pop_success(rgen_config.text_success);
						Loader.off('.rgen-container');
					}, function (error){
						Loader.off('.rgen-container');
						Pop.pop_error(error);
					});

				}, function (error){
					Loader.off('.rgen-container');
					Pop.pop_error(error);
				});
			}


	}]);

})();