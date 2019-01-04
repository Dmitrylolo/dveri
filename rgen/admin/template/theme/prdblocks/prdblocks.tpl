<div class="rgen-btn-group tab-group mr10-b">
	<label ng-repeat="data in prdblock_styles" class="rgen-btn" ng-model="prdblock_tab" btn-radio="data.val" ng-click="itemtype(data.val)">{{data.label}}</label>
	<a ng-click="helpImg(imgPath+'prdblocks.jpg')" class="help-tip fr mr2-t"><i class="fa fa-question-circle"></i></a>
</div>
<div ng-if="prdblock_tab == 1" ng-include="tpl.prd1"></div>
<div ng-if="prdblock_tab == 2" ng-include="tpl.prd2"></div>
<div ng-if="prdblock_tab == 3" ng-include="tpl.prd3"></div>
<div ng-if="prdblock_tab == 4" ng-include="tpl.prd4"></div>