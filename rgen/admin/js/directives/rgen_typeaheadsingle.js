(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenTypeaheadsingle', ['Rest', 'Pop', 'Loader', function(Rest, Pop, Loader) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_typeahead.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_typeaheadsingle_alone', 'dir'):
				tpl('rgen_typeaheadsingle', 'dir');
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
				var datasize = _.size($scope.ngModel);
				if (datasize > 0) {
					Loader.on('.typeahead-wrp');
					Rest.getTypeaheadData($scope.searchtype, $scope.ngModel.id).then(function(response){
						if (response.data.status) {
							$scope.typeaheadData = _.unescape(response.data.name);
						};
						if ($scope.searchtype == 'brand') {
							$scope.typeaheadData = _.unescape(response.data.name);
						};
						Loader.off('.typeahead-wrp');
					}, function (error) {
						Pop.pop_error(error);
					});
				};

				// Selecting data
				$scope.onSelect = function ($item, $model, $label, searchtype) {
					$scope.$item = $item;
					$scope.$model = $model;
					$scope.$label = $label;
					
					if (searchtype == 'product') {
						//$scope.ngModel = $scope.$item.product_id;
						$scope.ngModel = { 
							id: $scope.$item.product_id, 
							name: $scope.$item.name
						};
					};
					if (searchtype == 'category') {
						$scope.ngModel = { 
							id: $scope.$item.category_id, 
							name: $scope.$item.name
						};
					};
					if (searchtype == 'brand') {
						$scope.ngModel = { 
							id: $scope.$item.manufacturer_id, 
							name: $scope.$item.name
						};
					};
					if (searchtype == 'cmsinfobox') {
						$scope.ngModel = $scope.$item.information_id;
					};
				};

			},
			controller: function($scope){}
		};
	}]);

	
})();

