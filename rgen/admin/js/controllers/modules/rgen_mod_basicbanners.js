(function(){
	'use strict';
	angular.module('rgen').factory('basicbannersFactory', [function () {
		return {
			common: function () {
				return {
					hoverstyle: "1",
					title: {},
					html: {},
					title_status: true,
					html_status: true
				}
			},
			tree_node: function () {
				return {
					depth: 1,
					status: true,
					node_type: "main", // Main - Row - Column - Item
					node_title: "Item",
					item_data: {}
				}
			},
			main: function () {
				return {
					banner: {
						title: {},
						img: '../image/no_image.jpg',
						url: '',
						win: false, // Open in new window	
					},
					hover: {
						icon: {},
						title:{},
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
					w: 600,
					h: 300,
					viewtype: 'grid',
					grids: {
						lg_desktop: 'eq4',
						desktop: 	'd-eq4',
						tablet: 	't-eq4',
						mob_xl: 	'mxl-eq2',
						mob_sm: 	'msm-eq2',
						mob_xs: 	'mxs-eq1',
						gutter: 	'gt10',
						margin_b: 	'mb10',
						classGroup:	'eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10'
					},
					carousel: {
						item_margin: 20,
						item_display: 5,
						display_items: {},
						arrows: true,
						dots: true
					},
					container: 'bx'
				}
			}
		}
	}]);



	angular.module('rgen').controller('moduleBasicbanners', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_basicbanners') {
				$state.go('mod_basicbanners.manage');
			};
	}]);

	angular.module('rgen').controller('moduleBasicbannersData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'basicbannersFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, basicbannersFactory, Mod, SweetAlert){

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
				section : 'basicbanners',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Basic banners';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modConetnt = {};

			// Hover effects
			$scope.h_effects = [
				{ label:'None' , val:'n' }
			];
			var effectrange = _.range(1, 7);
			_.map(effectrange, function(s){
				$scope.h_effects.push({ label: String(s), val: String(s) });
			});
			
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
					var temp 			= new basicbannersFactory.tree_node();
						temp.node_type 	= "main";
						temp.item_data 	= new basicbannersFactory.main();
					$scope.modConetnt.data.push(temp);
				} else {
					Pop.pop_error('Maximum item limit reached.');
				};
			};
			
			$scope.createCustomFn = function () {
				$scope.newItem();
			}

			// Common settings
			$scope.modConetnt.common = new basicbannersFactory.common();

			$scope.create = function () {
				$scope.modConetnt.common = new basicbannersFactory.common();
				Mod.create($scope);
			}

			/*$scope.previewtype = function (type) {
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
			};*/

			$scope.popup = function (tplfile, item, depth) {
				var modalInstance = $modal.open({
					templateUrl: tplfile,
					controller: "moduleBasicbannersModal",
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
				var tplfile = tpl('modules/basicbanners/'+type+'_modal');

				$scope.popup(tplfile, item, depth);
			}
		}
	]);
})();