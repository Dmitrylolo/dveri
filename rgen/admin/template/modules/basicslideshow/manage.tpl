<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	R.Gen Basic Slideshow
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<!-- Inner layout -->
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Create</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		
		<!--
		Module name
		=========================-->
		<div class="rgen-panel dark" tooltip="Module name">
			<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
		</div>
		

		<!--
		Common settings
		=========================-->
		<section class="rgen-panel">
			<h2 class="hd">Common settings</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full">
					<div class="field-box">
						<label>Speed and interval</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Speed</label>
									<input type="text" class="form-field w-mini" data-ng-model="modConetnt.common.speed">
								</li>
								<li>
									<label class="lbl">Interval</label>
									<input type="text" class="form-field w-mini" data-ng-model="modConetnt.common.pause">
								</li>
							</ul>
						</div>
					</div>
					<rgen-select label="Slide effect" selectdata="effect" data-ng-model="modConetnt.common.effect"></rgen-select>
					<div class="field-box">
						<label>Other settings</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Auto play</label>
									<rgen-onoff type="alone" data-ng-model="modConetnt.common.auto"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Loop</label>
									<rgen-onoff type="alone" data-ng-model="modConetnt.common.continuous"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Stop on hover</label>
									<rgen-onoff type="alone" data-ng-model="modConetnt.common.stoponhover"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Pager</label>
									<rgen-onoff type="alone" data-ng-model="modConetnt.common.pager"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Arrows</label>
									<rgen-onoff type="alone" data-ng-model="modConetnt.common.arrows"></rgen-onoff>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</section>

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
				
				{{main.node_title}}
				<br>
				<span class="img-preview"><img ng-src="{{main.item_data.slide}}" alt=""></span>
				
				<div class="btn-r show-btn">
			  		<div class="btn-wrp">
				  		<a class="rgen-btn mini fs16 remove highlighted" tooltip="Remove" ng-if="modConetnt.data.indexOf(main) !== 0" nodrag ng-click="nodeRemove(this)"><i class="fa fa-remove"></i></a>
				  		<a class="rgen-btn mini fs16" tooltip="Settings" nodrag ng-click="open(this, 'main', main)"><i class="fa fa-picture-o"></i></a>
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
			<ol ui-tree-nodes ng-model="modConetnt.data" type="main">
				<li ng-repeat="main in modConetnt.data" type="main" ui-tree-node ng-include="'main_renderer.html'"></li>
			</ol>
		</div>
	</div>
</div>
