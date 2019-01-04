(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenLangcontent', ['$timeout', 'Pop', 'Loader',function($timeout, Pop, Loader) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_langtext.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_langcontent_alone', 'dir'):
				tpl('rgen_langcontent', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				pholder: '@',
				size: '@'
			},
			link: function(scope, element, attrs, ctrl) {
				scope.languages = rgen_config.language;

				scope.active = scope.languages[0].id;
				scope.lngtab = function(tab) {
					scope.active = tab;
				}

				$timeout(function () {
					element.find('.lng textarea').each(function() {
						var txtarea = this;
						$(txtarea).summernote({
							height: 200,
							onblur: function() { 
								updateModel();
							},
							onChange: function () {
								updateModel();
							}
						});
						$(txtarea).next('.note-editor').find('.dropdown-toggle').each(function() {
							$(this).off();
							$(this).on('click', function () {
								$(this).dropdown();
							}).click();
						});

						function updateModel() {
							scope.ngModel[$(txtarea).attr('data-id')] = $(txtarea).code();
							//ctrl.$setViewValue(scope.smnote);
						}
						ctrl.$render = function() {
							$(txtarea).code(ngModel);
						};
						scope.$watch('ngModel', function (val) {
							updateModel();
						});
						/*var scopedata = CKEDITOR.replace(this, {
							filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=' + rgen_config.token,
							filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=' + rgen_config.token,
							filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=' + rgen_config.token,
							filebrowserUploadUrl: 'index.php?route=common/filemanager&token=' + rgen_config.token,
							filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=' + rgen_config.token,
							filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=' + rgen_config.token
						});*/
					});
				}, 100);
			},
			controller: function($scope){
			}
		};
	}]);

	
})();

