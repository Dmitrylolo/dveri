<section class="rgen-panel">
	<h2 class="hd">Special offer products</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label class="tip">
					Product settings
					<a ng-click="helpImg(imgPath+'all_prdblocks.jpg')" class="help-tip"><i class="fa fa-question-circle"></i></a>
				</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Style</label>
							<rgen-select type="alone" selectdata="prdblock_styles" size="w-small" data-ng-model="modaldata.setting.prd_style"></rgen-select>
						</li>
						<li>
							<label class="lbl">View</label>
							<rgen-select type="alone" selectdata="prdblock_view" size="w-mini" data-ng-model="modaldata.setting.prd_view"></rgen-select>
						</li>
						<li>
							<label class="lbl">Limit</label>
							<rgen-select type="alone" selectdata="limit_range" size="w-tiny" data-ng-model="modaldata.setting.prd_limit"></rgen-select>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label class="tip">Deal counter settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff  type="alone" data-ng-model="modaldata.setting.counter"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Display on hover</label>
							<rgen-onoff  type="alone" data-ng-model="modaldata.setting.h_counter"></rgen-onoff>
						</li>
					</ul>
					<div class="help-text">
						Deal counter only support with product BLOCK 3	
					</div>
				</div>
			</div>

			<div class="field-box">
				<label>Image size</label>
				<div class="fields">
					<input type="text" tooltip="width" class="form-field w-mini inline" data-ng-model="modaldata.setting.image_w"> x 
					<input type="text" tooltip="height" class="form-field w-mini inline" data-ng-model="modaldata.setting.image_h">
					<div class="help-text">Width (px) - Height (px)</div>
				</div>
			</div>

			<div ng-if="modaldata.setting.prd_view == 'grid'">
				<h3 class="rgen-hd-1">Grid settings</h3>
				<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.grids"></rgen-grids>	
			</div>

			<div ng-if="modaldata.setting.prd_view == 'carousel'">
				<h3 class="rgen-hd-1">Carousel settings</h3>
				<!-- <rgen-radio label="Display banner in row" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.carousel.display"></rgen-radio> -->
				<rgen-scrollitems label="Display items" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.carousel.display_items"></rgen-scrollitems>
				<rgen-radio label="Space between banners" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="modaldata.setting.carousel.margin"></rgen-radio>
				<div class="field-box">
					<label>Carousel controls</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Arrows</label>
								<rgen-onoff type="alone" data-ng-model="modaldata.setting.carousel.arrows"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Dots</label>
								<rgen-onoff type="alone" data-ng-model="modaldata.setting.carousel.dots"></rgen-onoff>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<rgen-text label="Custom CSS class" size="w-small" data-ng-model="modaldata.setting.cssclass"></rgen-text>

			<!-- <rgen-langtext label="Title" fhelp="Use as TITLE and ALT tag of image" pholder="Enter title" size="w-large" data-ng-model="banner.title"></rgen-langtext>
			<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="banner.url"></rgen-text>
			<rgen-onoff label="Open in new window" data-ng-model="banner.win"></rgen-onoff> -->
		</div>
	</div>
</section>