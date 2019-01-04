(function(){
	'use strict';
	angular.module('rgen').factory('stickyhtmlFactory', [function () {
		return {
			common: function () {
				return {
					title_status: true,
					title: {},

					html_status: true,
					html: {},

					icon: {},
					position: 'l',
					top: 150,
					w: 300,
					cssclass: ''
				}
			},
			assign: function () {
				return {
					module_id:'',
					layout_id: '',
					position: '',
					status: true,
					sort_order: 0
				}
			}
		}
	}]);



	angular.module('rgen').controller('moduleStickyhtml', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_stickyhtml') {
				$state.go('mod_stickyhtml.manage');
			};
	}]);

	angular.module('rgen').controller('moduleStickyhtmlData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'stickyhtmlFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, stickyhtmlFactory, Mod, SweetAlert){

			$('body').removeClass('single-level');
			
			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'stickyhtml',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Sticky HTML';
			$scope.modHd      = 'Sticky HTML';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modConetnt = {};

			// Column sizes
			$scope.col_sizes = [];
			var sizerange = _.range(1, 13);
			_.map(sizerange, function(s){
				$scope.col_sizes.push({ label: s, val: s });
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
				{ label:'30', val:'gt30' },
				{ label:'40', val:'gt40' },
				{ label:'50', val:'gt50' },
				{ label:'60', val:'gt60' },
				{ label:'70', val:'gt70' },
				{ label:'80', val:'gt80' },
				{ label:'90', val:'gt90' },
				{ label:'100', val:'gt100' }
			];

			// HTML content places
			$scope.active_place = 'l';
			$scope.htmlplaces = [
				{ label:'Left', val:'l' },
				{ label:'Right', val:'r' }
			];

			// On change position
			$scope.htmltypes = function () {
				Loader.on('.htmlcontent-panel');
				setTimeout(function(){ Loader.off('.htmlcontent-panel'); }, 200);
			}

			/* Default processes
			------------------------*/
			// Get data
			Mod.get($scope);
			$scope.getkey = function (modid) {
				$scope.modConetnt = {};
				Mod.getkey($scope, modid);
			}

			// Save data
			$scope.save = function(){
				Mod.save($scope);
			}

			// Remove data
			$scope.modRemove = function(id){
				$scope.removeid = id;
				SweetAlert.swal({
					title: "Are you sure?",
					text: "You wish to remove module !",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					closeOnConfirm: false
				},
				function(isConfirm){
					if (isConfirm) {
						Mod.remove($scope);
					}/* else { return false; }*/;
				});
			}

			// New item
			$scope.createCustomFn = function () {
				$scope.modConetnt.data.push('No node');
			}
			
			// Common settings
			$scope.modConetnt.common = new stickyhtmlFactory.common();

			$scope.create = function () {
				// Common settings
				$scope.modConetnt.common = new stickyhtmlFactory.common();
				
				Mod.create($scope);
			}
		}
	]);
})();