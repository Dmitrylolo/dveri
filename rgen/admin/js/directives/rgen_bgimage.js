(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenBgimage',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_bgimage.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_bgimage_alone', 'dir'):
				tpl('rgen_bgimage', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@',
				classname: '@'
			},
			link: function(scope, element, attrs, ctrl) {
				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};
				scope.open = function(newscope) {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_bgimage_modal', 'dir'),
						controller: "rgenBgimageModal",
						backdrop: 'static',
						size: 'lg',
						resolve: {
							ngModel: function () {
								return scope.ngModel;
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

	angular.module('rgenDirectives').controller('rgenBgimageModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'ngModel', 
		function($scope, $modalInstance, Rest, ngModel){
		
		// Default image data
		$scope.modaldata = {
			status:		true,
			image: 		'../image/no_image.png',
			position: 	'center center',
			position_x: '0',
			position_y: '0',
			repeat: 	'repeat',
			attachment: 'inherit',
			bgsize: 	'auto',
			bgsize_w: 	'100%',
			bgsize_h: 	'100%',
			css: 		''
		}

		$scope.modaldata = _.extend($scope.modaldata, ngModel);
		
		// Background position
		$scope.position = [
			{ val:'left top', 		name: 'Left Top' },
			{ val:'left center', 	name: 'Left Center' },
			{ val:'left bottom', 	name: 'Left Bottom' },
			{ val:'right top', 		name: 'Right Top' },
			{ val:'right center', 	name: 'Right Center' },
			{ val:'right bottom',	name: 'Right Bottom' },
			{ val:'center top',		name: 'Center Top' },
			{ val:'center center',	name: 'Center Center' },
			{ val:'center bottom',	name: 'Center Bottom' },
			{ val:'xy',				name: 'X-position - Y-position' }
		];

		// Background repeat
		$scope.repeat = [
			{ val: 'repeat', 	name: 'Repeat' },
			{ val: 'repeat-x', 	name: 'Repeat-x' },
			{ val: 'repeat-y', 	name: 'Repeat-y' },
			{ val: 'no-repeat', name: 'No-repeat' },
			{ val: 'inherit', 	name: 'Inherit' }
		];

		// Background attachment
		$scope.attachment = [
			{ val: 'scroll', 	name: 'Scroll' },
			{ val: 'fixed', 	name: 'Fixed' },
			{ val: 'inherit', 	name: 'Inherit' }
		];

		// Background size
		$scope.bgsize = [
			{ val: 'auto',		name: 'Auto' },
			{ val: 'cover', 	name: 'Cover' },
			{ val: 'contain', 	name: 'Contain' },
			{ val: 'wh',		name: 'Width x Height' },
			{ val: 'inherit', 	name: 'Inherit' }
		];

		$scope.apply = function () {
			if ($scope.modaldata.image != '../image/no_image.png') {
				var img = $scope.modaldata.image.replace("../", "");
				var bg_img = 'background-image: url('+ img + ');';
			}else{
				var bg_img = 'background-image: none;';
			}
			if ($scope.modaldata.position == 'xy') {
				var bg_pos = 'background-position: '+ $scope.modaldata.position_x +' '+ $scope.modaldata.position_y + ';';
			}else{
				var bg_pos = 'background-position: '+ $scope.modaldata.position+';';
			};
			if ($scope.modaldata.bgsize == 'wh') {
				var bg_size = 'background-size: '+ $scope.modaldata.bgsize_w +' '+ $scope.modaldata.bgsize_h + ';';
			}else{
				var bg_size = 'background-size: '+ $scope.modaldata.bgsize+';';
			};
			var bg_repeat = 'background-repeat: '+ $scope.modaldata.repeat+';';
			var bg_atta = 'background-attachment: '+ $scope.modaldata.attachment+';';

			$scope.modaldata.css = bg_img+bg_pos+bg_repeat+bg_size+bg_atta

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

