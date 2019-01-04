<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Menu sub item manager</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<h2 class="hd">Main menu item</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">

					<div class="field-box">
						<label>Sub menu items</label>
						<div class="fields">
							<div class="rgen-btn-group" data-ng-click="selected = data.val">
								<label ng-repeat="data in sub_item_type" class="rgen-btn mini" ng-model="sub_menu.item_type" btn-radio="data.val" ng-click="itemtype(data.val)">{{data.label}}</label>
							</div>
							<div class="help-text">Changing item will reset existing data</div>
						</div>
					</div>
					
					<!-- Normal link -->
					<div ng-if="sub_menu.item_type == 'normal'">
						<h3 class="rgen-hd-1">Normal link</h3>
						<rgen-langtext label="Menu item name" pholder="Enter name" size="w-large" data-ng-model="sub_menu.sub_item.title"></rgen-langtext>
						<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="sub_menu.sub_item.url"></rgen-text>
						<rgen-onoff label="Open in new window" data-ng-model="sub_menu.sub_item.win"></rgen-onoff>
						
						<div class="field-box" ng-if="subtype == 'mega'">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Link style</label>
										<rgen-radio radiodata="link_style" type="alone" data-ng-model="sub_menu.sub_item.style"></rgen-radio>
									</li>
									<li>
										<label class="lbl">Custom style</label>
										<rgen-box type="alone" buttonlabel="Edit" config="{ fonts:0, align:1, f_size:1, color:1 }" data-ng-model="sub_menu.sub_item.css"></rgen-box>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- Categories -->
					<div ng-if="sub_menu.item_type == 'cat'">
						<h3 class="rgen-hd-1">Categories</h3>
						<rgen-typeaheadsingle label="Categories" pholder="Enter text to search" size="w-large" searchtype="category" data-ng-model="sub_menu.sub_item.category"></rgen-typeaheadsingle>
						<div class="field-box" ng-if="subtype == 'mega'">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Image width (px)</label>
										<input type="text" placeholder="Width" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_w">
									</li>
									<li>
										<label class="lbl">Image height (px)</label>
										<input type="text" placeholder="Height" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_h">
									</li>
									<li>
										<label class="lbl">Sub category limit</label>
										<rgen-select type="alone" selectdata="max_limit" size="w-mini" data-ng-model="sub_menu.sub_item.max_sub"></rgen-select>
									</li>
								</ul>
							</div>
						</div>
						<rgen-radio ng-if="subtype == 'mega'" radiodata="cat_styles" size="mini" label="Display style" data-ng-model="sub_menu.sub_item.style"></rgen-radio>
					</div>

					<!-- Products -->
					<div ng-if="sub_menu.item_type == 'prd'">
						<h3 class="rgen-hd-1">Products</h3>
						<rgen-typeahead label="Products" pholder="Enter text to search" size="w-large" searchtype="product" data-ng-model="sub_menu.sub_item.products"></rgen-typeahead>
						<div class="field-box" ng-if="subtype == 'mega'">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Grid settings</label>
										<rgen-grids type="alone" buttonlabel="Edit" size="mini" label="Grid settings" data-ng-model="sub_menu.sub_item.grid_settings"></rgen-grids>
									</li>
									<li>
										<label class="lbl">Image width (px)</label>
										<input type="text" placeholder="Width" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_w">
									</li>
									<li>
										<label class="lbl">Image height (px)</label>
										<input type="text" placeholder="Height" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_h">
									</li>
								</ul>
							</div>
						</div>
						<rgen-radio ng-if="subtype == 'mega'" radiodata="prd_styles" size="mini" label="Product box style" data-ng-model="sub_menu.sub_item.style"></rgen-radio>
					</div>

					<!-- Brands -->
					<div ng-if="sub_menu.item_type == 'brand'">
						<h3 class="rgen-hd-1">Brands</h3>
						<rgen-typeahead label="Brands" pholder="Enter text to search" size="w-large" searchtype="brand" data-ng-model="sub_menu.sub_item.brands"></rgen-typeahead>
						<div class="field-box" ng-if="subtype == 'mega'">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Grid settings</label>
										<rgen-grids type="alone" buttonlabel="Edit" size="mini" label="Grid settings" data-ng-model="sub_menu.sub_item.grid_settings"></rgen-grids>
									</li>
									<li>
										<label class="lbl">Image width (px)</label>
										<input type="text" placeholder="Width" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_w">
									</li>
									<li>
										<label class="lbl">Image height (px)</label>
										<input type="text" placeholder="Height" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_h">
									</li>
								</ul>
							</div>
						</div>
						<rgen-radio ng-if="subtype == 'mega'" radiodata="brand_styles" size="mini" label="Brand box style" data-ng-model="sub_menu.sub_item.style"></rgen-radio>
					</div>

					<!-- Banner image -->
					<div ng-if="sub_menu.item_type == 'bannerimg'">
						<h3 class="rgen-hd-1">Banner image</h3>
						<rgen-langtext label="Title" pholder="Enter title" size="w-large" data-ng-model="sub_menu.sub_item.title"></rgen-langtext>
						<rgen-imgupload buttonlabel="Edit" label="Image" data-ng-model="sub_menu.sub_item.image"></rgen-imgupload>
						<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="sub_menu.sub_item.url"></rgen-text>
						<rgen-radio radiodata="banner_styles" size="mini" label="Style" data-ng-model="sub_menu.sub_item.style"></rgen-radio>

						<div class="field-box">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Image width (px)</label>
										<input type="text" placeholder="Width" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_w">
									</li>
									<li>
										<label class="lbl">Image height (px)</label>
										<input type="text" placeholder="Height" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_h">
									</li>
									<li>
										<label class="lbl">Bottom margin</label>
										<rgen-select type="alone" selectdata="margin_bottom" size="w-mini" data-ng-model="sub_menu.sub_item.margin_b"></rgen-select>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-onoff type="alone" data-ng-model="sub_menu.sub_item.title_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Open in new window</label>
										<rgen-onoff type="alone" label="Open in new window" data-ng-model="sub_menu.sub_item.win"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>
					</div>


					<!-- Banner image -->
					<div ng-if="sub_menu.item_type == 'infobox'">
						<h3 class="rgen-hd-1">Info boxes</h3>
						<div class="field-box">
							<label>Component settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Title</label>
										<rgen-onoff type="alone" data-ng-model="sub_menu.sub_item.title_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-onoff type="alone" data-ng-model="sub_menu.sub_item.description_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Image</label>
										<rgen-onoff type="alone" data-ng-model="sub_menu.sub_item.image_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Button</label>
										<rgen-onoff type="alone" data-ng-model="sub_menu.sub_item.btn_status"></rgen-onoff>
									</li>
									<li>
										<label class="lbl">Link open in new window</label>
										<rgen-onoff type="alone" data-ng-model="sub_menu.sub_item.win"></rgen-onoff>
									</li>
								</ul>
							</div>
						</div>
						<rgen-imgupload buttonlabel="Edit" label="Image" data-ng-model="sub_menu.sub_item.image"></rgen-imgupload>
						<div class="field-box">
							<label>Title and Button</label>
							<div class="fields">
								<ul class="form-row">
									<li style="width: 330px;">
										<label class="lbl">Title</label>
										<rgen-langtext type="alone" pholder="Enter title" size="w-full" data-ng-model="sub_menu.sub_item.title"></rgen-langtext>
									</li>
									<li style="width: 330px;">
										<label class="lbl">Button</label>
										<rgen-langtext type="alone" pholder="Enter button text" size="w-full" data-ng-model="sub_menu.sub_item.button"></rgen-langtext>
									</li>
								</ul>
							</div>
						</div>
						<rgen-textarea label="Description" pholder="Enter title" size="w-full" data-ng-model="sub_menu.sub_item.description"></rgen-textarea>
						<rgen-text label="URL" pholder="Enter URL - http://...." size="w-full" data-ng-model="sub_menu.sub_item.url"></rgen-text>
						
						<div class="field-box">
							<label>Display settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Style</label>
										<rgen-radio type="alone" radiodata="infobox_styles" size="mini" data-ng-model="sub_menu.sub_item.style"></rgen-radio>
									</li>
									<li>
										<label class="lbl">Content align</label>
										<rgen-radio type="alone" radiodata="alignment" size="mini" data-ng-model="sub_menu.sub_item.align"></rgen-radio>
									</li>
									<li>
										<label class="lbl">Image width (px)</label>
										<input type="text" placeholder="Width" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_w">
									</li>
									<li>
										<label class="lbl">Image height (px)</label>
										<input type="text" placeholder="Height" class="w-mini form-field" data-ng-model="sub_menu.sub_item.image_h">
									</li>
									<li>
										<label class="lbl">Bottom margin</label>
										<rgen-select type="alone" selectdata="margin_bottom" size="w-mini" data-ng-model="sub_menu.sub_item.margin_b"></rgen-select>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- Custom html -->
					<div ng-if="sub_menu.item_type == 'customhtml'">
						<h3 class="rgen-hd-1">Custom HTML</h3>
						<!-- <rgen-langcontent label="Custom HTML" pholder="Enter code" size="w-large" data-ng-model="sub_menu.sub_item.html"></rgen-langcontent> -->
						<rgen-textarea label="Custom HTML" size="w-full h-250 code-input" data-ng-model="sub_menu.sub_item.html"></rgen-textarea>
						
						<div class="field-box">
							<label>Other settings</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Margin bottom</label>
										<rgen-select type="alone" selectdata="margin_bottom" size="w-mini" data-ng-model="sub_menu.sub_item.margin_b"></rgen-select>
									</li>
									<li>
										<label class="lbl">Custom style</label>
										<rgen-box type="alone" buttonlabel="Edit" config="{ fonts:0, align:1, f_size:1, color:1 }" data-ng-model="sub_menu.sub_item.css"></rgen-box>
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
		<button class="rgen-btn mediumlight" ng-click="apply(sub_menu)">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>