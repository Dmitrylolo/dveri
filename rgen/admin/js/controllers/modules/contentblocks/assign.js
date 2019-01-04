(function(){
	'use strict';
	angular.module('rgen').controller('moduleContentblocksAssign', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$modal',
		'contentblocksFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $modal, contentblocksFactory, Mod, SweetAlert){

			/* Default settings
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'contentblocks',
				suffix  : '_set',
				assign  : 'set_',
				type    : 'assign'
			}

			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Content blocks';
			$scope.modList    = [];
			$scope.layoutList = [];
			$scope.modConetnt = {};

			// Layout width
			$scope.layout_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];

			// Assign default values
			$scope.modConetnt.data = [];
			$scope.modConetnt.data.push(new contentblocksFactory.assign());

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
			$scope.positionList.push({name: "Slide show", val: "pos_ss"});
			
			/* Modules processes
			------------------------*/
			// Get data
			Mod.get($scope);
			$scope.getkey = function (modid) {
				Mod.getkey($scope, modid);
			}

			// Save data
			$scope.save = function(){
				/*var data = $scope.modConetnt['data'][0];
				var w = parseInt(data['w']);
				var h = parseInt(data['h']);
				if (!isNaN(w) && !isNaN(h)) {
					Mod.save($scope);
				} else {
					Pop.pop_error('Please enter valid Width and Height values');
				}*/
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
				var temp 			= new contentblocksFactory.assign();
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
		}
	]);
})();