<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>	
</div>
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Assign menu</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		<div ng-repeat="module in modConetnt.data">
			<div class="rgen-panel dark" tooltip="Module name">
				<input type="text" placeholder="Menu module" ng-model="modConetnt.name" class="form-field w-full large h-c">
			</div>
			<section class="rgen-panel">
				<h2 class="hd">Assign module</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full">
						<rgen-onoff label="Status" data-ng-model="module.status"></rgen-onoff>
						<rgen-text label="Sort order" pholder="Sort order" size="w-mini" data-ng-model="module.sort_order"></rgen-text>
						<rgen-select label="Select module" selectdata="modList" size="w-large" data-ng-model="module.module_id"></rgen-select>

						<div class="field-box">
							<label>Select layout</label>
							<div class="fields">
								<span class="select inline w-large">
									<select data-ng-model="module.layout_id" data-ng-options="o.layout_id as o.name for o in layoutList" data-ng-change="layoutdata(module.layout_id)"></select>
								</span>
							</div>
						</div>
						<rgen-select label="Select position" selectdata="positionList" size="w-large" data-ng-model="module.position"></rgen-select>
						<rgen-radio radiodata="layout_styles" label="Display type" data-ng-model="module.type"></rgen-radio>
						<rgen-radio radiodata="alignment" label="Alignment" data-ng-model="module.align"></rgen-radio>
						<rgen-radio radiodata="layout_width" label="Width" data-ng-model="module.menuwidth"></rgen-radio>
					</div>
				</div>
			</section>
		</div>
		
	</div>
</div>