(function(){
	'use strict';

	angular.module('rgen').controller('themePageShoppingcart', [
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
				section  : 'page',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.modList    = [
				{ name:'Shopping cart page' , val:'shoppingcart' }
			];

			$scope.themeDefault = function () {
				return {
					shoppingcart: {
						status: true,
						cart_title: {},
						other_title: {},
						qty: {},
						total_block: {},
						total_summary: {},
						total: {}
					}
				}
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
			$scope.getkey($scope.modList[0].val);

			// Reseting data
			$scope.reset     = function (id) { Pop.reset($scope, id); }
			$scope.resetData = function (id) {
				switch(id) {
					case 'shoppingcart':
					$scope.themeData = new $scope.themeDefault()['shoppingcart'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'shoppingcart':
						return _.object([
							['shoppingcart_cart_title'  , Rest.objChk($scope.themeData, 'cart_title') ? Rest.findFonts($scope.themeData.cart_title) : null],
							['shoppingcart_other_title' , Rest.objChk($scope.themeData, 'other_title') ? Rest.findFonts($scope.themeData.other_title) : null],
							['shoppingcart_qty'         , Rest.objChk($scope.themeData, 'qty') ? Rest.findFonts($scope.themeData.qty) : null],
							['shoppingcart_total_block' , Rest.objChk($scope.themeData, 'total_block') ? Rest.findFonts($scope.themeData.total_block) : null],
							['shoppingcart_total'       , Rest.objChk($scope.themeData, 'total') ? Rest.findFonts($scope.themeData.total) : null]
						]);
					break;
				}
			}

			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};

				// Settings
				//$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save data
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){
					
					/*if (_.size($scope.settings) > 0) {
						Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.settings);
					}*/

					if (_.size($scope.fonts) > 0) {
						// Save fonts
						Rest.themeSavefonts($scope.db.group, 'fonts', $scope.fonts).then(function(){
							Pop.pop_success(rgen_config.text_success);
							Loader.off('.rgen-container');
						}, function (error){
							Loader.off('.rgen-container');
							Pop.pop_error(error);
						});
					} else {
						Pop.pop_success(rgen_config.text_success);
						Loader.off('.rgen-container');
					};

				}, function (error){
					Loader.off('.rgen-container');
					Pop.pop_error(error);
				});
			}


	}]);

})();