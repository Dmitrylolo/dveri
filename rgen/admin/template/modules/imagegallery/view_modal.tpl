<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Content view style</h3>
	</div>
	<div class="modal-body">

		<!--
		Block content
		=========================-->
		<section class="rgen-panel">
			<!-- <h2 class="hd">Block content view style</h2> -->
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-radio label="Content block view" radiodata="block_view" size="mini" data-ng-model="modaldata.content_view.view"></rgen-radio>
					
					<div ng-if="modaldata.content_view.view == 'masonry'">
						<rgen-select label="Grid gutter" selectdata="img_gt" size="w-mini" data-ng-model="modaldata.content_view.gt"></rgen-select>
						<rgen-text label="Image base size" size="w-mini" fhelp="example : size 2x1 = 2 * 97 x 1 * 97 => Output image size : 194 x 97" lhelp="Image will resize based on this value" data-ng-model="modaldata.content_view.base_size"></rgen-text>
					</div>

					<div class="field-box" ng-if="modaldata.content_view.view != 'masonry'">
						<label>Image size</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Resize (Width x Height)</label><br>
									<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="modaldata.content_view.image_w">
									<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="modaldata.content_view.image_h">
								</li>
								<li>
									<label class="lbl">Resize type</label>
									<rgen-radio type="alone" radiodata="imgresize_types" size="small" data-ng-model="modaldata.content_view.resize_type"></rgen-radio>
								</li>
							</ul>
						</div>
					</div>

					<div ng-if="modaldata.content_view.view == 'grid'">
						<h3 class="rgen-hd-1">Grid settings</h3>
						<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="modaldata.content_view.grids"></rgen-grids>	
					</div>

					<div ng-if="modaldata.content_view.view == 'carousel'">
						<h3 class="rgen-hd-1">Carousel settings</h3>
						<!-- <rgen-radio label="Display banner in row" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="modaldata.content_view.carousel.display"></rgen-radio> -->
						<rgen-scrollitems label="Display items" buttonlabel="Edit" size="mini" data-ng-model="modaldata.content_view.carousel.display_items"></rgen-scrollitems>
						<rgen-radio label="Space between banners" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="modaldata.content_view.carousel.margin"></rgen-radio>
						<div class="field-box">
							<label>Carousel controls</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Arrows</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.carousel.arrows"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Dots</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.carousel.dots"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					<h3 class="rgen-hd-1">Hover icons</h3>
					<div class="field-box">
						<label class="tip">Icons</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Zoom icon</label>
									<rgen-icons type="alone" config="{color:0, size:0 }" buttonlabel="Edit" data-ng-model="modaldata.content_view.zoon_icon"></rgen-icons>
								</li>
								<li>
									<label class="lbl">URL icon</label>
									<rgen-icons type="alone" config="{color:0, size:0 }" buttonlabel="Edit" data-ng-model="modaldata.content_view.url_icon"></rgen-icons>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, 'block')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>