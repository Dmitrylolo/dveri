(function(){
	'use strict';
	angular.module('rgen').factory('productgroupsFactory', [function () {
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
						size: 4,
						html: {}
					},
					right: {
						status: false,
						size: 4,
						html: {}
					}
				}
			},
			tree_node: function () {
				return {
					depth: 1,
					status: true,
					node_type: "special", // Main - Row - Column - Item
					node_title: "Item",
					item_data: {}
				}
			},
			special: function () {
				return {
					node_type: 'special',
					content: {
						title_status: true,
						title: {}
					},
					setting: {
						prd_style: 'prd1',
						prd_view: 'grid',
						prd_limit: 8,
						image_w: 250,
						image_h: 250,
						grids: {},
						counter: false,
						h_counter: false,
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false
						},
						cssclass: ''
					}
				}
			},
			latest: function () {
				return {
					node_type: 'latest',
					content: {
						title_status: true,
						title: {}
					},
					setting: {
						prd_style: 'prd1',
						prd_view: 'grid',
						prd_limit: 8,
						image_w: 250,
						image_h: 250,
						grids: {},
						counter: false,
						h_counter: false,
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false
						},
						cssclass: ''
					}
				}
				
			},
			best: function () {
				return {
					node_type: 'best',
					content: {
						title_status: true,
						title: {}
					},
					setting: {
						prd_style: 'prd1',
						prd_view: 'grid',
						prd_limit: 8,
						image_w: 250,
						image_h: 250,
						grids: {},
						counter: false,
						h_counter: false,
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false
						},
						cssclass: ''
					}
				}
				
			},
			category: function () {
				return {
					node_type: 'category',
					content: {
						title_status: true,
						title: {}
					},
					setting: {
						category: {},
						prd_style: 'prd1',
						prd_view: 'grid',
						prd_limit: 8,
						image_w: 250,
						image_h: 250,
						grids: {},
						counter: false,
						h_counter: false,
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false
						},
						cssclass: ''
					}
				}
				
			},
			brand: function () {
				return {
					node_type: 'brand',
					content: {
						title_status: true,
						title: {}
					},
					setting: {
						brand: {},
						prd_style: 'prd1',
						prd_view: 'grid',
						prd_limit: 8,
						image_w: 250,
						image_h: 250,
						grids: {},
						counter: false,
						h_counter: false,
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false
						},
						cssclass: ''
					}
					
				}
				
			},
			custom: function () {
				return {
					node_type: 'custom',
					content: {
						title_status: true,
						title: {}
					},
					setting: {
						products: [],
						prd_style: 'prd1',
						prd_view: 'grid',
						prd_limit: 8,
						image_w: 250,
						image_h: 250,
						grids: {},
						counter: false,
						h_counter: false,
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false
						},
						cssclass: ''
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
					viewtype: 'normal',
					container: 'bx'
				}
			}
		}
	}]);



	angular.module('rgen').controller('moduleProductgroups', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_productgroups') {
				$state.go('mod_productgroups.manage');
			};
	}]);

	angular.module('rgen').controller('moduleProductgroupsData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'productgroupsFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, productgroupsFactory, Mod, SweetAlert){

			$('body').addClass('single-level');

			// Tree Parameters
			$scope.parameters = {
				dragEnabled: true,
				emptyPlaceholderEnabled: false,
				maxDepth: 1,
				dragDelay: 0,
				dragDistance: 0,
				lockX: true,
				lockY: false,
				boundTo: '',
				spacing: 20,
				coverage: 50,
				enableExpandOnHover: false,
				callbacks:{
					dragStop: function (event) {

					},
					dropped: function(event) {
						console.log(event.dest.nodesScope);
					},
					accept: function(sourceNode, destNodes, destIndex) {
						var data = sourceNode.$element.attr('type');
						var destType = destNodes.$element.attr('type');
						return (data == destType); // only accept the same type
					}
				}
			};

			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix  : 'rgen_',
				group   : 'rgen_module',
				section : 'productgroups',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Product groups';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modConetnt = {};

			/* Default tabs
			------------------------*/
			$scope.tpl = {
				common : tpl('modules/productgroups/common'),
				manage : tpl('modules/productgroups/manage_form')
			}
			$scope.manage_tabs = [
				{ label:'Common'       , val:'common' },
				{ label:'Manage Items' , val:'manage' }
			];
			$scope.manage_tab = 'common';
			$scope.tabtype = function (type) {
				Loader.on('.rgen-container');
				$scope.manage_tab = type;
				setTimeout(function(){ Loader.off('.rgen-container'); }, 200);
			}
			/*----------------------*/

			// Hover effects
			$scope.h_effects = [
				{ label:'None' , val:'n' }
			];
			var effectrange = _.range(1, 7);
			_.map(effectrange, function(s){
				$scope.h_effects.push({ label: String(s), val: String(s) });
			});

			// Column sizes
			$scope.col_sizes = [];
			var sizerange = _.range(2, 11);
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
				{ label:'Right', val:'r' }
			];

			// Assign display
			$scope.displaytype = [
				{ label:'Tab', val:'tab' },
				{ label:'Normal', val:'normal' }
			];

			
			// Common settings
			$scope.modConetnt.common = new productgroupsFactory.common();
			
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

			/* Menu process
			------------------------*/
			$scope.nodeRemove = function(scope) {
				SweetAlert.swal({
					title: "Are you sure?",
					text: "You wish to remove item?",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					closeOnConfirm: true
				},
				function(isConfirm){
					if (isConfirm) {
						scope.remove();
					}
				});
			};

			$scope.toggle = function(scope) {
			  scope.toggle();
			};

			// New item
			$scope.newItem = function() {
				if ($scope.modConetnt.data.length <= 20) {
					var temp 			= new productgroupsFactory.tree_node();
						//temp.node_type 	= "main";
						temp.item_data 	= new productgroupsFactory.special();
					$scope.modConetnt.data.push(temp);
				} else {
					Pop.pop_error('Maximum item limit reached.');
				};
			};
			
			$scope.createCustomFn = function () {
				$scope.newItem();
			}
			$scope.create = function () {
				// Common settings
				$scope.modConetnt.common = new productgroupsFactory.common();
				Mod.create($scope);
			}

			$scope.previewtype = function (type) {
				if (type == 'special') 	{ return type = 'Special offer products';  };
				if (type == 'latest') 	{ return type = 'Latest products';  };
				if (type == 'best') 	{ return type = 'Best seller products';  };
				if (type == 'category') { return type = 'Category products';  };
				if (type == 'brand')	{ return type = 'Brand products';  };
				if (type == 'custom') 	{ return type = 'Custom selected products';  };
				if (type == 'prd1') 	{ return type = 'Block 1';  };
				if (type == 'prd2') 	{ return type = 'Block 2';  };
				if (type == 'smallprd1') 	{ return type = 'Small block 1';  };
				if (type == 'smallprd2') 	{ return type = 'Small block 2';  };
				
			};

			$scope.popup = function (tplfile, item, depth) {
				var modalInstance = $modal.open({
					templateUrl: tplfile,
					controller: "moduleProductgroupsModal",
					backdrop: 'static',
					size: 'lg',
					resolve: {
						item: function () {	return item; },
						depth: function () { return depth; }
					}
				});
				modalInstance.result.then(function (response) {

				}, function(err){
					console.log(err);
				});
			}
			

			// Menu modal
			$scope.open = function(node, type, main) {
				var item = node.$modelValue;
				var depth = node.depth();
				var tplfile = tpl('modules/productgroups/'+type+'_modal');

				$scope.popup(tplfile, item, depth);
			}
		}
	]);
})();