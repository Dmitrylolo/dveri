(function(){
	'use strict';
	angular.module('rgen').controller('modulePrdpgtabsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'parent',
		'prdpgtabsFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, parent, prdpgtabsFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;
			$scope.parent = parent;
			
			// Default parameters
			$scope.modaldata  = new prdpgtabsFactory[$scope.item.node_type];
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modaldata  = $.extend(true, $scope.modaldata, $scope.item.item_data);

			$scope.block_title = $scope.item.node_title ? $scope.item.node_title : 'Tab';
			
			$scope.apply = function (response, type) {
				switch (type) {
					case "block":
						$scope.item.node_title = $scope.block_title;
						$scope.item.item_data = response;
						break;

				}
				//$scope.item.item_data = response;
				$modalInstance.close($scope.item);
			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();