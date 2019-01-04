(function(){
	'use strict';
	angular.module('rgen').factory('basicslideshowFactory', [function () {
		return {
			common: function () {
				return {
					effect: "slide",
					speed: 1500,
					auto: true,
					pause: 2000,
					continuous: true,
					stoponhover: true,
					pager: true,
					arrows: true
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
					title: {},
					slide: '../image/no_image.jpg',
					url: '',
					win: false // Open in new window
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
					sizetype: 'normal',
					beside: false,
					beside_size: 4,
					beside_gt: 'gt10'
				}
			}
		}
	}]);



	angular.module('rgen').controller('moduleBasicslideshow', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'mod_basicslideshow') {
				$state.go('mod_basicslideshow.manage');
			};
	}]);

	angular.module('rgen').controller('moduleBasicslideshowData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		'$timeout',
		'$modal',
		'basicslideshowFactory',
		'Mod',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, $state, $compile, $timeout, $modal, basicslideshowFactory, Mod, SweetAlert){

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
				section : 'basicslideshow',
				suffix  : '',
				assign  : '',
				type    : 'manage'
			}

			// Default parameters
			$scope.modType = 'new';
			$scope.modId = null;
			$scope.modStorage = {};
			$scope.namePrefix = 'Basic slideshow';
			$scope.modConetnt = {};

			// Slide effects
			$scope.effect = [
				{val: "blinds1"                         , name: "blinds1"},
				{val: "blinds1Up"                       , name: "blinds1Up"},
				{val: "blinds1Right"                    , name: "blinds1Right"},
				{val: "blinds1Down"                     , name: "blinds1Down"},
				{val: "blinds1Left"                     , name: "blinds1Left"},
				{val: "blinds2"                         , name: "blinds2"},
				{val: "blinds2Up"                       , name: "blinds2Up"},
				{val: "blinds2Right"                    , name: "blinds2Right"},
				{val: "blinds2Down"                     , name: "blinds2Down"},
				{val: "blinds2Left"                     , name: "blinds2Left"},
				{val: "fold"                            , name: "fold"},
				{val: "foldUp"                          , name: "foldUp"},
				{val: "foldRight"                       , name: "foldRight"},
				{val: "foldDown"                        , name: "foldDown"},
				{val: "foldLeft"                        , name: "foldLeft"},
				{val: "pushOut"                         , name: "pushOut"},
				{val: "pushOutUp"                       , name: "pushOutUp"},
				{val: "pushOutRight"                    , name: "pushOutRight"},
				{val: "pushOutDown"                     , name: "pushOutDown"},
				{val: "pushOutLeft"                     , name: "pushOutLeft"},
				{val: "pushIn"                          , name: "pushIn"},
				{val: "pushInUp"                        , name: "pushInUp"},
				{val: "pushInRight"                     , name: "pushInRight"},
				{val: "pushInDown"                      , name: "pushInDown"},
				{val: "pushInLeft"                      , name: "pushInLeft"},
				{val: "reveal"                          , name: "reveal"},
				{val: "revealUp"                        , name: "revealUp"},
				{val: "revealRight"                     , name: "revealRight"},
				{val: "revealDown"                      , name: "revealDown"},
				{val: "revealLeft"                      , name: "revealLeft"},
				{val: "slice"                           , name: "slice"},
				{val: "sliceUp"                         , name: "sliceUp"},
				{val: "sliceRight"                      , name: "sliceRight"},
				{val: "sliceDown"                       , name: "sliceDown"},
				{val: "sliceLeft"                       , name: "sliceLeft"},
				{val: "sliceReverse"                    , name: "sliceReverse"},
				{val: "sliceReverseUp"                  , name: "sliceReverseUp"},
				{val: "sliceReverseRight"               , name: "sliceReverseRight"},
				{val: "sliceReverseDown"                , name: "sliceReverseDown"},
				{val: "sliceReverseLeft"                , name: "sliceReverseLeft"},
				{val: "sliceRandom"                     , name: "sliceRandom"},
				{val: "sliceRandomUp"                   , name: "sliceRandomUp"},
				{val: "sliceRandomRight"                , name: "sliceRandomRight"},
				{val: "sliceRandomDown"                 , name: "sliceRandomDown"},
				{val: "sliceRandomLeft"                 , name: "sliceRandomLeft"},
				{val: "sliceReveal"                     , name: "sliceReveal"},
				{val: "sliceRevealUp"                   , name: "sliceRevealUp"},
				{val: "sliceRevealRight"                , name: "sliceRevealRight"},
				{val: "sliceRevealDown"                 , name: "sliceRevealDown"},
				{val: "sliceRevealLeft"                 , name: "sliceRevealLeft"},
				{val: "sliceRevealReverse"              , name: "sliceRevealReverse"},
				{val: "sliceRevealReverseUp"            , name: "sliceRevealReverseUp"},
				{val: "sliceRevealReverseRight"         , name: "sliceRevealReverseRight"},
				{val: "sliceRevealReverseDown"          , name: "sliceRevealReverseDown"},
				{val: "sliceRevealReverseLeft"          , name: "sliceRevealReverseLeft"},
				{val: "sliceRevealRandom"               , name: "sliceRevealRandom"},
				{val: "sliceRevealRandomUp"             , name: "sliceRevealRandomUp"},
				{val: "sliceRevealRandomRight"          , name: "sliceRevealRandomRight"},
				{val: "sliceRevealRandomDown"           , name: "sliceRevealRandomDown"},
				{val: "sliceRevealRandomLeft"           , name: "sliceRevealRandomLeft"},
				{val: "sliceFade"                       , name: "sliceFade"},
				{val: "sliceFadeUp"                     , name: "sliceFadeUp"},
				{val: "sliceFadeRight"                  , name: "sliceFadeRight"},
				{val: "sliceFadeDown"                   , name: "sliceFadeDown"},
				{val: "sliceFadeLeft"                   , name: "sliceFadeLeft"},
				{val: "zip"                             , name: "zip"},
				{val: "zipUp"                           , name: "zipUp"},
				{val: "zipRight"                        , name: "zipRight"},
				{val: "zipDown"                         , name: "zipDown"},
				{val: "zipLeft"                         , name: "zipLeft"},
				{val: "unzip"                           , name: "unzip"},
				{val: "unzipUp"                         , name: "unzipUp"},
				{val: "unzipRight"                      , name: "unzipRight"},
				{val: "unzipDown"                       , name: "unzipDown"},
				{val: "unzipLeft"                       , name: "unzipLeft"},
				{val: "boxRandom"                       , name: "boxRandom"},
				{val: "boxRandomGrowIn"                 , name: "boxRandomGrowIn"},
				{val: "boxRandomGrowInRounded"          , name: "boxRandomGrowInRounded"},
				{val: "boxRandomGrowOut"                , name: "boxRandomGrowOut"},
				{val: "boxRandomGrowOutRounded"         , name: "boxRandomGrowOutRounded"},
				{val: "boxRandomFlyIn"                  , name: "boxRandomFlyIn"},
				{val: "boxRandomFlyOut"                 , name: "boxRandomFlyOut"},
				{val: "boxRainUpLeft"                   , name: "boxRainUpLeft"},
				{val: "boxRainDownLeft"                 , name: "boxRainDownLeft"},
				{val: "boxRainDownRight"                , name: "boxRainDownRight"},
				{val: "boxRainUpRight"                  , name: "boxRainUpRight"},
				{val: "boxRainGrowInUpLeft"             , name: "boxRainGrowInUpLeft"},
				{val: "boxRainGrowInDownLeft"           , name: "boxRainGrowInDownLeft"},
				{val: "boxRainGrowInDownRight"          , name: "boxRainGrowInDownRight"},
				{val: "boxRainGrowInUpRight"            , name: "boxRainGrowInUpRight"},
				{val: "boxRainGrowInRoundedUpLeft"      , name: "boxRainGrowInRoundedUpLeft"},
				{val: "boxRainGrowInRoundedDownLeft"    , name: "boxRainGrowInRoundedDownLeft"},
				{val: "boxRainGrowInRoundedDownRight"   , name: "boxRainGrowInRoundedDownRight"},
				{val: "boxRainGrowInRoundedUpRight"     , name: "boxRainGrowInRoundedUpRight"},
				{val: "boxRainGrowOutUpLeft"            , name: "boxRainGrowOutUpLeft"},
				{val: "boxRainGrowOutDownLeft"          , name: "boxRainGrowOutDownLeft"},
				{val: "boxRainGrowOutDownRight"         , name: "boxRainGrowOutDownRight"},
				{val: "boxRainGrowOutUpRight"           , name: "boxRainGrowOutUpRight"},
				{val: "boxRainGrowOutRoundedUpLeft"     , name: "boxRainGrowOutRoundedUpLeft"},
				{val: "boxRainGrowOutRoundedDownLeft"   , name: "boxRainGrowOutRoundedDownLeft"},
				{val: "boxRainGrowOutRoundedDownRight"  , name: "boxRainGrowOutRoundedDownRight"},
				{val: "boxRainGrowOutRoundedUpRight"    , name: "boxRainGrowOutRoundedUpRight"},
				{val: "boxRainFlyInUpLeft"              , name: "boxRainFlyInUpLeft"},
				{val: "boxRainFlyInDownLeft"            , name: "boxRainFlyInDownLeft"},
				{val: "boxRainFlyInDownRight"           , name: "boxRainFlyInDownRight"},
				{val: "boxRainFlyInUpRight"             , name: "boxRainFlyInUpRight"},
				{val: "boxRainFlyOutUpLeft"             , name: "boxRainFlyOutUpLeft"},
				{val: "boxRainFlyOutDownLeft"           , name: "boxRainFlyOutDownLeft"},
				{val: "boxRainFlyOutDownRight"          , name: "boxRainFlyOutDownRight"},
				{val: "boxRainFlyOutUpRight"            , name: "boxRainFlyOutUpRight"},
				{val: "boxSpiralInWards"                , name: "boxSpiralInWards"},
				{val: "boxSpiralInWardsGrowIn"          , name: "boxSpiralInWardsGrowIn"},
				{val: "boxSpiralInWardsGrowInRounded"   , name: "boxSpiralInWardsGrowInRounded"},
				{val: "boxSpiralInWardsGrowOut"         , name: "boxSpiralInWardsGrowOut"},
				{val: "boxSpiralInWardsGrowOutRounded"  , name: "boxSpiralInWardsGrowOutRounded"},
				{val: "boxSpiralOutWards"               , name: "boxSpiralOutWards"},
				{val: "boxSpiralOutWardsGrowIn"         , name: "boxSpiralOutWardsGrowIn"},
				{val: "boxSpiralOutWardsGrowInRounded"  , name: "boxSpiralOutWardsGrowInRounded"},
				{val: "boxSpiralOutWardsGrowOut"        , name: "boxSpiralOutWardsGrowOut"},
				{val: "boxSpiralOutWardsGrowOutRounded" , name: "boxSpiralOutWardsGrowOutRounded"},
				{val: "fade"                            , name: "fade"},
				{val: "fadeOutIn"                       , name: "fadeOutIn"},
				{val: "foldRandomHorizontal"            , name: "foldRandomHorizontal"},
				{val: "foldRandomVertical"              , name: "foldRandomVertical"},
				{val: "slide"                           , name: "slide"},
				{val: "stackUp"                         , name: "stackUp"},
				{val: "stackUpReverse"                  , name: "stackUpReverse"},
				{val: "stackRight"                      , name: "stackRight"},
				{val: "stackRightReverse"               , name: "stackRightReverse"},
				{val: "stackDown"                       , name: "stackDown"},
				{val: "stackDownReverse"                , name: "stackDownReverse"},
				{val: "stackLeft"                       , name: "stackLeft"},
				{val: "stackLeftReverse"                , name: "stackLeftReverse"},
				{val: "random"                          , name: "random"}
			];
			
			// Common settings
			$scope.modConetnt.common = new basicslideshowFactory.common();
			
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
					var temp 			= new basicslideshowFactory.tree_node();
						temp.node_type 	= "main";
						temp.item_data 	= new basicslideshowFactory.main();
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

			$scope.popup = function (tplfile, item, depth) {
				var modalInstance = $modal.open({
					templateUrl: tplfile,
					controller: "moduleBasicslideshowModal",
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
				//var tpl = "../rgen/admin/template/modules/basicslideshow/"+type+"_modal.tpl";
				var tplfile = tpl('modules/basicslideshow/'+type+'_modal');

				$scope.popup(tplfile, item, depth);
			}
		}
	]);
})();