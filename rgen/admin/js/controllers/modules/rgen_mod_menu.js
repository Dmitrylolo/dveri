(function(){
	'use strict';
	angular.module('rgen').controller('moduleMenu', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_menu') {
				$state.go('mod_menu.manage');
			};
	}]);

	angular.module('rgen').controller('moduleMenuData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'menuFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, menuFactory, Mod, SweetAlert){
			
			$('body').removeClass('single-level');

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
					dragStop: function (event) {},
					dropped: function(event) {
						//console.log(event.dest.nodesScope.depth());
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
				section : 'menu',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Menu';
			$scope.modConetnt = {};

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
				/*$scope.t1 = "Are you sure?"; 
				$scope.msg1 = "You wish to remove module !";
				Pop.pop_confirm($scope);*/
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
			/*$scope.popConfirmTrue = function ($scope) {
				Mod.remove($scope);
			};*/

			/* Menu process
			------------------------*/
			$scope.nodeRemove = function(scope) {
				SweetAlert.swal({
					title: "Are you sure?",
					text: "You wish to remove menu item?",
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

			$scope.newSubItem = function(scope, type, submenu_type) {
				if (scope.depth() < 11) {
					var nodeData = scope.$modelValue;
					var l =  nodeData.items.length ? nodeData.items.length : 1
					var d = scope.depth()+1;

					// Item data type
					if (type == 'row') {
						var title = 'Row item';
						var item_data = new menuFactory.row();
					} else if (type == 'col') {
						var title = 'Column item';
						var item_data = new menuFactory.col();
					} else if (type == 'item') {
						var title = 'Menu item';
						var item_data = new menuFactory.item();
					}
					nodeData.items.push({
						id: nodeData.id + '-' + l,
						depth: d,
						status: true,
						node_type: type,
						node_title: title,
						submenu_type: submenu_type,
						item_data: item_data,
						items: []
					});
				} else {
					Pop.pop_error('Maximum depth limit reached.');
				};
			};

			// New menu item
			$scope.newItem = function() {
				if ($scope.modConetnt.data.length <= 12) {
					var temp 			= new menuFactory.tree_node();
						temp.id 		= $scope.modConetnt.data.length;
						temp.node_type 	= "main";
						temp.item_data 	= new menuFactory.main();
					$scope.modConetnt.data.push(temp);
				} else {
					Pop.pop_error('Maximum menu item limit reached.');
				};
			};
			
			$scope.createCustomFn = function () {
				$scope.newItem();
			}
			$scope.create = function () {
				Mod.create($scope);
			}

			$scope.previewtype = function (type) {
				if (type == 'normal') 	{ return type = 'Normal link';  };
				if (type == 'cat') 		{ return type = 'Category';  };
				if (type == 'prd') 		{ return type = 'Products';  };
				if (type == 'brand') 	{ return type = 'Brands';  };
				if (type == 'bannerimg'){ return type = 'Image';  };
				if (type == 'infobox') 	{ return type = 'Info boxes';  };
				if (type == 'customhtml'){ return type = 'Custom HTML';  };
				if (type == 'n') 		{ return type = 'None';  };
				if (type == 'fly') 		{ return type = 'Fly out menu';  };
				if (type == 'mega') 	{ return type = 'Mega menu';  };
			};

			$scope.sortTitle = function(str, length){
				return Rest.trimStr(str, length);
			}

			$scope.popup = function (tplfile, parentitem, menuitem, menuitem_depth) {
				var modalInstance = $modal.open({
					templateUrl: tplfile,
					controller: "moduleMenuModal",
					size: 'lg',
					resolve: {
						parentitem: function () {
							return parentitem;
						},
						menuitem: function () {
							return menuitem;
						},
						menuitem_depth: function () {
							return menuitem_depth;
						}

					}
				});
				modalInstance.result.then(function (response) {

				}, function(err){
					console.log(err);
				});
			}

			// Menu modal
			$scope.open = function(node, type, submenu_type, main) {
				
				node.$modelValue.submenu_type = main.item_data.submenu_type;
				var parentitem = main ? main : null;
				var menuitem = node.$modelValue;
				var menuitem_depth = node.depth();
				//var tpl = "../rgen/admin/template/modules/menu/menu_"+type+"_modal.tpl";
				var tplfile = tpl('modules/menu/menu_'+type+'_modal');

				$scope.popup(tplfile, parentitem, menuitem, menuitem_depth);
			}
		}
	]);
})();