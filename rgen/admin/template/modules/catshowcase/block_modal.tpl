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

						<rgen-typeaheadsingle label="Select category" pholder="Enter text to search" size="w-large" searchtype="category" data-ng-model="modaldata.setting.category"></rgen-typeaheadsingle>

						<div class="field-box">
							<label class="tip">Sub category display</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Limit</label>
										<rgen-select type="alone" selectdata="limit_range" size="w-mini" data-ng-model="modaldata.setting.sub_limit"></rgen-select>
									</li>
									<li>
										<label class="lbl">Status</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.sub_status"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Other settings</h3>
						<div class="field-box">
							<label class="tip">Components</label>
							<div class="fields">
								<ul class="form-row">
									<li tooltip="Default title display category name">
										<label class="lbl">Title</label>
										<rgen-radio type="alone" radiodata="data_types" size="small" data-ng-model="modaldata.setting.title"></rgen-radio>
									</li>
									<li tooltip="Default description display category description">
										<label class="lbl">Description</label>
										<rgen-radio type="alone" radiodata="data_types" size="small" data-ng-model="modaldata.setting.description"></rgen-radio>
									</li>
									<li tooltip="Description description text limit">
										<label class="lbl">Description limit</label>
										<input type="text" class="form-field w-mini" data-ng-model="modaldata.setting.description_limit">
									</li>
								</ul>
								<div class="help-text">Click on "CONTENT" tab to add custom title / description</div>
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
										<label class="lbl">Button</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.button_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Button style</label>
										<rgen-radio type="alone" radiodata="btn_styles" size="mini" data-ng-model="modaldata.setting.btn_style"></rgen-radio>
									</li>
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
					<div class="rgen-form-wrp form-full form-medium">
						<rgen-radio label="Image resize type" radiodata="imgresize_types" size="mini" data-ng-model="modaldata.setting.resize_type"></rgen-radio>

						<h3 class="rgen-hd-1">Parent category image</h3>
						<rgen-radio label="Image type" size="mini" radiodata="data_types" data-ng-model="modaldata.setting.img_type"></rgen-radio>
						<rgen-imgupload ng-if="modaldata.setting.img_type == 'custom'" label="Set custom image" data-ng-model="modaldata.setting.custom_img"></rgen-imgupload>
						<div class="field-box">
							<label>
								Image size
								<div class="help-text">Width x Height</div>
							</label>
							<div class="fields">
								<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="modaldata.setting.image_w"> x 
								<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="modaldata.setting.image_h">
							</div>
						</div>
						
						<h3 class="rgen-hd-1">Sub category image</h3>
						<div class="field-box">
							<label>
								Image size
								<div class="help-text">Width x Height</div>
							</label>
							<div class="fields">
								<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="modaldata.setting.sub_image_w"> x 
								<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="modaldata.setting.sub_image_h">
							</div>
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
				<h2 class="hd">Content</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<rgen-langtext ng-if="modaldata.setting.title == 'custom'" label="Title" pholder="Enter title" size="w-large" data-ng-model="modaldata.content.title"></rgen-langtext>
						<rgen-textarea ng-if="modaldata.setting.description == 'custom'" label="Description" size="w-full h-250 code-input" data-ng-model="modaldata.content.description"></rgen-textarea>
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