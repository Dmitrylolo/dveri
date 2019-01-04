(function(){
	'use strict';

	angular.module('rgen').controller('systemBackuprestore', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$filter',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $filter, SweetAlert){
			$scope.permission = rgen_config.permission;
			if (!$scope.permission) {
				Loader.on('.rgen-container', '#ffffff', '16px', 'You do not have permission to access this screen.');	
			};

			$scope.backuplistData = [];
			
			$scope.newtheme = 'RGen-Theme';

			$scope.defaultData = function () {
				return {
					menu: true,
					basicslideshow: true,
					basicbanners: true,
					bannergrids: true,
					imagegallery: true,
					productgroups: true,
					customhtml: true,
					contentblocks: true,
					revslider: true,
					gridmanager: true,
					prdpghtml: true,
					prdpgtabs: true,
					stickyhtml: true,
					catshowcase: true,
					deals: true
				}
			}

			$scope.modlist = [
				{ name: 'Mega menu'           , code: 'menu' },
				{ name: 'Basic slideshow'     , code: 'basicslideshow' },
				{ name: 'Basic banners'       , code: 'basicbanners' },
				{ name: 'Banner grids'        , code: 'bannergrids' },
				{ name: 'Image gallery'       , code: 'imagegallery' },
				{ name: 'Product groups'      , code: 'productgroups' },
				{ name: 'Custom HTML'         , code: 'customhtml' },
				{ name: 'Content blocks'      , code: 'contentblocks' },
				{ name: 'Revo slider'         , code: 'revslider' },
				{ name: 'Grid manager'        , code: 'gridmanager' },
				{ name: 'Product page : HTML' , code: 'prdpghtml' },
				{ name: 'Product page : Tabs' , code: 'prdpgtabs' },
				{ name: 'Sticky HTML'         , code: 'stickyhtml' },
				{ name: 'Category showcase'   , code: 'catshowcase' },
				{ name: 'Deals / Product showcase' , code: 'deals' }
				
			];

			/* Default tabs
			------------------------*/
			$scope.manage_tabs = [
				{ label:'Backup'  , val:'backup' },
				{ label:'Restore' , val:'restore' }
			];
			$scope.manage_tab = 'backup';
			$scope.tabtype = function (type) {
				Loader.on('.rgen-container');
				$scope.manage_tab = type;
				setTimeout(function(){ Loader.off('.rgen-container'); }, 200);
			}
			/*----------------------*/

			$scope.backupData = {
				name: $scope.newtheme,
				rgen_theme: true,
				modlist: new $scope.defaultData()
			}
			$scope.restoreData = {
				name: '',
				rgen_theme: true,
				modlist: new $scope.defaultData()
			}
			
			$scope.backup = function () {
				Loader.on('.rgen-container');
				if ($scope.validateName($scope.backupData.name)) {
					Rest.backup($scope.backupData).then(function(response){
						$scope.backuplist();
						Loader.off('.rgen-container');
					}, function (error){
						Pop.pop_error(error);
						Loader.off('.rgen-container');
					});
				} else {
					Pop.pop_error('Please enter valid name.');
					Loader.off('.rgen-container');
				};
			}

			$scope.restore = function (selected_backup) {
				Loader.on('.rgen-container');
				$scope.restoreData.name = selected_backup;
				SweetAlert.swal({
					title: "Are you sure?",
					text: "You wish to restore selected backup files ! Existing data will reset in restore process.",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					closeOnConfirm: false
				},
				function(isConfirm){
					if (isConfirm) {
						Rest.restore($scope.restoreData).then(function(response){
							Pop.pop_success('Selected backup files has been restored successfully.');
							Loader.off('.rgen-container');
						}, function (error){
							Pop.pop_error(error);
							Loader.off('.rgen-container');
						});
					} else { Loader.off('.rgen-container'); };
				});
			}

			$scope.validateName = function(val) {
				var re = /^[A-Za-z0-9_-]{3,100}$/;
				if (re.test(val)) {
					return true;
				}
				else {
					return false;
				}
			}

			$scope.backuplist = function () {
				$scope.backuplistData = [];
				Rest.backuplist().then(function(response){
					_.map(response.data, function(s){
						$scope.backuplistData.push({ val: s, name: s });
					});
					$scope.selected_backup = $scope.backuplistData[0].val;
				}, function (error){
					Pop.pop_error(error);
				});
			}
			$scope.backuplist();

			$scope.remove = function (selected_backup) {
				Loader.on('.rgen-container');
				SweetAlert.swal({
					title: "Are you sure?",
					text: "You wish to remove selected backup files !",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					closeOnConfirm: false
				},
				function(isConfirm){
					if (isConfirm) {
						Rest.backupremove(selected_backup).then(function(response){
							$scope.backuplistData = [];
							_.map(response.data, function(s){
								$scope.backuplistData.push({ val: s, name: s });
								$scope.selected_backup = $scope.backuplistData[0].val;
							});
							
							Pop.pop_success('Selected backup files has been removed.');
							Loader.off('.rgen-container');
						}, function (error){
							Pop.pop_error(error);
							Loader.off('.rgen-container');
						});
					} else { Loader.off('.rgen-container'); };
				});
			}


	}]);

})();