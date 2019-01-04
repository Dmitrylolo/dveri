(function(){
	'use strict';
	angular.module('rgen').controller('moduleBasicslideshowAssign', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$modal',
		'basicslideshowFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $modal, basicslideshowFactory, Mod, SweetAlert){

			/* Default settings
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'basicslideshow',
				suffix  : '_set',
				assign  : 'set_',
				type    : 'assign'
			}

			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Basic slideshow';
			$scope.modList    = [];
			$scope.layoutList = [];
			$scope.modConetnt = {};

			// Assign default values
			$scope.modConetnt.data = [];
			$scope.modConetnt.data.push(new basicslideshowFactory.assign());

			// Size type
			$scope.sizetype = [
				{ name:'Normal', val:'normal' },
				{ name:'Page full size', val:'pfs' },
				{ name:'Page full width', val:'pfw' },
				{ name:'Window full width', val:'wfw' },
				{ name:'Window full screen', val:'wfs' }
			];

			// Beside slide status
			$scope.beside_status = [
				{ label:'Yes', val: true },
				{ label:'No', val: false }
			];

			// Beside slide size
			$scope.beside_size = [];
			var besiderange = _.range(1, 13);
			_.map(besiderange, function(s){
				$scope.beside_size.push({ label:s, val:s });
			});

			// Gutter size
			$scope.gutter = [
				{ label:'0', val:'gt0' },
				{ label:'1', val:'gt1' },
				{ label:'2', val:'gt2' },
				{ label:'4', val:'gt4' },
				{ label:'10', val:'gt10' },
				{ label:'16', val:'gt16' },
				{ label:'20', val:'gt20' },
				{ label:'26', val:'gt26' },
				{ label:'30', val:'gt30' },
				{ label:'40', val:'gt40' }
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
				var data = $scope.modConetnt['data'][0];
				var w = parseInt(data['w']);
				var h = parseInt(data['h']);
				if (!isNaN(w) && !isNaN(h)) {
					Mod.save($scope);
				} else {
					Pop.pop_error('Please enter valid Width and Height values');
				}
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
				var temp 			= new basicslideshowFactory.assign();
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