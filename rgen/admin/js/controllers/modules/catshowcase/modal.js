(function(){
	'use strict';
	angular.module('rgen').controller('moduleCatshowcaseModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'catshowcaseFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, catshowcaseFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;
			
			// Default parameters
			$scope.modaldata  = new catshowcaseFactory[$scope.item.node_type];
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
				{ label:'Setting' , val:'setting' },
				{ label:'Image'   , val:'image' },
				{ label:'Content' , val:'content' }
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
			
			// Image type 
			$scope.data_types = [
				{ label:'Default' , val: 'default' },
				{ label:'Custom' , val: 'custom' }
			];

			// Image resize type
			$scope.imgresize_types = [
				{ label:'Fill' , val: 'fill' },
				{ label:'Normal' , val: 'normal' }
			];

			// Button styles
			$scope.btn_styles = [
				{ label:'Link' , val: 'lnk' },
				{ label:'Button' , val: 'btn' }
			];

			// Limit
			var limitrange = _.range(1, 31);
			$scope.limit_range = [];
			_.map(limitrange, function(s){
				$scope.limit_range.push({ name:s, val: s });
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

			// Image resize type
			$scope.imgresize_types = [
				{ label:'Fill' , val: 'fill' },
				{ label:'Normal' , val: 'normal' }
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
			// Style settings
			var stylerange = _.range(1, 5);
			$scope.style_range = [];
			_.map(stylerange, function(s){
				$scope.style_range.push({ label:s, val: s });
			});

			$scope.block_view = [
				{ label:'Carousel' , val: 'carousel' },
				{ label:'Grids'    , val: 'grid' }
				/*{ label:'Tabs'    , val: 'tab' }*/
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

			// Slide effects
			$scope.effect = [
				{ val: "bounce"             , name: "bounce" },
				{ val: "flash"              , name: "flash" },
				{ val: "pulse"              , name: "pulse" },
				{ val: "rubberBand"         , name: "rubberBand" },
				{ val: "shake"              , name: "shake" },
				{ val: "swing"              , name: "swing" },
				{ val: "tada"               , name: "tada" },
				{ val: "wobble"             , name: "wobble" },
				{ val: "jello"              , name: "jello" },

				{ val: "bounceIn"           , name: "bounceIn" },
				{ val: "bounceInDown"       , name: "bounceInDown" },
				{ val: "bounceInLeft"       , name: "bounceInLeft" },
				{ val: "bounceInRight"      , name: "bounceInRight" },
				{ val: "bounceInUp"         , name: "bounceInUp" },

				{ val: "bounceOut"          , name: "bounceOut" },
				{ val: "bounceOutDown"      , name: "bounceOutDown" },
				{ val: "bounceOutLeft"      , name: "bounceOutLeft" },
				{ val: "bounceOutRight"     , name: "bounceOutRight" },
				{ val: "bounceOutUp"        , name: "bounceOutUp" },


				{ val: "fadeIn"             , name: "fadeIn" },
				{ val: "fadeInDown"         , name: "fadeInDown" },
				{ val: "fadeInDownBig"      , name: "fadeInDownBig" },
				{ val: "fadeInLeft"         , name: "fadeInLeft" },
				{ val: "fadeInLeftBig"      , name: "fadeInLeftBig" },
				{ val: "fadeInRight"        , name: "fadeInRight" },
				{ val: "fadeInRightBig"     , name: "fadeInRightBig" },
				{ val: "fadeInUp"           , name: "fadeInUp" },
				{ val: "fadeInUpBig"        , name: "fadeInUpBig" },

				{ val: "fadeOut"            , name: "fadeOut" },
				{ val: "fadeOutDown"        , name: "fadeOutDown" },
				{ val: "fadeOutDownBig"     , name: "fadeOutDownBig" },
				{ val: "fadeOutLeft"        , name: "fadeOutLeft" },
				{ val: "fadeOutLeftBig"     , name: "fadeOutLeftBig" },
				{ val: "fadeOutRight"       , name: "fadeOutRight" },
				{ val: "fadeOutRightBig"    , name: "fadeOutRightBig" },
				{ val: "fadeOutUp"          , name: "fadeOutUp" },
				{ val: "fadeOutUpBig"       , name: "fadeOutUpBig" },

				{ val: "flip"               , name: "flip" },
				{ val: "flipInX"            , name: "flipInX" },
				{ val: "flipInY"            , name: "flipInY" },
				{ val: "flipOutX"           , name: "flipOutX" },
				{ val: "flipOutY"           , name: "flipOutY" },

				{ val: "lightSpeedIn"       , name: "lightSpeedIn" },
				{ val: "lightSpeedOut"      , name: "lightSpeedOut" },

				{ val: "rotateIn"           , name: "rotateIn" },
				{ val: "rotateInDownLeft"   , name: "rotateInDownLeft" },
				{ val: "rotateInDownRight"  , name: "rotateInDownRight" },
				{ val: "rotateInUpLeft"     , name: "rotateInUpLeft" },
				{ val: "rotateInUpRight"    , name: "rotateInUpRight" },

				{ val: "rotateOut"          , name: "rotateOut" },
				{ val: "rotateOutDownLeft"  , name: "rotateOutDownLeft" },
				{ val: "rotateOutDownRight" , name: "rotateOutDownRight" },
				{ val: "rotateOutUpLeft"    , name: "rotateOutUpLeft" },
				{ val: "rotateOutUpRight"   , name: "rotateOutUpRight" },

				{ val: "hinge"              , name: "hinge" },
				{ val: "rollIn"             , name: "rollIn" },
				{ val: "rollOut"            , name: "rollOut" },

				{ val: "zoomIn"             , name: "zoomIn" },
				{ val: "zoomInDown"         , name: "zoomInDown" },
				{ val: "zoomInLeft"         , name: "zoomInLeft" },
				{ val: "zoomInRight"        , name: "zoomInRight" },
				{ val: "zoomInUp"           , name: "zoomInUp" },

				{ val: "zoomOut"            , name: "zoomOut" },
				{ val: "zoomOutDown"        , name: "zoomOutDown" },
				{ val: "zoomOutLeft"        , name: "zoomOutLeft" },
				{ val: "zoomOutRight"       , name: "zoomOutRight" },
				{ val: "zoomOutUp"          , name: "zoomOutUp" },

				{ val: "slideInDown"        , name: "slideInDown" },
				{ val: "slideInLeft"        , name: "slideInLeft" },
				{ val: "slideInRight"       , name: "slideInRight" },
				{ val: "slideInUp"          , name: "slideInUp" },

				{ val: "slideOutDown"       , name: "slideOutDown" },
				{ val: "slideOutLeft"       , name: "slideOutLeft" },
				{ val: "slideOutRight"      , name: "slideOutRight" },
				{ val: "slideOutUp"         , name: "slideOutUp" }
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
						$modalInstance.close($scope.item);
						break;

					case "content_view":
						$scope.item.item_data.content_view = response.content_view;
						$modalInstance.close($scope.item);
						break;

					case "row":
						$scope.item.item_data = response;
						$modalInstance.close($scope.item);
						break;

					case "block":
						if (_.size(response.setting.category) == 0) {
							Pop.pop_error('Please select category to apply data.');
						} else {
							$scope.item.node_title = $scope.block_title;
							$scope.item.item_data = response;
							$modalInstance.close($scope.item);
						};
						
						break;

				}
				//$scope.item.item_data = response;
				
			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();