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
				<h2 class="hd">Content block settings</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">

						<!-- <rgen-radio label="Select block style" helpimg="imgPath+'contentblocks.jpg'" radiodata="styles" size="mini" data-ng-model="modaldata.setting.style"></rgen-radio> -->
						<rgen-select label="Select block style" helpimg="imgPath+'contentblocks.jpg'" selectdata="styles" data-ng-model="modaldata.setting.style"></rgen-select>
						
						<div class="field-box" ng-if="modaldata.setting.style === '_small1' || modaldata.setting.style === '_small2' || modaldata.setting.style === '_small3'">
							<label class="tip">Small block settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Image position</label>
										<rgen-radio type="alone" radiodata="img_positions" data-ng-model="modaldata.setting.img_pos"></rgen-radio>
									</li>
									<li>
										<label class="lbl">Width</label><br>
										<input type="text" tooltip="Image block width" class="form-field w-mini" data-ng-model="modaldata.setting.img_block_w">
									</li>
									<li>
										<label class="lbl">Top space</label>
										<input type="text" tooltip="Image top margin adjustment (Vlaue apply in PX)" class="form-field w-mini" data-ng-model="modaldata.setting.img_block_t">
									</li>
									<li>
										<label class="lbl">Gutter</label>
										<rgen-select type="alone" tooltip="Space between image and content" size="w-mini" selectdata="marginrange" data-ng-model="modaldata.setting.img_block_gt"></rgen-select>
									</li>
								</ul>
							</div>
						</div>

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
									<li>
										<label class="lbl">Image</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.image_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Button</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.btn_status"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>

						<div class="field-box">
							<label class="tip">Other</label>
							<div class="fields">
								<ul class="form-row">
									<li ng-if="modaldata.setting.style !== '_small1' && modaldata.setting.style !== '_small2' && modaldata.setting.style !== '_small3'">
										<label class="lbl">Title position</label>
										<rgen-radio type="alone" radiodata="title_positions" size="mini" data-ng-model="modaldata.setting.title_pos"></rgen-radio>
									</li>
									<li>
										<label class="lbl">Button style</label>
										<rgen-radio type="alone" radiodata="btn_styles" size="mini" data-ng-model="modaldata.setting.btn_style"></rgen-radio>
									</li>
								</ul>
							</div>
						</div>

						<rgen-text label="CSS class" data-ng-model="modaldata.setting.cssclass"></rgen-text>

						<h3 class="rgen-hd-1">URL settings</h3>
						<div class="field-box">
							<label class="tip">URL</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Status</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.url_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Open in new window</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.win"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>
						<div class="field-box">
							<label class="tip">URL apply on</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Image block</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.img_link"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.title_link"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Full block</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.full_link"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>
						<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="modaldata.setting.url"></rgen-text>

					</div>
				</div>
			</section>
		</div>
		
		<!--
		Block image
		=========================-->
		<div ng-if="manage_tab == 'image'">
			<section class="rgen-panel">
				<h2 class="hd">Block image</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">

						<rgen-radio label="Image type" radiodata="img_types" size="mini" data-ng-model="modaldata.setting.img_type"></rgen-radio>

						<div ng-if="modaldata.setting.img_type == 'ico'">
							<h3 class="rgen-hd-1">Icon settings</h3>
							<div class="field-box">
								<label class="tip">Icon settings</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Icon</label>
											<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="modaldata.setting.icon"></rgen-icons>
										</li>
										<li>
											<label class="lbl">Icon block</label>
											<rgen-box type="alone" config="{fonts: 0, f_size:1, align:1, color:1, w:1, h:1}" buttonlabel="Edit" data-ng-model="modaldata.setting.icon_block"></rgen-box>
										</li>
									</ul>
								</div>
							</div>
						</div>
						
						<div ng-if="modaldata.setting.img_type == 'img'">
							<h3 class="rgen-hd-1">Image settings</h3>
							<rgen-imgupload label="Image upload" data-ng-model="modaldata.setting.image"></rgen-imgupload>
							<div class="field-box">
								<label class="tip">Image settings</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Resize (Width x Height)</label><br>
											<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="modaldata.setting.image_w">
											<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="modaldata.setting.image_h">
										</li>
										<li>
											<label class="lbl">Resize type</label>
											<rgen-radio type="alone" radiodata="imgresize_types" size="small" data-ng-model="modaldata.setting.resize_type"></rgen-radio>
										</li>
									</ul>
								</div>
							</div>
							<rgen-langtext label="Image alt text" pholder="Image alt text" size="w-large" data-ng-model="modaldata.content.img_alt"></rgen-langtext>
						</div>

					</div>
				</div>
			</section>
		</div>
		
		<!--
		Block content
		=========================-->
		<div ng-if="manage_tab == 'content'">
			<section class="rgen-panel">
				<h2 class="hd">Block content</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<rgen-langtext label="Title" pholder="Enter title" size="w-large" data-ng-model="modaldata.content.title"></rgen-langtext>
						<!-- <rgen-langcontent label="Description" pholder="Enter code" size="w-large" data-ng-model="modaldata.content.description"></rgen-langcontent> -->
						
						<rgen-textarea label="Description" size="w-full h-250 code-input" data-ng-model="modaldata.content.description"></rgen-textarea>
						<rgen-langtext label="Button text" pholder="Button text" size="w-large" data-ng-model="modaldata.content.btn_text"></rgen-langtext>
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