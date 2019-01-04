(function(){
	'use strict';

	angular.module('rgen').controller('dashboardController', ['$scope', function($scope){
		$scope.url_prefix = rgen_config.url_prefix;
	}]);

})();


