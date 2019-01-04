(function(){
	'use strict';
	angular.module('rgen').controller('moduleBasicbannersModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'basicbannersFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, basicbannersFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;

			// Default parameters
			$scope.modaldata  = new basicbannersFactory.main();
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			
			$scope.modaldata  = $.extend(true, $scope.modaldata, $scope.item.item_data);

			$scope.banner = $scope.modaldata.banner;
			$scope.hover = $scope.modaldata.hover;
			
			$scope.apply = function (response, type) {
				if (type == 'banner') {
					$scope.item.item_data.banner = response;
				};
				if (type == 'hover') {
					$scope.item.item_data.hover = response;
				};
				$modalInstance.close($scope.item);

			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();