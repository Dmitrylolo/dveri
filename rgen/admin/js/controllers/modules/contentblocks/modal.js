(function(){
	'use strict';
	angular.module('rgen').controller('moduleContentblocksModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'contentblocksFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, contentblocksFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;
			
			// Default parameters
			$scope.modaldata  = new contentblocksFactory[$scope.item.node_type];
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
				{ label:'Image / Icon' , val:'image' },
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