<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Menu main item manager</h3>
	</div>
	<div class="modal-body">
		<div class="rgen-btn-group tab-group mr10-b h-c">
			<rgen-radio type="alone" radiofn="tabtype(manage_tab)" radiodata="manage_tabs" data-ng-model="manage_tab"></rgen-radio>
		</div>

		<!--
		Item
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab == 'item'">
			<h2 class="hd">Menu item</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full">
					<rgen-langtext label="Menu item name" pholder="Menu item name" size="w-large" data-ng-model="main_menu.title"></rgen-langtext>
					<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="main_menu.url"></rgen-text>
					<div class="field-box">
						<label>Custom CSS class</label>
						<div class="fields">
							<input type="text" class="form-field w-small" placeholder="Class name" data-ng-model="main_menu.css_class">
						</div>
					</div>
					
					<div class="field-box">
						<label>Sub menu type</label>
						<div class="fields">
							<div class="rgen-btn-group" data-ng-click="selected = data.val">
								<label ng-repeat="data in main_menu_type" class="rgen-btn mini" ng-model="main_menu.submenu_type" btn-radio="data.val" ng-click="submenu_change(main_menu, data.val)">{{data.label}}</label>
							</div>
							<div class="help-text">Changing sub menu type will reset existing data</div>
						</div>
					</div>
					<rgen-radio data-ng-show="main_menu.submenu_type !== 'n'" radiodata="sub_size" fhelp="Size based on 12 column concept" size="mini" label="Sub menu size" data-ng-model="main_menu.submenu_size"></rgen-radio>
				</div>
			</div>
		</section>

		<!--
		Label
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab == 'label'">
			<h2 class="hd">Item label</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full">
					<rgen-onoff label="status" label="Menu label" data-ng-model="main_menu.label.status"></rgen-onoff>

					<div ng-if="main_menu.label.status == true">
						<rgen-radio radiodata="lbl_type" label="Label type" data-ng-model="main_menu.label.type"></rgen-radio>
						<div ng-if="main_menu.label.type == 'img'">
							<rgen-imgupload buttonlabel="Edit" label="Image" data-ng-model="main_menu.label.image"></rgen-imgupload>
							<rgen-text label="Image width" tooltip="Enter numeric value." lhelp="Value will apply in PX" size="w-mini" data-ng-model="main_menu.label.img_w"></rgen-text>
						</div>
						<div ng-if="main_menu.label.type == 'txt'">
							<rgen-langtext label="Label name" pholder="Label name" size="w-large" data-ng-model="main_menu.label.text"></rgen-langtext>	
							<div class="field-box">
								<label>Label style</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Block</label>
											<rgen-box config="{fonts:0, bg:0}" buttonlabel="Edit" type="alone" data-ng-model="main_menu.label.block"></rgen-box>
										</li>
										<li>
											<label class="lbl">Background</label>
											<rgen-colorpicker type="alone" data-ng-model="main_menu.label.background"></rgen-colorpicker>
										</li>
										<li>
											<label class="lbl">Text</label>
											<rgen-colorpicker type="alone" data-ng-model="main_menu.label.text_color"></rgen-colorpicker>
										</li>
										<li>
											<label class="lbl">Text size</label>
											<rgen-select type="alone" selectdata="font_size" size="w-mini" data-ng-model="main_menu.label.text_size"></rgen-select>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="field-box">
							<label>
								Label position
								<div class="help-text">Value will apply in PX</div>
							</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Left</label>
										<input type="text" tooltip="Enter numeric value." class="form-field w-tiny" data-ng-model="main_menu.label.left">
									</li>
									<li>
										<label class="lbl">Top</label>
										<input type="text" tooltip="Enter numeric value." class="form-field w-tiny" data-ng-model="main_menu.label.top">
									</li>
								</ul>
							</div>
						</div>
						<rgen-text label="Custom CSS class" pholder="Class name" size="w-small" data-ng-model="main_menu.label.css_class"></rgen-text>
					</div>
					
					<!-- <rgen-bgimage buttonlabel="Edit" label="Image" data-ng-model="main_menu.label.image"></rgen-bgimage> -->
				</div>
			</div>
		</section>


		<!--
		Icon
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab == 'icon'">
			<h2 class="hd">Item icon</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full">
					<rgen-icons config="{ color: 0 }" label="Item icon" buttonlabel="Edit" label="Icon" data-ng-model="main_menu.icon"></rgen-icons>
					<rgen-radio radiodata="icon_positions" label="Icon position" data-ng-model="main_menu.icon_position"></rgen-radio>
					<rgen-box config="{fonts:0, color:1, f_size:1, align:1, w:1, h:1}" buttonlabel="Edit" label="Icon style" data-ng-model="main_menu.icon_block"></rgen-box>
				</div>
			</div>
		</section>
		<!-- Menu item label -->
		

	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(main_menu)">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>