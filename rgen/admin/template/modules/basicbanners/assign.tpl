<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>	
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
							<label>Select layout</label>
							<div class="fields">
								<span class="select inline w-large">
									<select data-ng-model="module.layout_id" data-ng-options="o.layout_id as o.name for o in layoutList" data-ng-change="layoutdata(module.layout_id)"></select>
								</span>
							</div>
						</div>
						<rgen-select label="Select position" selectdata="positionList" size="w-large" data-ng-model="module.position"></rgen-select>
						
						<div class="alert alert-warning mr10" ng-if="module.position == 'pos_sidess'">Set <strong>"Beside slideshow position ==> YES"</strong> and select <strong>"Slide show type ==> NORMAL"</strong> on <strong>Basic slide show > Assign</strong> screen to display banners beside slide show</div>

						<div class="field-box">
							<label>Width x Height</label>
							<div class="fields">
								<input type="text" tooltip="Width" class="form-field w-mini inline" data-ng-model="module.w"> x 
								<input type="text" tooltip="Height" class="form-field w-mini inline" data-ng-model="module.h">
								<div class="help-text">Value will apply in PX</div>
							</div>
						</div>

						<rgen-radio radiodata="banner_viewtype" size="mini" label="Banner display style" data-ng-model="module.viewtype"></rgen-radio>
						<div ng-if="module.viewtype == 'grid'">
							<h3 class="rgen-hd-1">Grid settings</h3>
							<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="module.grids"></rgen-grids>	
						</div>

						<div ng-if="module.viewtype == 'carousel'">
							<h3 class="rgen-hd-1">Carousel settings</h3>
							<!-- <rgen-radio label="Display banner in row" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="module.carousel.item_display"></rgen-radio> -->
							<rgen-scrollitems label="Display items" buttonlabel="Edit" size="mini" data-ng-model="module.carousel.display_items"></rgen-scrollitems>
							<rgen-radio label="Space between banners" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="module.carousel.item_margin"></rgen-radio>
							<rgen-onoff label="Arrows" data-ng-model="module.carousel.arrows"></rgen-onoff>
							<rgen-onoff label="Dots" data-ng-model="module.carousel.dots"></rgen-onoff>
						</div>

						<rgen-radio radiodata="layout_width" size="mini" label="Container width" data-ng-model="module.container"></rgen-radio>

					</div>
				</div>
			</section>
		</div>
		
	</div>
</div>