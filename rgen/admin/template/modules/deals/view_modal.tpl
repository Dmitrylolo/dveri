<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Content view style</h3>
	</div>
	<div class="modal-body">
		
		<div class="rgen-btn-group tab-group mr10-b h-c">
			<rgen-radio type="alone" radiofn="tabtype(manage_tab)" radiodata="manage_tabs_view" data-ng-model="manage_tab_view"></rgen-radio>
		</div>

		<!--
		Block content
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab_view == 'settings'">
			<h2 class="hd">Block content view settings</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-text label="CSS class" data-ng-model="modaldata.content_view.cssclass"></rgen-text>
					
					<rgen-radio label="Display style" helpimg="imgPath+'dealshowcase_style.jpg'" radiodata="style_range" size="mini" data-ng-model="modaldata.content_view.style"></rgen-radio>

					<div ng-if="modaldata.content_view.style == 1">
						<rgen-radio label="Content alignment" radiodata="content_align" size="mini" data-ng-model="modaldata.content_view.v_align"></rgen-radio>	
					</div>
					<div ng-if="modaldata.content_view.style == 3">
						<rgen-radio label="Content alignment" radiodata="content_align1" size="mini" data-ng-model="modaldata.content_view.conten_align"></rgen-radio>	
					</div>

					<h3 class="rgen-hd-1">Image sizes</h3>
					<div class="field-box">
						<label>Image resize parameters</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Main image</label><br>
									<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="modaldata.content_view.image_size.main_w"> x 
									<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="modaldata.content_view.image_size.main_h">
								</li>
								<li ng-if="modaldata.content_view.style != 3">
									<label class="lbl">Thumb images</label><br>
									<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="modaldata.content_view.image_size.sub_w"> x 
									<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="modaldata.content_view.image_size.sub_h">
								</li>
								<li>
									<label class="lbl">Resize type</label>
									<rgen-radio type="alone" radiodata="imgresize_types" size="mini" data-ng-model="modaldata.content_view.image_size.resize_type"></rgen-radio>
								</li>
							</ul>
						</div>
					</div>
					
					<div ng-if="modaldata.content_view.style != 2">
						<rgen-radio ng-if="modaldata.content_view.style != 3" label="Content block view" radiodata="block_view" size="mini" data-ng-model="modaldata.content_view.view"></rgen-radio>

						<div ng-if="modaldata.content_view.view == 'grid' && modaldata.content_view.style != 3">
							<h3 class="rgen-hd-1">Grid settings</h3>
							<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="modaldata.content_view.grids"></rgen-grids>	
						</div>

						<div ng-if="modaldata.content_view.view == 'carousel' || modaldata.content_view.style == 3">
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
										<li>
											<label class="lbl">Loop</label>
											<rgen-onoff type="alone" data-ng-model="modaldata.content_view.carousel.loop"></rgen-onoff>
										</li>
										<li>
											<label class="lbl">Auto play</label>
											<rgen-onoff type="alone" data-ng-model="modaldata.content_view.carousel.autoplay"></rgen-onoff>
										</li>
										<li>
											<label class="lbl">Stop on hover</label>
											<rgen-onoff type="alone" data-ng-model="modaldata.content_view.carousel.stoponhover"></rgen-onoff>
										</li>
										<li>
											<label class="lbl">Interval</label>
											<input type="text" class="form-field w-mini" data-ng-model="modaldata.content_view.carousel.timeout">
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<div ng-if="modaldata.content_view.style == 2">
						<h3 class="rgen-hd-1">Slide show settings</h3>
						<div class="field-box">
							<label>Animation and interval</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Animation - IN</label>
										<rgen-select type="alone" selectdata="effect" size="w-small" data-ng-model="modaldata.content_view.slider.animIn"></rgen-select>
									</li>
									<li>
										<label class="lbl">Animation - OUT</label>
										<rgen-select type="alone" selectdata="effect" size="w-small" data-ng-model="modaldata.content_view.slider.animOut"></rgen-select>
									</li>
									<li>
										<label class="lbl">Interval</label>
										<input type="text" class="form-field w-mini" data-ng-model="modaldata.content_view.slider.timeout">
									</li>
								</ul>
							</div>
						</div>
						
						<div class="field-box">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Pager</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.slider.dots"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Arrows</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.slider.arrows"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Loop</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.slider.loop"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Auto play</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.slider.autoplay"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Stop on hover</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.content_view.slider.stoponhover"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!--
		Column title
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab_view == 'title'">
			<h2 class="hd">Column title</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<div class="field-box">
						<label>Status and style</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Status</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.content_view.title.status"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Style</label>
									<rgen-box type="alone" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="modaldata.content_view.title.block"></rgen-box>
								</li>
							</ul>
						</div>
					</div>
					<rgen-langtext label="Title" pholder="Enter title" size="w-full" data-ng-model="modaldata.content_view.title.text"></rgen-langtext>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, 'content_view')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>