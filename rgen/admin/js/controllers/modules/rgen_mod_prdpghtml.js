(function(){
	'use strict';
	angular.module('rgen').factory('prdpghtmlFactory', [function () {
		return {
			common: function () {
				return {
					hoverstyle: "1",
					title_status: false,
					title: {},
					gt: 'gt40',
					top: {
						status: false,
						html: {}
					},
					bottom: {
						status: false,
						html: {}
					},
					left: {
						status: false,
						size: 3,
						html: {}
					},
					middle: {
						status: false,
						size: 6,
						html: {}
					},
					right: {
						status: false,
						size: 3,
						html: {}
					}
				}
			},
			assign: function () {
				return {
					module_id:'',
					layout_id: '',
					position: '',
					status: true,
					sort_order: 0,
					container: 'bx',
					prd_page: 'all',
					products: {}
				}
			}
		}
	}]);



	angular.module('rgen').controller('modulePrdpghtml', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_prdpghtml') {
				$state.go('mod_prdpghtml.manage');
			};
	}]);

	angular.module('rgen').controller('modulePrdpghtmlData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'prdpghtmlFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, prdpghtmlFactory, Mod, SweetAlert){

			$('body').removeClass('single-level');
			
			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'prdpghtml',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Product page - HTML';
			$scope.modHd      = 'Product page - HTML';
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
			$scope.active_place = 't';
			$scope.htmlplaces = [
				{ label:'Top', val:'t' },
				{ label:'Bottom', val:'b' },
				{ label:'Left', val:'l' },
				{ label:'Middle', val:'m' },
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
			$scope.modConetnt.common = new prdpghtmlFactory.common();

			$scope.create = function () {
				// Common settings
				$scope.modConetnt.common = new prdpghtmlFactory.common();
				
				Mod.create($scope);
			}
		}
	]);
})();