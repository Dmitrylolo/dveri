(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenImgupload', ['Rest', function(Rest) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: tpl('rgen_imgupload', 'dir'),
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_imgupload_alone', 'dir'):
				tpl('rgen_imgupload', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@'
			},
			link: function(scope, element, attrs, ctrl) {
				scope.block = '';
				scope.browse = function(){
					scope.block = $(element);
					$('#modal-image').remove();
					$.ajax({
						url: 'index.php?route=common/filemanager&token=' + rgen_config.token + '&target=' + scope.uploaded + '&thumb=' + scope.imgholder,
						dataType: 'html',
						beforeSend: function() {
							$(element).find('.browsebtn i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
							$(element).find('.browsebtn').prop('disabled', true);
						},
						complete: function() {
							$(element).find('.browsebtn i').replaceWith('<i></i>');
							$(element).find('.browsebtn').prop('disabled', false);
						},
						success: function(html) {
							$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
							$('#modal-image').modal('show');
						}
					});

					$(document).off('click', '#modal-image .thumbnail');
					$(document).on('click', '#modal-image .thumbnail', function(){
						//var img = '../image/'+$('#'+scope.uploaded).attr('value');
						var img = '../image/'+scope.block.find('.uploaded').attr('value');
						ctrl.$setViewValue(img);
					});
				}

				scope.reset = function(){
					var img 	= '#'+scope.uploaded;
					var thumb 	= '#'+scope.imgholder;

					$(thumb).find('img').attr('src', $(thumb).find('img').attr('data-placeholder'));
					$(img).attr('value', $(thumb).find('img').attr('data-placeholder'));
					ctrl.$setViewValue('../image/no_image.png');
				}

				

				ctrl.$render = function() {
					var img = '../image/'+ctrl.$viewValue;
					$('#'+scope.imgholder).find('img').attr('src', img);
					$('#'+scope.imgholder).html($('#'+scope.imgholder).html());
				};
			},
			controller: function($scope){
				$scope.uploaded = Rest.uid();
				$scope.imgholder = Rest.uid();
				$scope.noimg = rgen_config.no_image;
			}
		};
	}]);

	
})();

