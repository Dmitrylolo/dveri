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
		<div ng-if="manage_tab == 'prdtab'">
			<section class="rgen-panel">
				<h2 class="hd">Products</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<rgen-typeaheadsingle label="Select product" pholder="Enter text to search" size="w-large" searchtype="product" data-ng-model="modaldata.setting.products"></rgen-typeaheadsingle>
					</div>
				</div>
			</section>
		</div>
		
		<!--
		Block settings
		=========================-->
		<section class="rgen-panel" ng-if="manage_tab == 'prdtab'">
			<h2 class="hd">
				Settings
				<div class="help-text">
					Every components display based design style selected. 
					Some of component setting not display in some design styles.
				</div>
			</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<div class="field-box">
						<label class="tip">Content</label>
						<div class="fields">
							<ul class="form-row">
								<li tooltip="Default title display product name">
									<label class="lbl">Title</label>
									<rgen-radio type="alone" radiodata="data_types" size="small" data-ng-model="modaldata.setting.title"></rgen-radio>
								</li>
								<li tooltip="Default description display product description">
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
									<label class="lbl">Display category</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.cat_status"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Description</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.description_status"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Add to cart</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.cart_status"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Wish list</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.wishlist_status"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Compare</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.compare_status"></rgen-onoff>
								</li>
								<li>
									<label class="lbl">Rating</label>
									<rgen-onoff type="alone" data-ng-model="modaldata.setting.rating_status"></rgen-onoff>
								</li>
							</ul>
						</div>
					</div>

					<div class="field-box">
						<label class="tip">Other</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Image position</label>
									<rgen-radio type="alone" radiodata="img_positions" size="mini" data-ng-model="modaldata.setting.img_position"></rgen-radio>
								</li>
							</ul>
						</div>
					</div>
					
					<rgen-text label="CSS class" data-ng-model="modaldata.setting.cssclass"></rgen-text>
				</div>
			</div>
		</section>

		<!--
		Block image
		=========================-->
		<div ng-if="manage_tab == 'image'">
			<section class="rgen-panel">
				<h2 class="hd">Image</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						
						<h3 class="rgen-hd-1">Product main image</h3>
						<rgen-radio label="Image type" size="mini" radiodata="data_types" data-ng-model="modaldata.setting.img_type"></rgen-radio>
						<rgen-imgupload ng-if="modaldata.setting.img_type == 'custom'" label="Set custom image" data-ng-model="modaldata.setting.custom_img"></rgen-imgupload>
						
						<h3 class="rgen-hd-1">Product extra images</h3>
						<rgen-onoff label="Status" data-ng-model="modaldata.setting.sub_image_status"></rgen-onoff>
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