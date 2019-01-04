(function(){
	'use strict';

	angular.module('rgen').controller('themeOcmodSlideshow', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		function($scope, Rest, Pop, Loader){

			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix   : 'rgen_',
				group    : 'rgen_theme',
				settings : 'rgen_settings',
				modgroup : false,
				section  : 'ocmodule',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.modList    = [
				{ name:'Slideshow module' , val:'ocmod_slideshow' }
			];

			$scope.dot_style = [
				{ label:'Style 1'      , val:1 },
				{ label:'Style 2'      , val:2 }
			];

			$scope.effect = [
				{ val:'bounce'             , name:'bounce' },
				{ val:'flash'              , name:'flash' },
				{ val:'pulse'              , name:'pulse' },
				{ val:'rubberBand'         , name:'rubberBand' },
				{ val:'shake'              , name:'shake' },
				{ val:'swing'              , name:'swing' },
				{ val:'tada'               , name:'tada' },
				{ val:'wobble'             , name:'wobble' },
				{ val:'bounceIn'           , name:'bounceIn' },
				{ val:'bounceInDown'       , name:'bounceInDown' },
				{ val:'bounceInLeft'       , name:'bounceInLeft' },
				{ val:'bounceInRight'      , name:'bounceInRight' },
				{ val:'bounceInUp'         , name:'bounceInUp' },
				{ val:'bounceOut'          , name:'bounceOut' },
				{ val:'bounceOutDown'      , name:'bounceOutDown' },
				{ val:'bounceOutLeft'      , name:'bounceOutLeft' },
				{ val:'bounceOutRight'     , name:'bounceOutRight' },
				{ val:'bounceOutUp'        , name:'bounceOutUp' },
				{ val:'fadeIn'             , name:'fadeIn' },
				{ val:'fadeInDown'         , name:'fadeInDown' },
				{ val:'fadeInDownBig'      , name:'fadeInDownBig' },
				{ val:'fadeInLeft'         , name:'fadeInLeft' },
				{ val:'fadeInLeftBig'      , name:'fadeInLeftBig' },
				{ val:'fadeInRight'        , name:'fadeInRight' },
				{ val:'fadeInRightBig'     , name:'fadeInRightBig' },
				{ val:'fadeInUp'           , name:'fadeInUp' },
				{ val:'fadeInUpBig'        , name:'fadeInUpBig' },
				{ val:'fadeOut'            , name:'fadeOut' },
				{ val:'fadeOutDown'        , name:'fadeOutDown' },
				{ val:'fadeOutDownBig'     , name:'fadeOutDownBig' },
				{ val:'fadeOutLeft'        , name:'fadeOutLeft' },
				{ val:'fadeOutLeftBig'     , name:'fadeOutLeftBig' },
				{ val:'fadeOutRight'       , name:'fadeOutRight' },
				{ val:'fadeOutRightBig'    , name:'fadeOutRightBig' },
				{ val:'fadeOutUp'          , name:'fadeOutUp' },
				{ val:'fadeOutUpBig'       , name:'fadeOutUpBig' },
				{ val:'flipInX'            , name:'flipInX' },
				{ val:'flipInY'            , name:'flipInY' },
				{ val:'flipOutX'           , name:'flipOutX' },
				{ val:'flipOutY'           , name:'flipOutY' },
				{ val:'lightSpeedIn'       , name:'lightSpeedIn' },
				{ val:'lightSpeedOut'      , name:'lightSpeedOut' },
				{ val:'rotateIn'           , name:'rotateIn' },
				{ val:'rotateInDownLeft'   , name:'rotateInDownLeft' },
				{ val:'rotateInDownRight'  , name:'rotateInDownRight' },
				{ val:'rotateInUpLeft'     , name:'rotateInUpLeft' },
				{ val:'rotateInUpRight'    , name:'rotateInUpRight' },
				{ val:'rotateOut'          , name:'rotateOut' },
				{ val:'rotateOutDownLeft'  , name:'rotateOutDownLeft' },
				{ val:'rotateOutDownRight' , name:'rotateOutDownRight' },
				{ val:'rotateOutUpLeft'    , name:'rotateOutUpLeft' },
				{ val:'rotateOutUpRight'   , name:'rotateOutUpRight' },
				{ val:'hinge'              , name:'hinge' },
				{ val:'rollIn'             , name:'rollIn' },
				{ val:'rollOut'            , name:'rollOut' },
				{ val:'zoomIn'             , name:'zoomIn' },
				{ val:'zoomInDown'         , name:'zoomInDown' },
				{ val:'zoomInLeft'         , name:'zoomInLeft' },
				{ val:'zoomInRight'        , name:'zoomInRight' },
				{ val:'zoomInUp'           , name:'zoomInUp' },
				{ val:'zoomOut'            , name:'zoomOut' },
				{ val:'zoomOutDown'        , name:'zoomOutDown' },
				{ val:'zoomOutLeft'        , name:'zoomOutLeft' },
				{ val:'zoomOutRight'       , name:'zoomOutRight' },
				{ val:'zoomOutUp'          , name:'zoomOutUp' },
				{ val:'slideInDown'        , name:'slideInDown' },
				{ val:'slideInLeft'        , name:'slideInLeft' },
				{ val:'slideInRight'       , name:'slideInRight' },
				{ val:'slideInUp'          , name:'slideInUp' },
				{ val:'slideOutDown'       , name:'slideOutDown' },
				{ val:'slideOutLeft'       , name:'slideOutLeft' },
				{ val:'slideOutRight'      , name:'slideOutRight' },
				{ val:'slideOutUp'         , name:'slideOutUp' }
			];

			$scope.themeDefault = function () {
				return {
					ocmod_slideshow: {
						status: true,
						speed: 450,
						interval: 4000,
						loop: true,
						autoplay: true,
						autoplay_hover: true,
						animateOut: 'fadeOut',
						animateIn: 'fadeIn',

						arrow: true,
						dots: true,
						dot_style: 1,
						
						dot_line: '#434444',
						dot_normal: { 
							background: '#ffffff', 
							w:25, h:25, 
							border:{ size_all: 5, radius_all: 20, color: '#434444' } 
						},
						dot_active: {
							background: '#ed5f79', 
							border: { size_all: 5, radius_all: 20, color: '#ffffff' },
							shadow: { 
								ver_l: 1,
								blur: 5,
								color: 'rgba(0, 0, 0, 0.3)'
							}
						},
						wrapper: {}
					}
				}
			}

			Rest.modGetsection('slideshow', 'oc_mods').then(function(response){
			}, function (error){
				Pop.pop_error(error);
			});


			$scope.getkey = function (id) {
				$scope.modId = null;
				$scope.modId = id;
				$scope.themeData = new $scope.themeDefault()[id];
				
				// Marge data from response
				Loader.on('.rgen-container');
				Rest.themeGetkey($scope.db.group, $scope.modId).then(function(response){
					$scope.themeData = $.extend(true, $scope.themeData, response.data);
					
					setTimeout(function(){
						$scope.$apply(function() {
							Loader.off('.rgen-container');	
						});
					}, 200);
				}, function (error){
					Pop.pop_error(error);
				});
				//=========================
			}
			$scope.getkey($scope.modList[0].val);

			// Reseting data
			$scope.reset     = function (id) { Pop.reset($scope, id); }
			$scope.resetData = function (id) {
				switch(id) {
					case 'ocmod_slideshow':
					$scope.themeData = new $scope.themeDefault()['ocmod_slideshow'];
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'ocmod_slideshow':
						return {
							ocmd_slideshow: {
								speed          : Rest.getVal($scope.themeData, 'speed', 450),
								interval       : Rest.getVal($scope.themeData, 'interval', 4000),
								loop           : Rest.getVal($scope.themeData, 'loop', true),
								autoplay       : Rest.getVal($scope.themeData, 'autoplay', true),
								autoplay_hover : Rest.getVal($scope.themeData, 'autoplay_hover', true),
								animateOut     : Rest.getVal($scope.themeData, 'animateOut', 'fadeOut'),
								animateIn      : Rest.getVal($scope.themeData, 'animateIn', 'fadeIn'),
								arrow          : Rest.getVal($scope.themeData, 'arrow', true),
								dots           : Rest.getVal($scope.themeData, 'dots', true),
								dot_style      : Rest.getVal($scope.themeData, 'dot_style', 1)
							}
						};
					break;
				}
			}
			
			$scope.save = function(){
				
				// Settings
				$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save data
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){
					
					if (_.size($scope.settings) > 0) {
						Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.settings);
					}

					if (_.size($scope.fonts) > 0) {
						// Save fonts
						Rest.themeSavefonts($scope.db.group, 'fonts', $scope.fonts).then(function(){
							Pop.pop_success(rgen_config.text_success);
							Loader.off('.rgen-container');
						}, function (error){
							Loader.off('.rgen-container');
							Pop.pop_error(error);
						});
					} else {
						Pop.pop_success(rgen_config.text_success);
						Loader.off('.rgen-container');
					};

				}, function (error){
					Loader.off('.rgen-container');
					Pop.pop_error(error);
				});
			}


	}]);

})();