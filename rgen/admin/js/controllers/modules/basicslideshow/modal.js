(function(){
	'use strict';
	angular.module('rgen').controller('moduleBasicslideshowModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'basicslideshowFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, basicslideshowFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;

			// Default parameters
			$scope.modaldata  = new basicslideshowFactory.main();
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			
			$scope.modaldata  = $.extend(true, $scope.modaldata, $scope.item.item_data);
			
			$scope.apply = function (response) {

				$scope.item.item_data = response;
				$modalInstance.close($scope.item);

			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();