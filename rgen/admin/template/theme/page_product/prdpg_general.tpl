<rgen-reset resetfn="reset('prdpg_general')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">General</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			
			<rgen-radio label="Product page layout" helpimg="imgPath+'prdpg_layout.jpg'" radiodata="prdpg_layout" buttonlabel="Edit" size="mini" data-ng-model="themeData.layout_style"></rgen-radio>

			<div class="field-box">
				<label>Product title</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Title</label>
							<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.title"></rgen-box>
						</li>
						<li>
							<label class="lbl">HR line</label>
							<rgen-box type="alone" config="{fonts:0, h:1}" buttonlabel="Edit" data-ng-model="themeData.hr"></rgen-box>
						</li>
						<li>
							<label class="lbl">HR BG</label>
							<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.hr_img"></rgen-bgimage>
						</li>
					</ul>
				</div>
			</div>

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
			<rgen-button label="Tags" buttonlabel="Edit" data-ng-model="themeData.tags"></rgen-button>

			<rgen-radio label="Related product style" helpimg="imgPath+'prdblocks.jpg'" radiodata="relprd_style" buttonlabel="Edit" size="mini" data-ng-model="themeData.rel_prdstyle"></rgen-radio>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Product page components</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">

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
						<li>
							<label class="lbl">Specification</label>
							<rgen-onoff type="alone" data-ng-model="themeData.specification_status"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Product page structure</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Main wrapper" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.structure.wrp"></rgen-box>

			<div class="field-box">
				<label>Row structure</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Row</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.structure.rw"></rgen-box>
						</li>
						<li>
							<label class="lbl">Left wrapper</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.structure.l_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Left inner</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.structure.l_in"></rgen-box>
						</li>
						<li>
							<label class="lbl">Right wrapper</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.structure.r_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Right inner</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.structure.r_in"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Breadcrumb</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box config="{ fonts: 0, align: 1 }" label="Wrapper" buttonlabel="Edit" data-ng-model="themeData.pg_heading.block"></rgen-box>
			<rgen-bgimage label="Wrapper background image" buttonlabel="Edit" data-ng-model="themeData.pg_heading.block_img"></rgen-bgimage>

			<rgen-box config="{ align: 1, f_size:1, color:1 }" label="Breadcrumb block" buttonlabel="Edit" data-ng-model="themeData.pg_heading.breadcrumb.block"></rgen-box>
			<div class="field-box">
				<label>Breadcrumb links & separator</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Link normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.pg_heading.breadcrumb.link_normal"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Link hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.pg_heading.breadcrumb.link_hover"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Separator</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.pg_heading.breadcrumb.sep"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Rating</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.rating.block"></rgen-box>
			<div class="field-box">
				<label>Stars</label>
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

			<div class="field-box">
				<label>Links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.rating.a"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.rating.a_hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Social sharing code</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Sharing code</label>
				<div class="fields">
					<textarea data-ng-model="themeData.social_sharing" class="w-full form-field h-200" pholder="Enter code">{{themeData.social_sharing}}</textarea>
				</div>
			</div>
		</div>
	</div>
</section>