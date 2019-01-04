(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenIcons',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_icons.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_icons_alone', 'dir'):
				tpl('rgen_icons', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@',
				config: '='
			},
			link: function(scope, element, attrs, ctrl) {
				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};
				scope.open = function(newscope) {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_icons_modal', 'dir'),
						controller: "rgenIconsModal",
						backdrop: 'static',
						size: 'lg',
						resolve: {
							ngModel: function () {
								return scope.ngModel;
							},
							config: function () {
								return scope.config;
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
			}, 
			controller: function($scope, $modal){}
		};
	}]);

	angular.module('rgenDirectives').controller('rgenIconsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'Loader',
		'ngModel', 
		'config',
		function($scope, $modalInstance, Rest, Pop, Loader, ngModel, config){

		$scope.modaldata = {
			status:		true,
			type: 		'ico',
			icon: 		'',
			size: 		'14px',
			color: 		'rgba(0,0,0,0.05)',

			image: 		'../image/no_image.png',
			bgsize: 	'auto',
			bgsize_w: 	'100%',
			bgsize_h: 	'100%',
			position: 	'center center',
			block_w: 	'',
			block_h: 	'',
			css: 		''

		};

		$scope.config = { 
			type: 'both',
			color: 1,
			size: 1,
			typebtn: 1
		}

		// Background size
		$scope.bgsize = [
			{ val: 'auto',		name: 'Auto' },
			{ val: 'cover', 	name: 'Cover' },
			{ val: 'contain', 	name: 'Contain' },
			{ val: 'wh',		name: 'Width x Height' },
			{ val: 'inherit', 	name: 'Inherit' }
		];

		// Font size
		$scope.icon_size = [];
		var sizerange = _.range(12, 201);
		_.map(sizerange, function(s){
			$scope.icon_size.push({ val:s+'px', name: s+'px' });
		});

		$scope.config = $.extend(true, $scope.config, config);
		$scope.modaldata = $.extend(true, $scope.modaldata, ngModel);

		if ($scope.config.type == 'both') {
			// Size types
			$scope.icon_types = [
				{ label:'Icon', val:'ico' },
				{ label:'Image', val:'img' }
			];	
		} else if ($scope.config.type == 'img') {
			// Size types
			$scope.icon_types = [
				{ label:'Image', val:'img' }
			];	
		}else {
			$scope.icon_types = [
				{ label:'Icon', val:'ico' }
			];
		};
		
		setTimeout(function(){
			Loader.on('.icon-manager');
			Rest.getIcons().then(function(response){
				
				$scope.select = function(icon) {
					$scope.modaldata.icon = '';
					$scope.selected = icon;
					$scope.modaldata.icon = $scope.selected;
				};
				$scope.isActive = function(icon) {
					var ic = $scope.selected === icon || $scope.modaldata.icon === icon ? true : false;
					return ic;
				};
				$scope.filter_reset = function() {
					$scope.search	= { class: '' };
				};
				

				// On pop up load
				$scope.icondata = response.data;
				$scope.selected = $scope.modaldata.icon != '' ? $scope.modaldata.icon : null;
				$scope.search	= { class: $scope.modaldata.icon };

				if ($scope.modaldata.type == 'ico') {
					$scope.selected = $scope.modaldata.icon;

					$scope.select($scope.modaldata.icon);
					$scope.isActive($scope.modaldata.icon);
				};

				Loader.off('.icon-manager');
			});
		}, 500);

		$scope.apply = function () {

			if ($scope.modaldata.type == 'ico' && $scope.config.type == 'ico' || 
				$scope.modaldata.type == 'ico' && $scope.config.type == 'both') {
				$scope.modaldata.css = $scope.config.size == 1 ? 'font-size: '+$scope.modaldata.size+';' : '';
				$scope.modaldata.css += $scope.config.color == 1 ? 'color: '+$scope.modaldata.color+';' : '';
			};
			if ($scope.modaldata.type == 'img' && $scope.config.type == 'img' || 
				$scope.modaldata.type == 'img' && $scope.config.type == 'both') {
				var img = $scope.modaldata.image.replace("../", "");
				if ($scope.modaldata.bgsize == 'wh') {
					$scope.modaldata.css  = 'background-size: '+ $scope.modaldata.bgsize_w +' '+ $scope.modaldata.bgsize_h +';';
					$scope.modaldata.css += 'background-position: '+ $scope.modaldata.position+';';
				}else{
					$scope.modaldata.css  = 'background-size: '+ $scope.modaldata.bgsize+';';
					$scope.modaldata.css += 'background-position: '+ $scope.modaldata.position+';';
				};
				$scope.modaldata.css += 'background-image: url('+ img + '); background-repeat: no-repeat;';
				$scope.modaldata.css += $scope.modaldata.block_w != '' ? 'width: '+ $scope.modaldata.block_w + 'px;' : '';
				$scope.modaldata.css += $scope.modaldata.block_h != '' ? 'height: '+ $scope.modaldata.block_h + 'px;' : '';
			};

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

