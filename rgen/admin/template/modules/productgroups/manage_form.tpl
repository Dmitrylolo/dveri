<!--
Tree template
=========================-->
<!-- Nested list template -->
<script type="text/ng-template" id="main_renderer.html">
	<div ui-tree-handle class="no-sub">
		<b class="sort-order" tooltip="Sort Order">{{modConetnt.data.indexOf(main)}}</b>
		<div class="btn-l">
			<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
				<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
			</a>
		</div>
		
		<h5 class="tree-hd">{{previewtype(main.node_type)}}</h5>
		<div class="detail-preview">
			<div ng-if="main.item_data.node_type == 'custom'">
				<b ng-repeat="product in main.item_data.setting.products" class="rgen-lbl white">{{product.name}}</b>
			</div>
			<div ng-if="main.item_data.node_type == 'brand'">
				<b class="rgen-lbl white"><i>Brand :</i> {{main.item_data.setting.brand.name}}</b>
			</div>
			<div ng-if="main.item_data.node_type == 'category'">
				<b class="rgen-lbl white"><i>Category :</i> {{main.item_data.setting.category.name}}</b>
			</div>
			<hr>
			<b class="rgen-lbl white"><i>Product box :</i> {{previewtype(main.item_data.setting.prd_style)}}</b>
			<b class="rgen-lbl white"><i>View :</i> {{main.item_data.setting.prd_view}}</b>
			<b class="rgen-lbl white"><i>Limit :</i> {{main.item_data.setting.prd_limit}}</b>
			<b class="rgen-lbl white"><i>Image :</i> {{'w : ' + ' ' + main.item_data.setting.image_w + ' ' + ' x ' + ' h : ' + ' ' + main.item_data.setting.image_h}}</b>
		</div>
		<div class="btn-r show-btn">
			<div class="btn-wrp">
				<a class="rgen-btn mini remove highlighted fs16" tooltip="Remove" ng-if="modConetnt.data.indexOf(main) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Content" nodrag ng-click="open(this, 'content', main)"><i class="fa fa-pencil"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Settings" nodrag ng-click="open(this, 'main', main)"><i class="fa fa-cog"></i></a>
			</div>
			<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="main.status"></rgen-onoff>
		</div>
	</div>
	
</script>

<!-- <b class="rgen-lbl" tooltip="Type">{{previewtype(main.node_type)}}</b>
<b ng-if="main.item_data.node_type == 'custom'" ng-repeat="product in main.item_data.setting.products" class="rgen-lbl">{{product)}}</b> -->
<div class="rgen-panel dark">
	<h4 class="h4 fl mr10-t mr0-b mr10-l">Manage items</h4>
	<a class="rgen-btn mini light fr mr5-t mr5-b mr5-r" tooltip="Add" nodrag ng-click="newItem()"><i class="fa fa-plus mr5-r"></i> Add</a>
</div>
<div class="single-level" ui-tree="parameters" 
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
	<div ui-tree-nodes ng-model="modConetnt.data">
		<div ng-repeat="main in modConetnt.data" ui-tree-node ng-include="'main_renderer.html'"></div>
	</div>
</div>