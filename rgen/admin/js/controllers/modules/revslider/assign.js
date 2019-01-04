(function(){
	'use strict';
	angular.module('rgen').controller('moduleRevsliderAssign', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$modal',
		'revsliderFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $modal, revsliderFactory, Mod, SweetAlert){

			/* Default settings
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'revslider',
				suffix  : '_set',
				assign  : 'set_',
				type    : 'assign'
			}

			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Revo slider';
			$scope.modList    = [];
			$scope.layoutList = [];
			$scope.modConetnt = {};
			$scope.revomod_url = _.unescape(rgen_config.revo_href);
			
			// Layout width
			$scope.layout_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];

			// Size type
			$scope.sizetype = [
				{ label:'Normal', val:'normal' },
				{ label:'Page full size', val:'pfs' }
			];

			// Assign default values
			$scope.modConetnt.data = [];
			$scope.modConetnt.data.push(new revsliderFactory.assign());

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

			/* Get all sliders
			------------------------*/
			$scope.sliderList = []
			$scope.sliderData = null;
			$scope.getsliders = function () {
				Loader.on('.rgen-container');
				Rest.modGetrevsliders().then(function(response){
					Loader.off('.rgen-container');
					if (_.size(response.data) > 0) {
						_.map(response.data, function(s){
							$scope.sliderList.push({ name: s.title, val: s.id });
						});
						$scope.sliderData = response.data;
					};
					//console.log(angular.fromJson(response.data[0].params));
				}, function (error) {
					Pop.pop_error(error);
				});
			}
			$scope.getsliders();

			$scope.sliderSelect = function(id){
				if ($scope.sliderData != null) {
					$scope.modConetnt.data[0].slider_data = $scope.sliderData[id];
				};
			}
			/*------------------------*/
			

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
				var temp 			= new revsliderFactory.assign();
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