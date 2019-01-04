(function(){
	'use strict';

	angular.module('rgen').controller('rgenThemeSelector', ['$scope', '$modalInstance', 'Rest', '$timeout', function ($scope, $modalInstance, Rest, $timeout) {
		
		$scope.uid = Rest.uid();

		$scope.newtheme = {
			id: 'theme_id_'+$scope.uid,
			name: 'R.Gen Theme'
		}
		$scope.theme = [];
		$scope.save = function () {
			$scope.theme = {
				id: 'theme_id_'+$scope.uid,
				name: $scope.newtheme.name ? $scope.newtheme.name : 'R.Gen Theme'
			};
			Rest.saveTheme($scope.theme).then(function(){
				$scope.themelist.push($scope.theme);
				Rest.setActiveTheme($scope.theme);
			});
			//$scope.themelist.push($scope.theme);
			$modalInstance.close($scope.theme);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}]);
	
	
})();