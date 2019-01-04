<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
	<a href="{{revomod_url}}" class="rgen-btn large highlighted btn-tr" style="right: 92px;">Manage sliders</a>
</div>
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Assign module</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		<div ng-repeat="module in modConetnt.data">
			<div class="rgen-panel dark" tooltip="Module name">
				<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
			</div>
			<section class="rgen-panel">
				<h2 class="hd">Assign module</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full">
						<rgen-onoff label="Status" data-ng-model="module.status"></rgen-onoff>
						<rgen-text label="Sort order" pholder="Sort order" size="w-mini" data-ng-model="module.sort_order"></rgen-text>
						<rgen-select label="Select module" selectdata="modList" size="w-large" data-ng-model="module.module_id"></rgen-select>

						<div class="field-box">
							<label>Select slider</label>
							<div class="fields">
								<span class="select inline w-large">
									<select ng-model="module.slider_id" ng-options="o.val as o.name for o in sliderList" ng-change="sliderSelect(module.slider_id)"></select>
								</span>
							</div>
						</div>

						<!-- <rgen-select label="Select slider" fn="sliderSelect(module.slider_id)" selectdata="sliderList" size="w-large" data-ng-model="module.slider_id"></rgen-select> -->

						<div class="field-box">
							<label>Select layout</label>
							<div class="fields">
								<span class="select inline w-large">
									<select data-ng-model="module.layout_id" data-ng-options="o.layout_id as o.name for o in layoutList" data-ng-change="layoutdata(module.layout_id)"></select>
								</span>
							</div>
						</div>
						<rgen-select label="Select position" selectdata="positionList" size="w-large" data-ng-model="module.position"></rgen-select>
						<rgen-radio radiodata="sizetype" size="mini" label="Slide show size" data-ng-model="module.slider_size"></rgen-radio>

						<rgen-radio radiodata="layout_width" size="mini" label="Container width" data-ng-model="module.container"></rgen-radio>
					</div>
				</div>
			</section>
		</div>
		
	</div>
</div>