(function(){
	'use strict';
	angular.module('rgen').controller('modulePrdpghtmlAssign', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$modal',
		'prdpghtmlFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $modal, prdpghtmlFactory, Mod, SweetAlert){

			/* Default settings
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'prdpghtml',
				suffix  : '_set',
				assign  : 'set_',
				type    : 'assign'
			}

			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Product page - HTML';
			$scope.modList    = [];
			$scope.layoutList = [];
			$scope.modConetnt = {};

			// Layout width
			$scope.layout_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];

			// Select product
			$scope.product_pages = [
				{ label:'All products', val:'all' },
				{ label:'Selected products', val:'selected' }
			];

			// Assign default values
			$scope.modConetnt.data = [];
			$scope.modConetnt.data.push(new prdpghtmlFactory.assign());

			/* Default processes
			------------------------*/
			// Get module list
			Mod.getmodlist($scope);

			// Layout list
			Mod.layouts($scope);

			// Filtering only product layouts
			/*$scope.filterlayout = function(){
				setTimeout(function(){
					$scope.$apply(function() {
						$scope.lyList = _.filter($scope.layoutList, function(val, key){ 
							return val.route == "product/product";
						});
						$scope.layoutList = $scope.lyList;
					});
				}, 300);
			}
			$scope.filterlayout();*/
			
			// Position list
			$scope.positionList = new Mod.positions().list;
			$scope.positionList.push({name: "Slide show", val: "pos_ss"});
			$scope.positionList.push(
				{ name: 'R.Gen - Product page : Above image'       , val:'pdpg_timg' },
				{ name: 'R.Gen - Product page : Below image'       , val:'pdpg_bimg' },

				{ name: 'R.Gen - Product page : Above options'     , val:'pdpg_toption' },
				{ name: 'R.Gen - Product page : Below options'     , val:'pdpg_boption' },
				{ name: 'R.Gen - Product page : Below quantity'    , val:'pdpg_bqty' },

				{ name: 'R.Gen - Product page : Above tabs'        , val:'pdpg_ttab' },
				{ name: 'R.Gen - Product page : Below tabs'        , val:'pdpg_btab' },

				{ name: 'R.Gen - Product page : Above title'       , val:'pdpg_thd' },
				{ name: 'R.Gen - Product page : Below title'       , val:'pdpg_bhd' },

				{ name: 'R.Gen - Product page : Below information' , val:'pdpg_binfo' }
			);
			
			/* Modules processes
			------------------------*/
			// Get data
			Mod.get($scope);

			$scope.getkey = function (modid) {
				$scope.modConetnt.data = [];
				Mod.getkey($scope, modid);

				// Reloading assign module
				$scope.assign_data = '';
				setTimeout(function () {
					$scope.assign_data = tpl('modules/prdpghtml/assign_data');
				}, 200);
			}

			// Save data
			$scope.save = function(){
				if (_.getPath($scope.modConetnt, 'data.0.layout_id') != '') {
					Mod.save($scope);
				} else {
					Pop.pop_error('Product layout not set. Please reload page and save again.');
				};
			}

			// Remove data
			$scope.modRemove = function(id){
				$scope.removeid = id;
				$scope.t1       = "Are you sure?";
				$scope.msg1     = "You wish to remove module !";
				Pop.pop_confirm($scope);
			}
			$scope.popConfirmTrue = function ($scope) {
				Mod.remove($scope);
			};

			$scope.newItem = function() {
				var temp 			= new prdpghtmlFactory.assign();
					temp.module_id 	= $scope.modList[0].val;
					temp.position 	= new Mod.positions().list[0].val;
					//temp.layout_id 	= Rest.getVal($scope, 'layoutList.0.layout_id', 2);
					temp.layout_id 	= 2;
				$scope.modConetnt.data.push(temp);
			};
			
			$scope.createCustomFn = function () {
				if (_.size($scope.modList) > 0) {
					$scope.newItem();
				}
			}

			$scope.assign_data = '';
			$scope.create = function () {
				if (_.size($scope.modList) > 0) {
					Mod.create($scope);
					$scope.assign_data = tpl('modules/prdpghtml/assign_data');
				} else {
					Pop.pop_error('No any module to assign on layout.\nPlease create module from "MANAGE" section.');
				}
			}
		}
	]);
})();