<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<div class="rgen-btn-group tab-group mr10-b h-l">
			<input type="text" tooltip="Preview title" class="form-field w-medium fr fs13 h-c" data-ng-model="block_title">
			<rgen-radio type="alone" radiofn="tabtype(manage_tab)" radiodata="manage_tabs" data-ng-model="manage_tab"></rgen-radio>
		</div>
		
		<!--
		Block settings
		=========================-->
		<div ng-if="manage_tab == 'setting'">
			<section class="rgen-panel">
				<h2 class="hd">Settings</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						
						<rgen-radio label="Hover effect" size="mini" radiodata="h_effects" data-ng-model="modaldata.setting.hoverstyle"></rgen-radio>

						<rgen-radio label="Width" size="mini" radiodata="bnr_size" data-ng-model="modaldata.setting.w"></rgen-radio>
						<rgen-radio label="Height" size="mini" radiodata="bnr_size" data-ng-model="modaldata.setting.h"></rgen-radio>

						<div class="field-box">
							<label class="tip">Components</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Title</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.title_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.description_status"></rgen-onoff>
									</li>
									<!-- <li>
										<label class="lbl">Button</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.btn_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Button style</label>
										<rgen-radio type="alone" radiodata="btn_styles" size="mini" data-ng-model="modaldata.setting.btn_style"></rgen-radio>
									</li> -->
								</ul>
							</div>
						</div>

						<rgen-text label="CSS class" data-ng-model="modaldata.setting.cssclass"></rgen-text>

					</div>
				</div>
			</section>
		</div>
		
		<!--
		Block image
		=========================-->
		<div ng-if="manage_tab == 'image'">
			<section class="rgen-panel">
				<h2 class="hd">Image</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-small">

						<rgen-radio label="Banner type" radiodata="bnr_type" size="mini" data-ng-model="modaldata.setting.type"></rgen-radio>
						
						<div class="field-box" ng-if="modaldata.setting.type != 'slider'">
							<label class="v-top">
								Image
							</label>
							<div class="fields">
								<div class="img-thumbs">
									<rgen-imgupload type="alone" data-ng-model="modaldata.setting.bnr_image.img"></rgen-imgupload>
									<div class="info">
										<rgen-langtext tooltip="image alt text" type="alone" pholder="Image alt text" size="w-mini" data-ng-model="modaldata.setting.bnr_image.alt"></rgen-langtext>
										<input type="text" tooltip="URL" placeholder="Enter URL - http://...." class="form-field w-full url" data-ng-model="modaldata.setting.bnr_image.url">
										<rgen-onoff tooltip="Open in new window" type="alone" data-ng-model="modaldata.setting.bnr_image.win"></rgen-onoff>
									</div>
								</div>
							</div>
						</div>

						<div class="field-box" ng-if="modaldata.setting.type == 'slider'">
							<label class="v-top">
								Images
								<br>
								<a class="rgen-btn mediumlight small mr10-t" ng-click="addImg()">Add image</a>
							</label>
							<div class="fields">
								<div class="img-thumbs" ng-repeat="image in modaldata.setting.slide_images">
									<a class="rgen-btn highlighted small" ng-if="modaldata.setting.slide_images.indexOf(image) != 0" ng-click="removeImg($index)"><i class="fa fa-times"></i></a>
									<rgen-imgupload type="alone" data-ng-model="image.img"></rgen-imgupload>
									<div class="info">
										<rgen-langtext tooltip="image alt text" type="alone" pholder="Image alt text" size="w-mini" data-ng-model="image.alt"></rgen-langtext>
										<input type="text" tooltip="URL" placeholder="Enter URL - http://...." class="form-field w-full url" data-ng-model="image.url">
										<rgen-onoff tooltip="Open in new window" type="alone" data-ng-model="image.win"></rgen-onoff>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>
		</div>

		<!--
		Slider settings
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab == 'slider'">
			<h2 class="hd">Slider settings</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full" ng-if="modaldata.setting.type == 'slider'">
					<div class="field-box">
						<label>Speed and interval</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Speed</label>
									<input type="text" class="form-field w-mini" data-ng-model="modaldata.setting.slider.speed">
								</li>
								<li>
									<label class="lbl">Interval</label>
									<input type="text" class="form-field w-mini" data-ng-model="modaldata.setting.slider.pause">
								</li>
							</ul>
						</div>
					</div>
					<rgen-select label="Slide effect" selectdata="effect" data-ng-model="modaldata.setting.slider.effect"></rgen-select>
					<div class="field-box">
						<label>Other settings</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Auto play</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.slider.auto"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Loop</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.slider.continuous"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Stop on hover</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.slider.stoponhover"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Pager</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.slider.pager"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Arrows</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.slider.arrows"></rgen-onoff>
								</li>
							</ul>
						</div>
					</div>

				</div>
				<div class="rgen-form-wrp" ng-if="modaldata.setting.type != 'slider'">
				Slider settings only available with <strong>image type => "Slider"</strong>
				</div>
			</div>
		</section>
		
		<!--
		Block content
		=========================-->
		<div ng-if="manage_tab == 'content'">
			<section class="rgen-panel">
				<h2 class="hd">Banner content</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium" ng-if="modaldata.setting.type == 'normal'">
						<rgen-langtext label="Title" pholder="Enter title" size="w-large" data-ng-model="modaldata.content.title"></rgen-langtext>
						<rgen-textarea label="Description" size="w-full h-250 code-input" data-ng-model="modaldata.content.description"></rgen-textarea>
						<!-- <rgen-langtext label="Button text" pholder="Button text" size="w-large" data-ng-model="modaldata.content.btn_text"></rgen-langtext> -->
					</div>

					<div class="rgen-form-wrp" ng-if="modaldata.setting.type == 'slider'">
					Banner content only available with <strong>image type => "Normal"</strong>
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