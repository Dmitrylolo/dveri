(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenThemestorage',[
		'$modal', 
		function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			templateUrl: tpl('rgen_themestorage', 'dir'),
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				pholder: '@',
				buttonlabel: '@'
			},
			link: function(scope, element, attrs, ctrl) {
				scope.open = function() {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_themestorage_modal', 'dir'),
						controller: "rgenThemeStorage",
						size: 'lg',
						resolve: {
							ngModel: function () {
								return scope.ngModel;
							}
						}
					});
					modalInstance.result.then(function (response) {
						ctrl.$setViewValue(response);
						scope.ngModel = response;
					}, function(err){
						console.log(err);
					});
				}
			},
			controller: function($scope){
				
			}
		};
	}]);

	angular.module('rgenDirectives').controller('rgenThemeStorage', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Loader', 
		'Pop', 
		'ngModel', 
		'$filter',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Loader, Pop, ngModel, $filter, SweetAlert){
		
		$scope.permission = rgen_config.permission;
		$scope.permissionChk = function () {
			setTimeout(function () {
				Loader.on('.theme_storage_modal .modal-body', '#ffffff', '16px', 'You do not have permission to access this screen.');	
			}, 100);
		}
		if (!$scope.permission) {
			$scope.permissionChk();
		};

		$scope.themelist = [];
		
		var d = new Date();
		var dateinfo = $filter('date')(d.getTime(), 'medium');
		
		$scope.newtheme = 'R.Gen Theme - '+ dateinfo;
		$scope.selected_theme = rgen_config.activetheme;

		// Save new theme
		$scope.save_theme = function () {
			Loader.on('.theme_storage_modal .modal-body');
			$scope.theme = {
				id: 'theme_id_'+Rest.uid(),
				name: $scope.newtheme ? $scope.newtheme : 'R.Gen Theme'
			};
			// Save new theme data
			Rest.storageNewtheme($scope.theme.id).then(function(){
				$scope.themelist.push($scope.theme);
				$scope.selected_theme = $scope.theme.id;
				
				// Add / Update theme list
				Rest.storageEditlist($scope.themelist).then(function(){
					setTimeout(function(){
						Loader.off('.theme_storage_modal .modal-body');
						$modalInstance.close();
					}, 500);
				}, function(error){
					Loader.off('.theme_storage_modal .modal-body');
					Pop.pop_error(error);
				});
				
			}, function(error){
				Loader.off('.theme_storage_modal .modal-body');
				Pop.pop_error(error);
			});
		};

		// Get theme
		$scope.getallthemes = function(){
			Loader.on('.theme_storage_modal .modal-body');
			Rest.storageGetlist('themelist').then(function (response) {
				$scope.themelist = $.extend(true, $scope.themelist, response.data);
				$scope.selected_theme = _.size($scope.themelist) > 0 ? $scope.themelist[0].id : '';
				setTimeout(function(){
					$scope.$apply(function() {
						Loader.off('.theme_storage_modal .modal-body');	
					});
				}, 200);
			}, function (error){
				Pop.pop_error(error);
			});
		}
		if ($scope.permission) {
			$scope.getallthemes();
		}

		// Load theme
		$scope.load_theme = function (selected_theme) {
			Loader.on('.theme_storage_modal .modal-body');
			SweetAlert.swal({
				title: "Are you sure?",
				text: "You wish to load selected theme, It will reset your current settings !",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes",
				closeOnConfirm: false
			},
			function(isConfirm){
				if (isConfirm) {
					Rest.storageLoadtheme(selected_theme).then(function(){
						Loader.off('.theme_storage_modal .modal-body');
						location.reload();
					}, function(error){
						Loader.off('.theme_storage_modal .modal-body');
						Pop.pop_error(error);
					});
				} else { Loader.off('.theme_storage_modal .modal-body'); };
			});
		};

		// Remove theme
		$scope.remove_theme = function (selected_theme) {
			Loader.on('.theme_storage_modal .modal-body');
			SweetAlert.swal({
				title: "Are you sure?",
				text: "You wish to remove selected theme !",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes",
				closeOnConfirm: false
			},
			function(isConfirm){
				if (isConfirm) {
					_.find($scope.themelist, function(val, key){ 
						if (val.id == selected_theme) {
							return $scope.themelist.splice(key, 1);
						};
					});
					Rest.storageRemovetheme(selected_theme).then(function(){
						Loader.off('.theme_storage_modal .modal-body');
						
						// Add / Update theme list
						Rest.storageEditlist($scope.themelist).then(function(){
							setTimeout(function(){
								Loader.off('.theme_storage_modal .modal-body');
								$modalInstance.close();
							}, 500);
						}, function(error){
							Loader.off('.theme_storage_modal .modal-body');
							Pop.pop_error(error);
						});

					}, function(error){
						Loader.off('.theme_storage_modal .modal-body');
						Pop.pop_error(error);
					});
				} else { Loader.off('.theme_storage_modal .modal-body'); };
			});
		}

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}]);
	
})();

