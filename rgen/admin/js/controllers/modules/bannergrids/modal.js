(function(){
	'use strict';
	angular.module('rgen').controller('moduleBannergridsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'bannergridsFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, bannergridsFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;
			
			// Default parameters
			$scope.modaldata  = new bannergridsFactory[$scope.item.node_type];
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modaldata  = $.extend(true, $scope.modaldata, $scope.item.item_data);

			$scope.block_title = $scope.item.node_title ? $scope.item.node_title : 'Block';
			
			/* Default tabs
			------------------------*/
			/*$scope.tpl = {
				common : tpl('modules/contentblocks/common'),
				manage : tpl('modules/contentblocks/manage_form')
			}*/
			$scope.manage_tabs = [
				{ label:'Setting'      , val:'setting' },
				{ label:'Image' , val:'image' },
				{ label:'Slider' , val:'slider' },
				{ label:'Content'      , val:'content' }
			];
			$scope.manage_tab = 'setting';
			$scope.tabtype = function (type) {
				Loader.on('.modal-body');
				$scope.manage_tab = type;
				setTimeout(function(){ Loader.off('.modal-body'); }, 200);
			}
			/*----------------------*/


			/* Block
			------------------------*/
			// Styles
			/*var stylerange = _.range(1, 5);
			$scope.styles = [];
			_.map(stylerange, function(s){
				$scope.styles.push({ label:s, val: s });
			});*/
			$scope.styles = [
				{ name:'Block 1' , val: '1' },
				{ name:'Block 2' , val: '2' },
				{ name:'Block 3' , val: '3' },
				{ name:'Block 4' , val: '4' },
				{ name:'Small block 1' , val: '_small1' },
				{ name:'Small block 2' , val: '_small2' }
			];

			// Banner type 
			$scope.bnr_type = [
				{ label:'Normal' , val: 'normal' },
				{ label:'Slider' , val: 'slider' }
			];

			// Hover effects
			$scope.h_effects = [
				{ label:'None' , val:'n' }
			];
			var effectrange = _.range(1, 7);
			_.map(effectrange, function(s){
				$scope.h_effects.push({ label: String(s), val: String(s) });
			});

			// Size range
			var bnr_size = _.range(1, 13);
			$scope.bnr_size = [];
			_.map(bnr_size, function(s){
				$scope.bnr_size.push({ label:s, val: s });
			});

			// gutter range
			$scope.bnr_gt = [
				{ name: 0, val: 0 },
				{ name: 1, val: 1 },
				{ name: 2, val: 2 },
				{ name: 5, val: 5 },
				{ name: 10, val: 10 },
				{ name: 15, val: 15 },
				{ name: 20, val: 20 },
				{ name: 25, val: 25 },
				{ name: 30, val: 30 },
				{ name: 35, val: 35 },
				{ name: 40, val: 40 },
				{ name: 45, val: 45 },
				{ name: 50, val: 50 },
				{ name: 55, val: 55 },
				{ name: 60, val: 60 }
			];

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

			// Margin range
			var marginrange = _.range(1, 101);
			$scope.marginrange = [];
			_.map(marginrange, function(s){
				$scope.marginrange.push({ name:s, val: s });
			});

			// Button styles
			$scope.btn_styles = [
				{ label:'Link' , val: 'lnk' },
				{ label:'Button' , val: 'btn' }
			];
			// Image type
			$scope.img_types = [
				{ label:'Image' , val: 'img' },
				{ label:'Icon' , val: 'ico' }
			];
			// Image resize type
			$scope.imgresize_types = [
				{ label:'Fill' , val: 'fill' },
				{ label:'Normal' , val: 'normal' }
			];

			// Title position
			$scope.title_positions = [
				{ label:'Above image' , val: 'above' },
				{ label:'Below image' , val: 'below' }
			];

			// Image position
			$scope.img_positions = [
				{ label:'Left' , val: 'l' },
				{ label:'Right' , val: 'r' }
			];

			/* Row
			------------------------*/
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
				{ label:'40', val:'gt40' },
				{ label:'50', val:'gt50' },
				{ label:'60', val:'gt60' }
			];
			// Column bottom margin
			$scope.margin_b = [
				{ label:'0', val:'mb0' },
				{ label:'1', val:'mb1' },
				{ label:'2', val:'mb2' },
				{ label:'4', val:'mb4' },
				{ label:'10', val:'mb10' },
				{ label:'16', val:'mb16' },
				{ label:'20', val:'mb20' },
				{ label:'26', val:'mb26' },
				{ label:'30', val:'mb30' },
				{ label:'40', val:'mb40' },
				{ label:'50', val:'mb50' },
				{ label:'60', val:'mb60' }
			];

			/* Column
			------------------------*/
			// Column size
			$scope.col_size = [];
			var colsizerange = _.range(1, 13);
			_.map(colsizerange, function(s){
				$scope.col_size.push({ label:s, val:'cl'+s });
			});

			$scope.lg_desktop_size = [];
			var lg_desktopsizerange = _.range(1, 13);
			_.map(lg_desktopsizerange, function(s){
				$scope.lg_desktop_size.push({ label:s, val:'cl'+s });
			});

			$scope.desktop_size = [];
			var desktopsizerange = _.range(1, 13);
			_.map(desktopsizerange, function(s){
				$scope.desktop_size.push({ label:s, val:' d-xl'+s });
			});

			$scope.tablet_size = [];
			var tabletsizerange = _.range(1, 13);
			_.map(tabletsizerange, function(s){
				$scope.tablet_size.push({ label:s, val:' t-xl'+s });
			});

			$scope.mob_xl_size = [];
			var mob_xlsizerange = _.range(1, 13);
			_.map(mob_xlsizerange, function(s){
				$scope.mob_xl_size.push({ label:s, val:' m-xl'+s });
			});

			$scope.mob_sm_size = [];
			var mob_smsizerange = _.range(1, 13);
			_.map(mob_smsizerange, function(s){
				$scope.mob_sm_size.push({ label:s, val:' m-sm'+s });
			});

			$scope.mob_xs_size = [];
			var mob_xssizerange = _.range(1, 13);
			_.map(mob_xssizerange, function(s){
				$scope.mob_xs_size.push({ label:s, val:' m-xs'+s });
			});

			/* View
			------------------------*/
			$scope.block_view = [
				{ label:'Carousel' , val: 'carousel' },
				{ label:'Grids'    , val: 'grid' }
			];

			// Carousel settings
			var itemrange = _.range(1, 11);
			$scope.item_range = [];
			_.map(itemrange, function(s){
				$scope.item_range.push({ label:s, val: s });
			});

			// Item margin
			$scope.item_margin = [
				{ label:'0', val: 0 },
				{ label:'1', val: 1 },
				{ label:'2', val: 2 },
				{ label:'5', val: 5 },
				{ label:'10', val: 10 },
				{ label:'15', val: 15 },
				{ label:'20', val: 20 },
				{ label:'30', val: 30 },
				{ label:'40', val: 40 },
				{ label:'50', val: 50 },
				{ label:'60', val: 60 },
				{ label:'70', val: 70 }
			];

			$scope.addImg = function () {
				$scope.modaldata.setting.slide_images.push({ 
					img: '../image/no_image.jpg', 
					alt:{},
					url: "",
					win: false
				});
			}
			$scope.removeImg = function ($index) {
				$scope.modaldata.setting.slide_images.splice($index, 1);
			}

			$scope.apply = function (response, type) {
				switch (type) {
					case "col":
						response.classGroup = response.lg_desktop+response.desktop+response.tablet+response.mob_xl+response.mob_sm+response.mob_xs;	
						$scope.item.item_data.column = response;
						break;

					case "content_view":
						$scope.item.item_data.content_view = response;
						break;

					case "row":
						$scope.item.item_data = response;
						break;

					case "block":
						$scope.item.node_title = $scope.block_title;
						$scope.item.item_data = response;
						break;

				}
				//$scope.item.item_data = response;
				$modalInstance.close($scope.item);
			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();