(function(){
	'use strict';
	angular.module('rgen').factory('dealsFactory', [function () {
		return {
			common: function () {
				return {
					title_status: false,
					title: {},
					gt: 'gt0',
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
					node_type: "row", // Main - Row - Column - Item
					node_title: "Row",
					item_data: {},
					items: []
				}
			},
			row: function () {
				return {
					node_type: 'row',
					gutter: 'gt20',
					margin_b: 'mb20'
				}
			},
			col: function () {
				return {
					node_type : 'col',
					column: {
						col_size   : 'cl12',
						lg_desktop : 'cl12',
						desktop    : ' d-xl12',
						tablet     : ' t-xl12',
						mob_xl     : ' m-xl12',
						mob_sm     : ' m-sm12',
						mob_xs     : ' m-xs12',
						classGroup : 'cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12',
						border     : {}		
					}, 
					content_view: {
						style: 1,
						v_align: 'align-t', // Top, Middle
						view: 'grid',
						grids: {},
						conten_align: 'bl', // bl, 
						image_size: {
							main_w: 400,
							main_h: 400,
							sub_w: 100,
							sub_h: 100,
							resize_type: 'fill'
						},
						carousel: {
							margin: 20,
							display: 4,
							display_items: {},
							arrows: true,
							dots: false,

							autoplay: true,
							timeout: 3000,
							stoponhover: true,
							loop: true
						},
						slider: {
							animOut: 'fadeOut',
							animIn: 'fadeIn',
							autoplay: true,
							timeout: 3000,
							stoponhover: true,
							loop: true,
							arrows: true,
							dots: false
						},
						title:{
							status: false,
							text:{},
							block:{}
						},
						cssclass: ''
					}
					
				}
			},
			block: function () {
				return {
					node_type: 'block',
					content: {
						title: {},
						description: {},
						btn_text: {}
					},
					setting: {
						products: {},
						
						img_type: 'default',
						custom_img: '../image/no_image.jpg',
						img_position: 'l',

						sub_image_status: true,
						
						title: 'default',
						description: 'default',
						description_limit: 256,

						cat_status: true,
						rating_status: true,
						description_status: true,
						cart_status: true,
						wishlist_status: true,
						compare_status: true,
						
						cssclass: ''
					}
				}
			},
			assign: function () {
				return {
					module_id: '',
					layout_id: '',
					position: '',
					status: true,
					sort_order: 0,
					container: 'bx'
				}
			}
		}
	}]);



	angular.module('rgen').controller('moduleDeals', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_deals') {
				$state.go('mod_deals.manage');
			};
	}]);

	angular.module('rgen').controller('moduleDealsData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'dealsFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, dealsFactory, Mod, SweetAlert){

			$('body').removeClass('single-level');

			var modKey = 'deals';

			// Tree Parameters
			$scope.parameters = {
				dragEnabled: true,
				emptyPlaceholderEnabled: false,
				maxDepth: 10,
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
						/*console.log(event.dest.nodesScope);*/
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
				section : 'deals',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Deals showcase';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modConetnt = {};

			/* Default tabs
			------------------------*/
			$scope.tpl = {
				common : tpl('modules/deals/common'),
				manage : tpl('modules/deals/manage_form')
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
			$scope.collapseAll = function() {
				$scope.$broadcast('collapseAll');
			};
			$scope.expandAll = function() {
				$scope.$broadcast('expandAll');
			};

			$scope.newSubItem = function(scope, type) {
				if (scope.depth() < 11) {
					var nodeData = scope.$modelValue;
					var parentNodeData = scope.$parentNodesScope.$modelValue;
					var l = nodeData.items.length ? nodeData.items.length+1 : 1
					var d = scope.depth()+1;
					// Item data type
					if (type == 'col') {
						var title = 'Column';
						var item_data = new dealsFactory.col();
					}
					if (type == 'block') {
						var title = 'Block';
						var item_data = new dealsFactory.block();
					}
					if (type == 'copy') {
						var copy_data = angular.copy(nodeData);
					}
					if (type != 'copy') {
						nodeData.items.push({
							depth: d,
							status: true,
							node_type: type,
							node_title: title,
							item_data: item_data,
							items: []
						});
					} else {
						parentNodeData.push(copy_data);
					};
				} else {
					Pop.pop_error('Maximum depth limit reached.');
				};
			};

			// New item
			$scope.newItem = function() {
				if ($scope.modConetnt.data.length <= 20) {
					var temp 			= new dealsFactory.tree_node();
						//temp.node_type 	= "main";
						temp.item_data 	= new dealsFactory.row();
					$scope.modConetnt.data.push(temp);
				} else {
					Pop.pop_error('Maximum item limit reached.');
				};
			};
			
			$scope.createCustomFn = function () {
				$scope.newItem();
			}

			// Common settings
			$scope.modConetnt.common = new dealsFactory.common();
			
			$scope.create = function () {
				$scope.modConetnt.common = new dealsFactory.common();
				Mod.create($scope);
			}

			$scope.previewtype = function (type) {
				//if (type == 'special') 	{ return type = 'Special offer products';  };
			};

			$scope.popup = function (tplfile, item, depth) {
				var modalInstance = $modal.open({
					templateUrl: tplfile,
					controller: "moduleDealsModal",
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
				var tplfile = tpl('modules/deals/'+type+'_modal');

				$scope.popup(tplfile, item, depth);
			}
		}
	]);
})();