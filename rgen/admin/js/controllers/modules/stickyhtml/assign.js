(function(){
	'use strict';
	angular.module('rgen').controller('moduleStickyhtmlAssign', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$modal',
		'stickyhtmlFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $modal, stickyhtmlFactory, Mod, SweetAlert){

			/* Default settings
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'stickyhtml',
				suffix  : '_set',
				assign  : 'set_',
				type    : 'assign'
			}

			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Sticky HTML';
			$scope.modList    = [];
			$scope.layoutList = [];
			$scope.modConetnt = {};

			// Assign default values
			$scope.modConetnt.data = [];
			$scope.modConetnt.data.push(new stickyhtmlFactory.assign());

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
				var temp 			= new stickyhtmlFactory.assign();
					temp.module_id 	= $scope.modList[0].val;
					temp.position 	= 'stickydata';
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
		}
	]);
})();