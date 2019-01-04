(function(){
	"use strict";
	var rgen = angular.module('rgenServices', []);

	// Rest API
	rgen.factory('Rest', ['Method', function(Method){
		var url_main = 'index.php?route=module/rgen/rest&token='+rgen_config.token+'&parts=';
		var t = {0:'source/', 1:'theme/', 2:'settings/', 3:'module/', 4:'system/', 5:'modtheme/', 6:'themestorage/'};

		// :t/:f/:g/:s/:k/:i/:e
		return {

			/* Default source
			------------------------*/
			getSource          : function(){ return Method.get(url_main+t[0]+'Getsource'); },
			getFonts           : function(){ return Method.get(url_main+t[1]+'Getfonts'); },
			getIcons           : function(){ return Method.get(url_main+t[1]+'Geticons'); },
			getLayouts         : function(){ return Method.get(url_main+t[3]+'Getlayouts'); },

			/* Theme
			------------------------*/
			getActiveTheme     : function(){ return Method.get(url_main+t[2]+'Getkey/config/active_theme') },
			themeGetsection    : function(g,s){ return Method.get(url_main+t[1]+'Getsection/'+g+'/'+s); },
			themeGetkey        : function(g,k){ return Method.get(url_main+t[1]+'Getkey/'+g+'/'+k); },
			saveTheme          : function(theme){ return Method.post(url_main+t[2]+'Add/themelist/'+theme.val, theme); },
			
			removeTheme        : function(theme_id){ return Method.post(url_main+'removeTheme/'+theme_id); },
			setActiveTheme     : function(theme){ return Method.post(url_main+t[2]+'Edit/config/active_theme', theme); },
			themeEditsection   : function(g,s,v){ return Method.post(url_main+t[1]+'Editsection/'+g+'/'+s, v); },
			themeEditkey       : function(g,s,k,v){ return Method.post(url_main+t[1]+'Editkey/'+g+'/'+s+'/'+k, v); },
			themeSavefonts     : function(g,s,v){ return Method.post(url_main+t[1]+'Savefonts/'+g+'/'+s, v); },
			themeRemovekey     : function(g,k){ return Method.post(url_main+t[1]+'Removekey/'+g+'/'+k); },

			/* Theme storage
			------------------------*/
			storageGetlist     : function(g){ return Method.get(url_main+t[6]+'Getlist/'+g); },
			storageEditlist    : function(v){ return Method.post(url_main+t[6]+'Editlist', v); },

			storageNewtheme    : function(theme_id){ return Method.post(url_main+t[6]+'Newtheme/'+theme_id); },
			storageRemovetheme : function(theme_id){ return Method.post(url_main+t[6]+'Removetheme/'+theme_id); },
			storageLoadtheme   : function(theme_id){ return Method.get(url_main+t[6]+'Loadtheme/'+theme_id); },


			/* Module
			------------------------*/
			modGetsection      : function(g,s){ return Method.get(url_main+t[3]+'Getsection/'+g+'/'+s); },
			modGetkey          : function(g,k){ return Method.get(url_main+t[3]+'Getkey/'+g+'/'+k); },
			modEditsection     : function(g,s,v){ return Method.post(url_main+t[3]+'Editsection/'+g+'/'+s, v); },
			modEditkey         : function(g,s,k,v){ return Method.post(url_main+t[3]+'Editkey/'+g+'/'+s+'/'+k, v); },
			modAssign          : function(g,s,k,v){ return Method.post(url_main+t[3]+'Assign/'+g+'/'+s+'/'+k, v); },
			modRemovekey       : function(g,s,k){ return Method.post(url_main+t[3]+'Removekey/'+g+'/'+s+'/'+k); },

			modGetrevsliders   : function(g,k){ return Method.get(url_main+t[3]+'Getrevsliders'); },

			modthemeGetkey     : function(g,k){ return Method.get(url_main+t[5]+'Getkey/'+g+'/'+k); },
			modthemeEditkey    : function(g,s,k,v){ return Method.post(url_main+t[5]+'Editkey/'+g+'/'+s+'/'+k, v); },
			modthemeSavefonts  : function(g,s,v){ return Method.post(url_main+t[5]+'Savefonts/'+g+'/'+s, v); },
			modthemeRemovekey  : function(g,k){ return Method.post(url_main+t[5]+'Removekey/'+g+'/'+k); },

			modGetallmodules   : function(g){ return Method.get(url_main+t[3]+'Getallmodules/'+g); },
			

			/* Settings
			------------------------*/
			settingsGetkey     : function(g,k){ return Method.get(url_main+t[2]+'Getkey/'+g+'/'+k); },
			settingsSave       : function(g,s,v){ return Method.post(url_main+t[2]+'Save/'+g+'/'+s, v); },
			settingsEdit       : function(g,k,v){ return Method.post(url_main+t[2]+'Edit/'+g+'/'+k, v); },

			/* System
			------------------------*/
			backup             : function(data){ return Method.post(url_main+t[4]+'backup/', data); },
			restore            : function(data){ return Method.post(url_main+t[4]+'restore/', data); },
			backupremove       : function(item){ return Method.post(url_main+t[4]+'backupremove/'+item); },
			backuplist         : function(){ return Method.get(url_main+t[4]+'backuplist/'); },
			clear              : function(type, key){ 
				typeof key != "undefined" ? key : 'n';
				return Method.post(url_main+t[4]+'clear/'+type+'/'+key);
			},


			/* Other
			------------------------*/
			// catalog/product - catalog/manufacturers - catalog/category
			// getTypeahead    : function(type, val){ return Method.get('index.php?route=catalog/'+type+'/autocomplete&token='+rgen_config.token+'&filter_name=' +  encodeURIComponent(val)); },
			getTypeahead       : function(type, val){ return Method.get('index.php?route=module/rgen/autocomplete_'+type+'&token='+rgen_config.token+'&filter_name=' +  encodeURIComponent(val)); },
			getTypeaheadData   : function(type, id){ return Method.get(url_main+t[0]+type+'/'+id); },

			uid: function(){
				var uid = "";
				var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
				for(var i=0; i < 3; i++)
				uid += possible.charAt(Math.floor(Math.random() * possible.length));
				return 'rg'+uid;
				//return ("0000" + (Math.random()*Math.pow(36,4) << 0).toString(36)).slice(-4);
			},
			fontUrl: function(font){
				//fonts.googleapis.com/css?family=Lato:700,700italic|Open+Sans:400,600|Slabo+27px|Roboto:400,500&subset=latin,latin-ext,cyrillic-ext,greek-ext
				//return font.family+':'+font.variants+'&subset='+font.subsets
				if (font != '') {
					return font.family+':'+font.variants;
				} else {
					return false;
				};
			},
			findFonts: function (obj) {
				if (obj.type == "google" && obj.status == true) {
					var fontData = obj;
				} else {
					var fontData = _.find(obj, function(val){ return val.type == "google" && val.status == true; });
				};
				return { family: fontData ? this.fontUrl(fontData) : '', subset: fontData ? fontData.subsets : '' };
			},
			first: function (obj) {
				for (var k in obj) break;
				return k;
			},
			chk: function (data, u) {
				if (u == 'u') {
					return typeof data != "undefined" ? true : false;	
				} else {
					return typeof data != "undefined" && _.size(data) > 0 && data != '' ? true : false;	
				};
			},
			objChk: function (arr, keys) {
				if (_.hasPath(arr, keys)) {
					if (typeof _.getPath(arr, keys) === 'boolean') {
						return true;
					} else {
						return _.getPath(arr, keys) ? true : false;	
					};
				} else {
					return false;
				};
			},
			getVal: function (arr, keys, defaultVal) {
				return this.objChk(arr, keys) ? _.getPath(arr, keys) : defaultVal;
			},
			trimStr: function(str, length){
				var string = str;
				var length = length;
				if (str.length > length) {
					var trimmedString = string.substring(0, length)+' ...';
				} else {
					var trimmedString = string;
				};
				return trimmedString;
			},

			// Used in grid manager module
			modulelist: function () {
				return {
					list: [
						{ name: 'Mega menu'         , code: 'menu' },
						{ name: 'Basic slideshow'   , code: 'basicslideshow' },
						{ name: 'Basic banners'     , code: 'basicbanners' },
						{ name: 'Banner grids'      , code: 'bannergrids' },
						{ name: 'Image gallery'     , code: 'imagegallery' },
						{ name: 'Product groups'    , code: 'productgroups' },
						{ name: 'Custom HTML'       , code: 'customhtml' },
						{ name: 'Content blocks'    , code: 'contentblocks' },
						{ name: 'Revo slider'       , code: 'revslider' },
						{ name: 'Category showcase' , code: 'catshowcase' },
						{ name: 'Deals / Product showcase' , code: 'deals' }
					]
				}
			}
			
		}
	}]);
	
	// RGen Methods
	rgen.factory('Method', ['$http', '$q', function($http, $q){
		return {
			get: function(url){
				var defer = $q.defer();
				$http.get(url).then(
					function(response){
						//console.log(response);
						if (typeof(response.data) !== 'object' || response.data.status == 'error') {
							defer.reject('Invalid Data Request');
						}
						if (response.status != 200) {
							defer.reject('Invalid URL Request');
						};
						if (response.status == 200 && response.data.status == 'success') {
							//console.log(response.data);
							defer.resolve(response.data);
						}
						if (response.status == 200 && typeof(response) == 'array' || typeof(response) == 'object') {
							defer.resolve(response.data);
						}
					},
					function(status, error, response){
						defer.reject(response);
					}
				);
				return defer.promise;
			},
			post: function(url, data) {
				var defer = $q.defer();
				$http.post(url, data).then(
					function(response, data){
						//console.log(response);
						if (typeof(response.data) !== 'object' || response.data.status == 'error') {
							defer.reject('Invalid Data Request');
						}
						if (response.data.status == 'permission') {
							defer.reject(rgen_config.error_permission);
						};
						if (response.status != 200) {
							defer.reject('Invalid URL Request');
						};
						if(response.status == 200 && response.data.status == 'success') {
							defer.resolve(response.data);
						}
					},
					function(status, error, response){
						defer.reject(response);
					}
				);
				return defer.promise;
			}
		} 
	}]);

	// Loader factory
	rgen.factory('Loader', function(){
		return {
			on: function(element, bgColor, fsize, msg){
				var msg = msg && msg != '' ? msg : 'Please wait...';
				var bgColor = bgColor && bgColor != '' ? bgColor : '#fff';
				var fsize = fsize && fsize != '' ? fsize : '12px';

				$(element).block({
					css: { 
						top: '10%',
						border: 'none', 
						padding: '50px 20px 20px 20px', 
						backgroundColor: '#fff', 
						'-webkit-border-radius': '10px', 
						'-moz-border-radius': '10px', 
						opacity: 0.7, 
						color: '#333',
						fontSize: fsize,
						fontWeight: "normal"
					},
					overlayCSS:{ backgroundColor: bgColor, opacity: 0.8 },
					message: ''+msg+''
				});
			},
			off: function(element){
				$(element).unblock();
			}
		}
	});

	// Pop up factory
	rgen.factory('Pop', ['SweetAlert', function(SweetAlert){
		return {
			pop_error: function(msg){
				SweetAlert.swal({
					title: "Oops...", 
					text: msg, 
					type: "error"
				});
			},
			pop_success: function(msg){
				SweetAlert.swal({
					title: "Success !", 
					text: msg, 
					type: "success", 
					timer: 2000
				});
			},
			pop_confirm: function($scope){
				swal({
					title: $scope.t1,
					text: $scope.msg1, // You wish to remove module !
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					closeOnConfirm: false 
				},
				function(isConfirm){
					if (isConfirm) { 
						$scope.popConfirmTrue($scope); 
					} else if($scope.popConfirmFalse) { 
						$scope.popConfirmFalse($scope);
					}
				});

			},
			help: function(img){
				$.magnificPopup.open({items: {src: img},type: 'image'});
			},
			reset: function ($scope, id) {
				var pop = this;
				swal({
					title              : "Are you sure?",
					text               : "You wish to reset settings.",
					type               : "warning",
					showCancelButton   : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText  : "Yes",
					closeOnConfirm     : false
				},
				function(isConfirm){
					if (isConfirm) {
						$scope.resetData(id);
						pop.pop_success('Your settings has been reset.');
					}
				});
			}
		}
	}]);

})();
