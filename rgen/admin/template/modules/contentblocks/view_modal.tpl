<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Content view style</h3>
	</div>
	<div class="modal-body">

		<!--
		Column title
		=========================-->
		<section class="rgen-panel">
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

		<!--
		Block content
		=========================-->
		<section class="rgen-panel">
			<h2 class="hd">Block content view settings</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-text label="CSS class" data-ng-model="modaldata.content_view.cssclass"></rgen-text>
					<rgen-radio label="Content block view" radiodata="block_view" size="mini" data-ng-model="modaldata.content_view.view"></rgen-radio>

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
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, 'block')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>