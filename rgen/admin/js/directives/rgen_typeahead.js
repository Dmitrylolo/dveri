(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenTypeahead', ['Rest', 'Pop', 'Loader', function(Rest, Pop, Loader) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_typeahead.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_typeahead_alone', 'dir'):
				tpl('rgen_typeahead', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				pholder: '@',
				size: '@',
				searchtype: '@'
			},
			link: function($scope) {
				$scope.dataSet = [];

				// Get data
				$scope.getData = function(type, val) {
					return Rest.getTypeahead(type, val).then(function(response){
						//$scope.dataSet = response;
						return response.map(function(item){
							return item;
						});
					}, function (error) {
						Pop.pop_error(error);
					});
				};

				// Load data
				$scope.ngModel = _.uniq($scope.ngModel);
				var datasize = _.size($scope.ngModel);
				if (datasize > 0) {
					Loader.on('.typeahead-wrp');
					var i = 0;
					_.each($scope.ngModel, function (item) {
						Rest.getTypeaheadData($scope.searchtype, item.id).then(function(response){
							if ($scope.searchtype == 'brand') {
								$scope.dataSet.push(response.data);
							} else {
								if (response.data.status) {
									$scope.dataSet.push(response.data);
								};
							}
							if (datasize == i) {
								Loader.off('.typeahead-wrp');
							};
						}, function (error) {
							Pop.pop_error(error);
						});
						i++;
					});	
				};
				

				// Selecting data
				$scope.onSelect = function ($item, $model, $label, searchtype) {
					$scope.$item = $item;
					$scope.$model = $model;
					$scope.$label = $label;
					
					if (searchtype == 'product') {
						$scope.ngModel.push({
							id: $scope.$item.product_id, 
							name: $scope.$item.name
						});
						$scope.dataSet.push($scope.$item);
					};
					if (searchtype == 'category') {
						$scope.ngModel.push({
							id: $scope.$item.category_id, 
							name: $scope.$item.name
						});
						$scope.dataSet.push($scope.$item);
					};
					if (searchtype == 'brand') {
						$scope.ngModel.push({
							id: $scope.$item.manufacturer_id, 
							name: $scope.$item.name
						});
						$scope.dataSet.push($scope.$item);
					};
					if (searchtype == 'cmsinfobox') {
						$scope.ngModel.push({
							id: $scope.$item.information_id, 
							name: $scope.$item.name
						});
						$scope.dataSet.push($scope.$item);
					};
				};

				// Remove data
				$scope.removeItem = function (value) {
					if ($scope.searchtype == 'product') {
						_.find($scope.ngModel, function(val, key){ 
							if (val.id == value.product_id) {
								return $scope.ngModel.splice(key, 1);
							};
						});
					};
					if ($scope.searchtype == 'category') {
						//$scope.ngModel = _.without($scope.ngModel, value.category_id);
						_.find($scope.ngModel, function(val, key){ 
							if (val.id == value.category_id) {
								return $scope.ngModel.splice(key, 1);
							};
						});
					};
					if ($scope.searchtype == 'brand') {
						_.find($scope.ngModel, function(val, key){ 
							if (val.id == value.manufacturer_id) {
								return $scope.ngModel.splice(key, 1);
							};
						});
					};
					if ($scope.searchtype == 'cmsinfobox') {
						_.find($scope.ngModel, function(val, key){ 
							if (val.id == value.information_id) {
								return $scope.ngModel.splice(key, 1);
							};
						});
					};
					$scope.dataSet = _.without($scope.dataSet, value);
				}
			},
			controller: function($scope){}
		};
	}]);

	
})();

