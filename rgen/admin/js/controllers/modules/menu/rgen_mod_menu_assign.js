(function(){
	'use strict';
	angular.module('rgen').controller('moduleMenuAssign', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$modal',
		'menuFactory',
		'Mod',
		function($scope, Rest, Pop, Loader, $state, $modal, menuFactory, Mod){

			/* Default settings
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'menu',
				suffix  : '_set',
				assign  : 'set_',
				type    : 'assign'
			}

			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Menu';
			$scope.modList    = [];
			$scope.layoutList = [];
			$scope.modConetnt = {};

			// Assign default values
			$scope.modConetnt.data = [];
			$scope.modConetnt.data.push(new menuFactory.assign());

			// Align
			$scope.alignment = [
				{ label:'Left', val:'left' },
				{ label:'Center', val:'center' },
				{ label:'Right', val:'right' }
			];

			// Layout width
			$scope.layout_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];

			// Layout style
			$scope.layout_styles = [
				{ label:'Horizontal', val:'h' },
				{ label:'Vertical', val:'v' }
			];
			
			/* Default processes
			------------------------*/
			// Get module list
			Mod.getmodlist($scope);

			// Layout list
			Mod.layouts($scope);
			$scope.layoutdata = function (layout) {
				$scope.layout = _.filter($scope.layoutList, function(val, key){ 
					return val.layout_id == layout;
				});
			}

			// Position list
			$scope.positionList = new Mod.positions().list;
			$scope.positionList.push({name: "Main Menu", val: "main_menu"});
			
			/* Modules processes
			------------------------*/
			// Get data
			Mod.get($scope);
			$scope.getkey = function (modid) {
				Mod.getkey($scope, modid);
			}

			// Save data
			$scope.save = function(){
				Mod.save($scope);
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
				var temp 			= new menuFactory.assign();
					temp.module_id 	= $scope.modList[0].val;
					temp.position 	= new Mod.positions().list[0].val;
					temp.layout_id 	= $scope.layoutList[0].layout_id;
				$scope.modConetnt.data.push(temp);
			};
			
			$scope.createCustomFn = function () {
				if (_.size($scope.modList) > 0) {
					$scope.newItem();
				}
			}

			$scope.create = function () {
				if (_.size($scope.modList) > 0) {
					Mod.create($scope);
				} else {
					Pop.pop_error('No any module to assign on layout.\nPlease create module from "MANAGE" section.');
				}
			}

			/* Other settings
			------------------------*/
			// Menu modal
			$scope.open = function(node) {
				var modalInstance = $modal.open({
					templateUrl: tpl,
					controller: "moduleMenuModal",
					size: 'lg',
					resolve: {
						menuitem: function () {
						}
					}
				});
				modalInstance.result.then(function (response) {
					//console.log(response);
					$scope.$apply(function() {
						response
					});
				}, function(err){
					//console.log(err);
				});
			}
		}
	]);
})();