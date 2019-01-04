(function(){
	"use strict";
	var rgen = angular.module('rgenServices', []);

	rgen.factory('Loader', ['Method', function(Method){
		
		return {
			on: function(element, bgColor, msg){
				var msg = msg && msg != '' ? msg : 'Just a moment...';
				var bgColor = bgColor && bgColor != '' ? bgColor : '#000000';

				$(element).block({
					css: { 
						top: '10%',
						border: 'none', 
						padding: '50px 20px 20px 20px', 
						backgroundColor: '#333', 
						'-webkit-border-radius': '10px', 
						'-moz-border-radius': '10px', 
						opacity: 0.7, 
						color: '#fff',
						fontSize: '16px',
						fontWeight: "bold"
					},
					overlayCSS:{ backgroundColor: bgColor, opacity: 0.6 },
					message: ''+msg+''
				});
			},
			off: function(element){
				$(element).unblock();
			}
		}
	}]);

})();
