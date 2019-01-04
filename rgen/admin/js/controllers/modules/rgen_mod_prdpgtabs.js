(function(){
	'use strict';
	angular.module('rgen').factory('prdpgtabsFactory', [function () {
		return {
			tree_node: function () {
				return {
					depth: 1,
					status: true,
					node_type: "block", // Main - Row - Column - Item
					node_title: "Tab",
					item_data: {},
					items: []
				}
			},
			block: function () {
				return {
					node_type: 'block',
					content: {
						title: {},
						description: {}
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
					prd_page: 'all',
					products: {}
				}
			}
		}
	}]);



	angular.module('rgen').controller('modulePrdpgtabs', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_prdpgtabs') {
				$state.go('mod_prdpgtabs.manage');
			};
	}]);

	angular.module('rgen').controller('modulePrdpgtabsData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'prdpgtabsFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, prdpgtabsFactory, Mod, SweetAlert){

			$('body').addClass('single-level');

			var modKey = 'prdpgtabs';

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
				section : 'prdpgtabs',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Product page - tabs';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modConetnt = {};

			/* Default tabs
			------------------------*/
			$scope.tpl = {
				manage : tpl('modules/prdpgtabs/manage_form')
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
					if (type == 'block') {
						var title = 'Block';
						var item_data = new prdpgtabsFactory.block();
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
					var temp 			= new prdpgtabsFactory.tree_node();
						//temp.node_type 	= "main";
						temp.item_data 	= new prdpgtabsFactory.block();
					$scope.modConetnt.data.push(temp);
				} else {
					Pop.pop_error('Maximum item limit reached.');
				};
			};
			
			$scope.createCustomFn = function () {
				$scope.newItem();
			}

			$scope.create = function () {
				Mod.create($scope);
			}

			$scope.previewtype = function (type) {
				//if (type == 'special') 	{ return type = 'Special offer products';  };
			};

			$scope.popup = function (tplfile, item, depth, parent) {
				var modalInstance = $modal.open({
					templateUrl: tplfile,
					controller: "modulePrdpgtabsModal",
					backdrop: 'static',
					size: 'lg',
					resolve: {
						item: function () {	return item; },
						depth: function () { return depth; },
						parent: function () {	return parent; }
					}
				});
				modalInstance.result.then(function (response) {

				}, function(err){
					console.log(err);
				});
			}
			

			// Menu modal
			$scope.open = function(node, type, parent) {
				var item = node.$modelValue;
				var depth = node.depth();
				var tplfile = tpl('modules/prdpgtabs/'+type+'_modal');

				$scope.popup(tplfile, item, depth, parent);
			}
		}
	]);
})();