<div ng-repeat="module in modConetnt.data">
	<div class="rgen-panel dark" tooltip="Module name">
		<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
	</div>
	<section class="rgen-panel">
		<h2 class="hd">Assign module</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-medium">
				<rgen-onoff label="Status" data-ng-model="module.status"></rgen-onoff>
				<rgen-text label="Sort order" pholder="Sort order" size="w-mini" data-ng-model="module.sort_order"></rgen-text>
				<rgen-select label="Select module" selectdata="modList" size="w-large" data-ng-model="module.module_id"></rgen-select>

				<!-- <div class="field-box" style="display:none;">
					<label>Select layout</label>
					<div class="fields">
						<span class="select inline w-large">
							<select data-ng-model="module.layout_id" data-ng-options="o.layout_id as o.name for o in layoutList" data-ng-change="layoutdata(module.layout_id)"></select>
						</span>
					</div>
				</div> -->
				
				<rgen-radio radiodata="product_pages" size="mini" label="Display content on" data-ng-model="module.prd_page"></rgen-radio>
				<rgen-typeahead ng-if="module.prd_page == 'selected'" label="Select products" pholder="Enter text to search" size="w-full" searchtype="product" data-ng-model="module.products"></rgen-typeahead>

				<rgen-select label="Select position" selectdata="positionList" size="w-large" data-ng-model="module.position"></rgen-select>
				<rgen-radio radiodata="layout_width" size="mini" label="Container width" data-ng-model="module.container"></rgen-radio>
			</div>
		</div>
	</section>
</div>