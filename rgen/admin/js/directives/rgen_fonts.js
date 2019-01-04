(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenFonts', ['$modal', 'Rest', function($modal, Rest) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_fonts_alone', 'dir'):
				tpl('rgen_fonts', 'dir');
			},
			//templateUrl: '../rgen/admin/template/directive/rgen_fonts.tpl',
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@'
			},
			link: function(scope, element, attrs, ctrl) {

				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};

				Rest.getFonts().then(function(response){
					scope.googlefonts = response.data.googlefonts.items
					scope.defaultfonts = response.data.websafefonts
					//console.log(scope.defaultfonts);

					scope.open = function(newscope) {
						var modalInstance = $modal.open({
							templateUrl: tpl('rgen_fonts_modal', 'dir'),
							controller: "rgenFontsModal",
							size: 'lg',
							backdrop: 'static',
							resolve: {
								ngModel: function () {
									return scope.ngModel;
								},
								googlefonts: function () {
									return scope.googlefonts;
								},
								defaultfonts: function () {
									return scope.defaultfonts;
								}
							}
						});
						modalInstance.result.then(function (response) {
							ctrl.$setViewValue(response);
							scope.ngModel = response;
						}, function(err){
							console.log(err);
						});
					}
				},function(){
					alert(error);
				});
				
			},
			controller: function($scope, $modal, Rest){}
		};
	}]);

	angular.module('rgenDirectives').controller('rgenFontsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'ngModel', 
		'googlefonts', 
		'defaultfonts', 
		function($scope, $modalInstance, Rest, ngModel, googlefonts, defaultfonts){
		
		$scope.fonts = {
			status:		false,
			type: 		'default',
			family: 	'Arial, Helvetica, sans-serif',
			variants: 	'regular',
			subsets: 	'latin',
			size: 		'13px',
			line_height: '1.2',
			style: 		'normal',
			weight:	    'normal',
			transform: 	'none',
			letter_spacing: '0px',
			color: 		'#666666',
			css: 		''
		}

		/*$scope.fonts.variants = ngModel.variants ? ngModel.variants : $scope.fonts.variants;
		console.log($scope.fonts.variants);*/
		$scope.fonts = $.extend(true, $scope.fonts, ngModel);
		
		// Font types
		$scope.font_types = [
			{ label:'Web safe fonts', val:'default' },
			{ label:'Google web fonts', val:'google' }
		];
		$scope.font_size = [];
		$scope.line_height = [];
		$scope.spacing = [];
		// Font style
		$scope.font_style = [
			{ val:'normal', name: 'Normal' },
			{ val:'italic', name: 'Italic' }
		];
		$scope.font_weight = [
			{ val:'normal', name: 'Normal' },
			{ val:'bold', name: 'Bold' },
			{ val:'inherit', name: 'Inherit' }
		];
		// Font transform
		$scope.text_transform = [
			{ val:'none', name: 'None' },
			{ val:'capitalize', name: 'Capitalize' },
			{ val:'uppercase', name: 'Uppercase' },
			{ val:'lowercase', name: 'Lowercase' }
		];
		// Fonts family
		$scope.google_family = [];
		$scope.default_family = [];

		// Font size
		var sizerange = _.range(9, 101);
		_.map(sizerange, function(s){
			$scope.font_size.push({ val:s+'px', name: s+'px' });
		});

		// Line height
		var heightrange = _.range(0.5, 3.1, 0.1);
		_.map(heightrange, function(s){
			$scope.line_height.push({ val:s.toFixed(1), name: s.toFixed(1) });
		});

		// Letter spacing
		var spacingrange = _.range(0, 20);
		_.map(spacingrange, function(s){
			$scope.spacing.push({ val:s+'px', name: s+'px' });
		});

		if ($scope.fonts.type == 'google') {
			$scope.gurl = '//fonts.googleapis.com/css?family='+$scope.fonts.family+':'+$scope.fonts.variants+'&subset='+$scope.fonts.subsets;	
			$scope.subsets_selected = $scope.fonts.subsets;
			$scope.variants_selected = $scope.fonts.variants;
			$scope.google_family_selected = $scope.fonts.family;
			$scope.default_family_selected = 'Arial, Helvetica, sans-serif';
		}else{
			$scope.gurl = '';
			$scope.subsets_selected = 'latin';
			$scope.variants_selected = 'regular';
			$scope.google_family_selected = 'ABeeZee';
			$scope.default_family_selected = $scope.fonts.family;
		};

		// Fonts collections
		_.map(googlefonts, function(f){
			var f_val = f.family.replace(/ /g,"+");
			$scope.google_family.push({ val:f_val, name: f.family });
		});
		_.map(defaultfonts, function(f){
			$scope.default_family.push({ val:f.family, name: f.family });
		});

		$scope.update = function(){
			
			if ($scope.fonts.type == 'default') {
				$scope.fonts.family = $scope.default_family_selected;
				$scope.gurl = '';
			}else{
				$scope.fonts.family = $scope.google_family_selected;
				$scope.fonts.subsets = $scope.subsets_selected;
				$scope.fonts.variants = $scope.variants_selected;
				$scope.gurl = '//fonts.googleapis.com/css?family='+$scope.google_family_selected+':'+$scope.variants_selected+'&subset='+$scope.subsets_selected;
			};

			var w = $scope.fonts.type == 'google' && $scope.variants_selected ? $scope.variants_selected.replace('italic','') : 'normal';
			var weight = w == 'regular' ? 'normal' : w;

			var family = $scope.fonts.family.replace(/\+/g," ");

			$scope.fonts.css  = 'font-family: '+family+'; ';
			$scope.fonts.css += 'font-size: '+$scope.fonts.size+'; ';
			$scope.fonts.css += 'line-height: '+$scope.fonts.line_height+'; ';
			$scope.fonts.css += 'font-style: '+$scope.fonts.style+'; ';
			if ($scope.fonts.type == 'default') {
				$scope.fonts.css += 'font-weight: '+$scope.fonts.weight+'; ';	
			}else {
				$scope.fonts.css += 'font-weight: '+weight+'; ';
			};
			$scope.fonts.css += 'color: '+$scope.fonts.color+'; ';
			$scope.fonts.css += 'text-transform: '+$scope.fonts.transform+'; ';
			$scope.fonts.css += 'letter-spacing: '+$scope.fonts.letter_spacing+';';
			//console.log($scope.fonts.css);
		}

		$scope.family_change = function (element) {
			// Filter key
			$scope.filter_subsets = _.filter(googlefonts, function(val, key){ 
				return val.family == $scope.google_family_selected.replace(/\+/g," ");
			});

			// Set subsets
			$scope.subsets = [];
			$scope.variants = [];

			_.map($scope.filter_subsets, function(s){
				_.map(s.subsets, function(e){
					$scope.subsets.push({ val:e, name: e });
				});
				_.map(s.variants, function(e){
					$scope.variants.push({ val:e, name: e });
				});
			});
			
			$scope.subsets_selected = ngModel.subsets ? ngModel.subsets : $scope.fonts.subsets;
			$scope.variants_selected = ngModel.variants ? ngModel.variants : $scope.fonts.variants;
			$scope.fonts.family = $scope.google_family_selected;
			$scope.update();
			//console.log($scope.fonts.family);
		};
		$scope.family_change();

		$scope.default_family_change = function (element) {
			$scope.fonts.family = $scope.default_family_selected;
			$scope.update();
		}

		$scope.apply = function () {
			$scope.update();
			$modalInstance.close($scope.fonts);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}]);	
	
})();

