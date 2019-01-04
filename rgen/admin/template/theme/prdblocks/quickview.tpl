<rgen-reset resetfn="reset('global_quickview')" frmsize="resetsize" label="Reset data" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Product page components</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">

			<div class="field-box">
				<label>Components</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Cart</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Wish list</label>
							<rgen-onoff type="alone" data-ng-model="themeData.wishlist_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Compare</label>
							<rgen-onoff type="alone" data-ng-model="themeData.compare_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Rating</label>
							<rgen-onoff type="alone" data-ng-model="themeData.rating_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Options</label>
							<rgen-onoff type="alone" data-ng-model="themeData.options_status"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label></label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Price</label>
							<rgen-onoff type="alone" data-ng-model="themeData.price_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Tax price</label>
							<rgen-onoff type="alone" data-ng-model="themeData.tax_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Description</label>
							<rgen-onoff type="alone" data-ng-model="themeData.description_status"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>

			<rgen-langtext label="Quick view text" pholder="Enter title" size="w-large" data-ng-model="themeData.quickview_text"></rgen-langtext>
			<rgen-langtext label="More detail text" pholder="Enter title" size="w-large" data-ng-model="themeData.moreinfo_text"></rgen-langtext>
			
			<div class="field-box">
				<label>Pop up - height</label>
				<div class="fields">
					<input type="text" class="form-field w-mini inline" data-ng-model="themeData.popup_h"> px
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">General</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>Body and title</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Body</label>
							<rgen-box type="alone" config="{f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.body"></rgen-box>
						</li>
						<li>
							<label class="lbl">Title</label>
							<rgen-box type="alone" config="{f_size:1, color:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.title"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Main image</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Main image</label>
							<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.main_img"></rgen-box>
						</li>
						<li>
							<label class="lbl">Thumb images</label>
							<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.sub_img"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active thumb image</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.active_img"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Arrows</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.arrows.wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Arrows</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.arrows.arrow"></rgen-button>
						</li>
						<li>
							<label class="lbl">Line beside arrows</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.arrows.arrow_line"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Tabs</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>Tabs bar</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" label="Tab item bar" config="{fonts:0, align:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.bar"></rgen-box>
						</li>
						<li>
							<label class="lbl">Item wrapper</label>
							<rgen-box type="alone" label="Tab items" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.item_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active wrapper</label>
							<rgen-box type="alone" label="Tab active" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.active_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Items</label>
							<rgen-box type="alone" label="Tab items" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.item"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active</label>
							<rgen-box type="alone" label="Tab active" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.active"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Tab content</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Container</label>
							<rgen-box type="alone" label="Tab container" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.container"></rgen-box>
						</li>
						<li>
							<label class="lbl">Tab pane</label>
							<rgen-box type="alone" label="Tab pane" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.pane"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>



<section class="rgen-panel">
	<h2 class="hd">Product information</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>Product information</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Item</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.item"></rgen-box>
						</li>
						<li>
							<label class="lbl">Item label</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.item_lbl"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="field-box">
				<label>Rating stars</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Active</label>
							<rgen-box type="alone" config="{bg:0, fonts:0, color:1, f_size:1, padding:0, margin:0, border:0, shadow:0}" buttonlabel="Edit" data-ng-model="themeData.rating.stars_active"></rgen-box>
						</li>
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" config="{bg:0, fonts:0, color:1, f_size:1, padding:0, margin:0, border:0, shadow:0}" buttonlabel="Edit" data-ng-model="themeData.rating.stars_normal"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Product options</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-box label="Block" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_options.block"></rgen-box>

			<div class="field-box">
				<label>Form</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Form group</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_options.frm_group"></rgen-box>
						</li>
						<li>
							<label class="lbl">Form labels</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_options.frm_lbl"></rgen-box>
						</li>
						<li>
							<label class="lbl">Field block</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_options.frm_fields"></rgen-box>
						</li>
						<li>
							<label class="lbl">Field fields</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_options.frm_ctrls"></rgen-box>
						</li>
						<li>
							<label class="lbl">Field buttons</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.prdpg_options.frm_btn"></rgen-button>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>


<section class="rgen-panel">
	<h2 class="hd">Product quantity block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-box label="Block" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_qty.block"></rgen-box>
			
			<h3 class="rgen-hd-1">Price</h3>
			<rgen-box label="Outer wrapper" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData.price.wrapper"></rgen-box>
			<rgen-box label="Price block" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.price.block"></rgen-box>
			
			<div class="field-box">
				<label>Price</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Offer</label>
							<rgen-box type="alone" label="Offer price" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.price.price_spl"></rgen-box>
						</li>
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" label="Normal price" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.price.price_new"></rgen-box>
						</li>
						<li>
							<label class="lbl">Old</label>
							<rgen-box type="alone" label="Old price" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.price.price_old"></rgen-box>
						</li>
						<li>
							<label class="lbl">TAX</label>
							<rgen-box type="alone" label="TAX" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.price.price_tax"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			<rgen-colorpicker label="Reward" data-ng-model="themeData.price.reward"></rgen-colorpicker>
			<div class="field-box">
				<label>Discount</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData.price.discount"></rgen-box>
						</li>
						<li>
							<label class="lbl">Items</label>
							<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData.price.discount_items"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			

			<h3 class="rgen-hd-1">Quantity</h3>
			<div class="field-box">
				<label>Options</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Label</label>
							<rgen-box type="alone" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_qty.qty_lbl"></rgen-box>
						</li>
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.prdpg_qty.qty_block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Input</label>
							<rgen-box type="alone" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.prdpg_qty.qty_input"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			
			<h3 class="rgen-hd-1">Buttons</h3>
			<div class="field-box">
				<label>Cart button</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons config="{color:0}" type="alone" buttonlabel="Edit" data-ng-model="themeData.prdpg_qty.cart_icon"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Button</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.prdpg_qty.cart_btn"></rgen-button>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Wish list and Compare links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.prdpg_qty.links"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.prdpg_qty.links_h"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</section>