<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	R.Gen Menu
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<!-- Inner layout -->
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Create menu</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		<!-- <rgen-typeahead label="Type head" pholder="Enter text to search" size="w-large" searchtype="info" data-ng-model="typeheadtest"></rgen-typeahead>
		<br><br><br><br> -->
		
		<div class="rgen-panel dark" tooltip="Module name">
			<input type="text" placeholder="Menu module" ng-model="modConetnt.name" class="form-field w-full large h-c">
		</div>
		<!-- Nested list template -->
		<script type="text/ng-template" id="main_renderer.html">
			<div ui-tree-handle>
				<b class="sort-order" tooltip="Sort Order">{{modConetnt.data.indexOf(main)}}</b>
				<div class="btn-l">
					<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
						<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
					</a>
				</div>
				
				{{sortTitle(main.node_title, 70)}}
				<br>
				<b class="rgen-lbl" tooltip="Type">Main item</b>
				<b class="rgen-lbl" tooltip="Sub menu type">{{previewtype(main.item_data.submenu_type)}}</b>
				<div class="btn-r">
			  		<div class="btn-wrp">
				  		<a class="rgen-btn mini remove highlighted" tooltip="Remove" ng-if="modConetnt.data.indexOf(main) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
				  		
				  		<!-- Submenu type is mega menu -->
				  		<a ng-if="main.item_data.submenu_type == 'mega'" class="rgen-btn mini" tooltip="Add" nodrag ng-click="newSubItem(this, 'row', main.item_data.submenu_type)"><i class="fa fa-plus"></i></a>
				  		
				  		<!-- Submenu type is Fly out menu -->
				  		<a ng-if="main.item_data.submenu_type == 'fly'" class="rgen-btn mini" tooltip="Add" nodrag ng-click="newSubItem(this, 'item', main.item_data.submenu_type)"><i class="fa fa-plus"></i></a>

				  		<a class="rgen-btn mini" tooltip="Settings" nodrag ng-click="open(this, 'main', main.item_data.submenu_type, main)"><i class="fa fa-cog"></i></a>
					</div>
					<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="main.status"></rgen-onoff>
			  	</div>
			</div>

			<!-- Submenu type is mega menu -->
			<ol ng-if="main.item_data.submenu_type == 'mega'" ui-tree-nodes ng-model="main.items" ng-class="{ 'hidden': collapsed }" type="row">
				<li ng-repeat="row in main.items" ui-tree-node type="row" ng-include="'row_renderer.html'"></li>
			</ol>

			<!-- Submenu type is Fly out menu -->
			<ol ng-if="main.item_data.submenu_type == 'fly'" ui-tree-nodes ng-model="main.items" ng-class="{ 'hidden': collapsed }" type="item">
				<li ng-repeat="item in main.items" ui-tree-node type="item" ng-include="'item_renderer.html'"></li>
			</ol>
		</script>

		<!-- Nested list template -->
		<script type="text/ng-template" id="row_renderer.html">
			<div ui-tree-handle ng-if="main.sub_type != 'n'">
				<b class="sort-order" tooltip="Sort Order">{{main.items.indexOf(row)}}</b>
				<div class="btn-l">
					<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
						<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
					</a>
				</div>
				
				{{row.node_title}}
				<br>
				<b class="rgen-lbl" tooltip="Type">Row</b>
				<div class="btn-r">
			  		<div class="btn-wrp">
				  		<a class="rgen-btn mini remove highlighted" tooltip="Remove" ng-if="modConetnt.data.indexOf(row) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
						<a class="rgen-btn mini" tooltip="Add" nodrag ng-click="newSubItem(this, 'col', main.item_data.submenu_type)"><i class="fa fa-plus"></i></a>
						<a class="rgen-btn mini" tooltip="Settings" nodrag ng-click="open(this, 'row', main.item_data.submenu_type, main)"><i class="fa fa-cog"></i></a>
					</div>
					<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="row.status"></rgen-onoff>
			  	</div>
			</div>
			<ol ui-tree-nodes ng-model="row.items" ng-class="{ 'hidden': collapsed }" type="col">
				<li ng-repeat="column in row.items" ui-tree-node type="col" ng-include="'col_renderer.html'"></li>
			</ol>
		</script>

		<!-- Nested list template -->
		<script type="text/ng-template" id="col_renderer.html">
			<div ui-tree-handle>
				<b class="sort-order" tooltip="Sort Order">{{row.items.indexOf(column)}}</b>
				<div class="btn-l">
					<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
						<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
					</a>
				</div>
				
				{{column.node_title}}
				<br>
				<b class="rgen-lbl" tooltip="Type">Column</b>
				<b class="rgen-lbl" tooltip="Column size">{{column.item_data.lg_desktop}}</b>
				
				<div class="btn-r">
			  		<div class="btn-wrp">
				  		<a class="rgen-btn mini remove highlighted" tooltip="Remove" ng-if="modConetnt.data.indexOf(column) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
						<a class="rgen-btn mini" tooltip="Add" nodrag ng-click="newSubItem(this, 'item', main.item_data.submenu_type)"><i class="fa fa-plus"></i></a>
						<a class="rgen-btn mini" tooltip="Settings" nodrag ng-click="open(this, 'col', main.item_data.submenu_type, main)"><i class="fa fa-cog"></i></a>
					</div>
					<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="column.status"></rgen-onoff>
			  	</div>
			</div>
			<ol ui-tree-nodes ng-model="column.items" ng-class="{ 'hidden': collapsed }" type="item">
				<li ng-repeat="item in column.items" ui-tree-node type="item" ng-include="'item_renderer.html'"></li>
			</ol>
		</script>

		<!-- Nested list template -->
		<script type="text/ng-template" id="item_renderer.html">
			<div ui-tree-handle>
				<b ng-if="main.item_data.submenu_type == 'mega'" class="sort-order" tooltip="Sort Order">{{column.items.indexOf(item)}}</b>
				<b ng-if="main.item_data.submenu_type == 'fly'" class="sort-order" tooltip="Sort Order">{{main.items.indexOf(item)}}</b>
				<div class="btn-l">
					<a class="rgen-btn light mini" nodrag ng-click="toggle(this)">
						<i class="fa" ng-class="{ 'fa-chevron-right': collapsed, 'fa-chevron-down': !collapsed }"></i>
					</a>
				</div>
				
				{{item.node_title}}
				<br>
				<b class="rgen-lbl" tooltip="Node type">Item</b>
				<b class="rgen-lbl" tooltip="Item type">{{previewtype(item.item_data.item_type)}}</b>
				<div class="btn-r">
			  		<div class="btn-wrp">
				  		<a class="rgen-btn mini remove highlighted" tooltip="Remove" ng-if="modConetnt.data.indexOf(item) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
						
						<a class="rgen-btn mini" 
						ng-if="item.item_data.item_type == 'normal'" 
						tooltip="Add" nodrag ng-click="newSubItem(this, 'item', main.item_data.submenu_type)"><i class="fa fa-plus"></i></a>
						
						<a class="rgen-btn mini" tooltip="Settings" nodrag ng-click="open(this, 'item', main.item_data.submenu_type, main)"><i class="fa fa-cog"></i></a>
					</div>
					<rgen-onoff type="alone" class="inline" label="Status" data-ng-model="item.status"></rgen-onoff>
			  	</div>
			</div>
			<ol ui-tree-nodes ng-model="item.items" ng-class="{ 'hidden': collapsed }" type="item">
				<li ng-repeat="item in item.items" ui-tree-node type="item" ng-include="'item_renderer.html'"></li>
			</ol>
		</script>
		
		<div class="rgen-panel dark">
			<h4 class="h4 fl mr10-t mr0-b mr10-l">Manage menu items</h4>
			<a class="rgen-btn mini light fr mr5-t mr5-b mr5-r" tooltip="Add" nodrag ng-click="newItem()"><i class="fa fa-plus mr5-r"></i> Add menu item</a>

			<a class="rgen-btn mini light fr mr5-t mr5-b mr20-r" ng-click="collapseAll()">Collapse all</a>
          	<a class="rgen-btn mini light fr mr5-t mr5-b mr5-r" ng-click="expandAll()">Expand all</a>
		</div>
		<div ui-tree="parameters" 
				callbacks="parameters.callbacks" 
				drag-enabled="parameters.dragEnabled" 
				empty-placeholder-enabled="parameters.emptyPlaceholderEnabled" 
				max-depth="parameters.maxDepth" 
				drag-delay="parameters.dragDelay" 
				drag-distance="parameters.dragDistance" 
				lock-x="parameters.lockX" 
				lock-y="parameters.lockY" 
				bound-to="parameters.boundTo" 
				spacing="parameters.spacing" 
				coverage="parameters.coverage" 
				expand-on-hover="parameters.enableExpandOnHover">
			<ol ui-tree-nodes ng-model="modConetnt.data" type="main">
				<li ng-repeat="main in modConetnt.data" type="main" ui-tree-node ng-include="'main_renderer.html'"></li>
			</ol>
		</div>
	</div>
</div>
