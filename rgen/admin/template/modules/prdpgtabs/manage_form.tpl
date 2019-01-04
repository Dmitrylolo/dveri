<!--
Tree template
=========================-->
<!-- ITEM : template -->
<script type="text/ng-template" id="item_renderer.html">
	<div ui-tree-handle class="no-sub">
		<!--
		Left button and sort order
		=========================-->
		<b class="sort-order" tooltip="Sort Order">{{modConetnt.data.indexOf(main)}}</b>
		
		<!--
		Item details
		=========================-->
		<h5 class="tree-hd" style="margin:0; padding: 10px;">{{main.node_title}}</h5>

		<!--
		Item buttons
		=========================-->
		<div class="btn-r show-btn">
	  		<div class="btn-wrp">
		  		<a class="rgen-btn mini remove highlighted fs16" tooltip="Remove" ng-if="modConetnt.data.indexOf(main) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
		  		<a class="rgen-btn mini fs16" tooltip="Copy this block" nodrag ng-click="newSubItem(this, 'copy', main)"><i class="fa fa-files-o"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Settings" nodrag ng-click="open(this, 'block', main)"><i class="fa fa-cog"></i></a>
			</div>
			<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="main.status"></rgen-onoff>
	  	</div>
	</div>
</script>

<div class="rgen-panel dark">
	<h4 class="h4 fl mr10-t mr0-b mr10-l">Manage items</h4>
	<a class="rgen-btn mini light fr mr5-t mr5-b mr5-r" tooltip="Add" nodrag ng-click="newItem()"><i class="fa fa-plus mr5-r"></i> Add</a>
</div>
<div ui-tree="parameters" 
		callbacks                 ="parameters.callbacks" 
		drag-enabled              ="parameters.dragEnabled" 
		empty-placeholder-enabled ="parameters.emptyPlaceholderEnabled" 
		max-depth                 ="parameters.maxDepth" 
		drag-delay                ="parameters.dragDelay" 
		drag-distance             ="parameters.dragDistance" 
		lock-x                    ="parameters.lockX" 
		lock-y                    ="parameters.lockY" 
		bound-to                  ="parameters.boundTo" 
		spacing                   ="parameters.spacing" 
		coverage                  ="parameters.coverage" 
		expand-on-hover           ="parameters.enableExpandOnHover">
	<div ui-tree-nodes ng-model="modConetnt.data" type="main">
		<div ng-repeat="main in modConetnt.data" type="main" ui-tree-node ng-include="'item_renderer.html'"></div>
	</div>
</div>