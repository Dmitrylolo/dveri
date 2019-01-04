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
						<div ng-if="parent.item_data.content_view.view == 'masonry'">
							<rgen-radio label="Width" size="mini" radiodata="img_size" data-ng-model="modaldata.setting.w"></rgen-radio>
							<rgen-radio label="Height" size="mini" radiodata="img_size" data-ng-model="modaldata.setting.h"></rgen-radio>
						</div>

						<div class="field-box">
							<label class="v-top">Image</label>
							<div class="fields">
								<div class="img-thumbs" style="width: 100%;">
									<rgen-imgupload type="alone" data-ng-model="modaldata.setting.image.img"></rgen-imgupload>
									<div class="info" style="width: 81.5%;">
										<rgen-langtext tooltip="image alt text" type="alone" pholder="Image alt text" size="w-mini" data-ng-model="modaldata.setting.image.alt"></rgen-langtext>
										<input type="text" tooltip="URL" placeholder="Enter URL - http://...." class="form-field w-full url" data-ng-model="modaldata.setting.image.url">
										<rgen-onoff style="display: inline-block;" type="alone" data-ng-model="modaldata.setting.image.win"></rgen-onoff> 
										Open in new window
									</div>
								</div>
							</div>
						</div>

						<div class="field-box">
							<label>Component options</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Pop-up</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.popup_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Caption title</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.title_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Caption description</label>
										<rgen-onoff type="alone" data-ng-model="modaldata.setting.description_status"></rgen-onoff>
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
		Block content
		=========================-->
		<div ng-if="manage_tab == 'content'">
			<section class="rgen-panel">
				<h2 class="hd">Caption content</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<rgen-langtext label="Title" pholder="Enter title" size="w-large" data-ng-model="modaldata.content.title"></rgen-langtext>
						<rgen-textarea label="Description" size="w-full h-250 code-input" data-ng-model="modaldata.content.description"></rgen-textarea>
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