<!--
Tree template
=========================-->
<!-- ROW : Nested list template -->
<script type="text/ng-template" id="row_renderer.html">
	<div ui-tree-handle>

		<!--
		Left button and sort order
		=========================-->
		<b class="sort-order" tooltip="Sort Order">{{modConetnt.data.indexOf(row)}}</b>
		<div class="btn-l">
			<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
				<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
			</a>
		</div>
		
		<!--
		Item details
		=========================-->
		<h5 class="tree-hd">{{row.node_title}}</h5>
		<div class="detail-preview">
			<hr>
			<b class="rgen-lbl white"><i>Column gutter :</i> {{row.item_data.gutter}}</b>
			<b class="rgen-lbl white"><i>Margin bottom :</i> {{row.item_data.margin_b}}</b>
		</div>

		<!--
		Item buttons
		=========================-->
		<div class="btn-r show-btn">
			<div class="btn-wrp">
				<a class="rgen-btn mini remove highlighted fs16" tooltip="Remove" ng-if="modConetnt.data.indexOf(row) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Add column" nodrag ng-click="newSubItem(this, 'col', row)"><i class="fa fa-plus"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Column settings" nodrag ng-click="open(this, 'row', row)"><i class="fa fa-bars"></i></a>
			</div>
			<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="row.status"></rgen-onoff>
		</div>
	</div>

	<!--
	Sub items
	=========================-->
	<ol ui-tree-nodes ng-model="row.items" ng-class="{ 'hidden': collapsed }" type="col">
		<li ng-repeat="column in row.items" ui-tree-node type="col" ng-include="'col_renderer.html'"></li>
	</ol>
	
</script>

<!-- COLUMN : Nested list template -->
<script type="text/ng-template" id="col_renderer.html">
	<div ui-tree-handle>

		<!--
		Left button and sort order
		=========================-->
		<b class="sort-order" tooltip="Sort Order">{{row.items.indexOf(column)}}</b>
		<div class="btn-l">
			<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
				<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
			</a>
		</div>

		<!--
		Item details
		=========================-->
		<h5 class="tree-hd">{{column.node_title}}</h5>
		<div class="detail-preview">
			<hr>
			<b class="rgen-lbl white"><i>Style :</i> {{column.item_data.content_view.style}}</b>
			<b class="rgen-lbl white"><i>View :</i> {{column.item_data.content_view.view}}</b>
		</div>

		<!--
		Item buttons
		=========================-->
		<div class="btn-r show-btn">
	  		<div class="btn-wrp">
		  		<a class="rgen-btn mini remove highlighted fs16" tooltip="Remove" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Add blocks" nodrag ng-click="newSubItem(this, 'block')"><i class="fa fa-plus"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Content view style" nodrag ng-click="open(this, 'view', row)"><i class="fa fa-th-large"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Column sizes" nodrag ng-click="open(this, 'col', row)"><i class="fa fa-columns"></i></a>
			</div>
			<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="column.status"></rgen-onoff>
	  	</div>
	</div>

	<!--
	Sub items
	=========================-->
	<ol ui-tree-nodes ng-model="column.items" ng-class="{ 'hidden': collapsed }" type="item">
		<li ng-repeat="item in column.items" ui-tree-node type="item" ng-include="'item_renderer.html'"></li>
	</ol>
</script>

<!-- ITEM : Nested list template -->
<script type="text/ng-template" id="item_renderer.html">
	<div ui-tree-handle class="no-sub">
		<!--
		Left button and sort order
		=========================-->
		<b class="sort-order" tooltip="Sort Order">{{column.items.indexOf(item)}}</b>
		<!--<div class="btn-l">
			<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
				<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
			</a>
		</div>-->

		<!--
		Item details
		=========================-->
		<h5 class="tree-hd">{{item.item_data.setting.category.name}}</h5>
		<div class="detail-preview">
			<hr>
			<b class="rgen-lbl white"><i>Title :</i> {{item.item_data.setting.title}}</b>
			<b class="rgen-lbl white"><i>Description :</i> {{item.item_data.setting.description}}</b>
			<b class="rgen-lbl white"><i>Image size :</i> {{item.item_data.setting.image_w}} x {{item.item_data.setting.image_h}}</b>
			<b class="rgen-lbl white"><i>Sub limit :</i> {{item.item_data.setting.sub_limit}}</b>
		</div>

		<!--
		Item buttons
		=========================-->
		<div class="btn-r show-btn">
	  		<div class="btn-wrp">
		  		<a class="rgen-btn mini remove highlighted fs16" tooltip="Remove" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
		  		<a class="rgen-btn mini fs16" tooltip="Copy this block" nodrag ng-click="newSubItem(this, 'copy', column)"><i class="fa fa-files-o"></i></a>
				<a class="rgen-btn mini fs16" tooltip="Settings" nodrag ng-click="open(this, 'block', row)"><i class="fa fa-cog"></i></a>
			</div>
			<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="item.status"></rgen-onoff>
	  	</div>
	</div>

	<!--
	Sub items
	=========================
	<ol ui-tree-nodes ng-model="item.items" ng-class="{ 'hidden': collapsed }" type="item">
		<li ng-repeat="item in item.items" ui-tree-node type="item" ng-include="'item_renderer.html'"></li>
	</ol>-->
</script>

<!-- <b class="rgen-lbl" tooltip="Type">{{previewtype(main.node_type)}}</b>
<b ng-if="main.item_data.node_type == 'custom'" ng-repeat="product in main.item_data.setting.products" class="rgen-lbl">{{product)}}</b> -->
<div class="rgen-panel dark">
	<h4 class="h4 fl mr10-t mr0-b mr10-l">Manage items</h4>
	<a class="rgen-btn mini light fr mr5-t mr5-b mr5-r" tooltip="Add" nodrag ng-click="newItem()"><i class="fa fa-plus mr5-r"></i> Add</a>

	<a class="rgen-btn mini light fr mr5-t mr5-b mr20-r" ng-click="collapseAll()">Collapse all</a>
	<a class="rgen-btn mini light fr mr5-t mr5-b mr5-r" ng-click="expandAll()">Expand all</a>
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
	<div ui-tree-nodes ng-model="modConetnt.data" type="row">
		<div ng-repeat="row in modConetnt.data" type="row" ui-tree-node ng-include="'row_renderer.html'"></div>
	</div>
</div>