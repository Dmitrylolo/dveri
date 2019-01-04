<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<h2 class="hd">Select module from list</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full">
					<rgen-text label="Custom CSS class" size="w-medium" data-ng-model="modaldata.setting.cssclass"></rgen-text>
					<rgen-radio radiodata="block_types" label="Block content type" data-ng-model="modaldata.setting.block_type"></rgen-radio>
					
					<div ng-if="modaldata.setting.block_type == 'mod'">
						<h3 class="rgen-hd-1">Module selection</h3>
						<div class="field-box">
							<label>Select module</label>
							<div class="fields">
								<span class="select w-full">
									<select ng-model="selected_modulegroup" ng-options="o.code as o.name for o in modlist" ng-change="selectedMod(selected_modulegroup, 'module_group')">
										<option value=""> ======= Select module ======= </option>
									</select>
								</span>

								<span class="select w-full">
									<select ng-model="selected_moduleitem" ng-options="o.val as o.name for o in mod_items" ng-change="selectedMod(selected_moduleitem, 'module_item')">
										<option value=""> ======= Select module item ======= </option>
									</select>
								</span>
							</div>
						</div>	
					</div>
					<div ng-if="modaldata.setting.block_type == 'html'">
						<rgen-textarea label="HTML Content" size="w-full h-250 code-input" data-ng-model="modaldata.setting.html"></rgen-textarea>
					</div>

				</div>
			</div>
		</section>

		<div ng-if="modaldata.setting.block_type == 'mod'">
			<section class="rgen-panel" ng-if="selected_modulegroup != null && selected_modulegroup != ''">
				<h2 class="hd">Module specific settings</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full">
						
						<!--
						Menu
						=========================-->
						<div ng-if="selected_modulegroup === 'menu'">
							<rgen-radio radiodata="layout_styles" label="Display type" data-ng-model="modaldata.setting.mod_setting.type"></rgen-radio>
							<rgen-radio radiodata="alignment" label="Alignment" data-ng-model="modaldata.setting.mod_setting.align"></rgen-radio>
						</div>
						
						<!--
						Basic slide show
						=========================-->
						<div ng-if="selected_modulegroup === 'basicslideshow'">
							<div class="field-box">
								<label>Slide image - Width x Height</label>
								<div class="fields">
									<input type="text" tooltip="Width" class="form-field w-mini inline" data-ng-model="modaldata.setting.mod_setting.w"> x 
									<input type="text" tooltip="Height" class="form-field w-mini inline" data-ng-model="modaldata.setting.mod_setting.h">
									<div class="help-text">Value will apply in PX</div>
								</div>
							</div>
						</div>
						
						<!--
						Basic banners
						=========================-->
						<div ng-if="selected_modulegroup === 'basicbanners'">
							<div class="field-box">
								<label>Banner image - Width x Height</label>
								<div class="fields">
									<input type="text" tooltip="Width" class="form-field w-mini inline" data-ng-model="modaldata.setting.mod_setting.w"> x 
									<input type="text" tooltip="Height" class="form-field w-mini inline" data-ng-model="modaldata.setting.mod_setting.h">
									<div class="help-text">Value will apply in PX</div>
								</div>
							</div>
							<rgen-radio radiodata="banner_viewtype" size="mini" label="Banner display style" data-ng-model="modaldata.setting.mod_setting.viewtype"></rgen-radio>
							<div ng-if="modaldata.setting.mod_setting.viewtype == 'grid'">
								<h3 class="rgen-hd-1">Grid settings</h3>
								<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.mod_setting.grids"></rgen-grids>	
							</div>

							<div ng-if="modaldata.setting.mod_setting.viewtype == 'carousel'">
								<h3 class="rgen-hd-1">Carousel settings</h3>
								<!-- <rgen-radio label="Display banner in row" fhelp="Only apply when parent column size is 12" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.mod_setting.carousel.item_display"></rgen-radio> -->
								<rgen-scrollitems label="Display items" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.mod_setting.carousel.display_items"></rgen-scrollitems>
								<rgen-radio label="Space between banners" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.mod_setting.carousel.item_margin"></rgen-radio>
								<rgen-onoff label="Arrows" data-ng-model="modaldata.setting.mod_setting.carousel.arrows"></rgen-onoff>
								<rgen-onoff label="Dots" data-ng-model="modaldata.setting.mod_setting.carousel.dots"></rgen-onoff>
							</div>
						</div>

						<!--
						Product groups
						=========================-->
						<div ng-if="selected_modulegroup === 'productgroups'">
							<rgen-radio label="Product group view" radiodata="group_viewtype" data-ng-model="modaldata.setting.mod_setting.viewtype"></rgen-radio>
						</div>

						<!--
						Revo slider
						=========================-->
						<div ng-if="selected_modulegroup === 'revslider'">
							<div class="field-box">
								<label>Select slider</label>
								<div class="fields">
									<span class="select inline w-large">
										<select ng-model="modaldata.setting.mod_setting.slider_id" ng-options="o.val as o.name for o in sliderList" ng-change="sliderSelect(modaldata.setting.mod_setting.slider_id)">
											<option value=""> ======= Select slider ======= </option>
										</select>
									</span>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>	
		</div>
		
		
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, 'block')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>