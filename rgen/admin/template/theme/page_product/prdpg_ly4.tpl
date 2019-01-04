<rgen-reset resetfn="reset('prdpg_ly4')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Layout</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-radio label="Image area size" helpimg="imgPath+'prdly1_size.jpg'" radiodata="col_sizes" size="mini" data-ng-model="themeData.l_size"></rgen-radio>
			<rgen-radio label="Image area right margin" helpimg="imgPath+'prdly1_gt.jpg'" radiodata="gutter" size="mini" data-ng-model="themeData.gt"></rgen-radio>
		</div>
	</div>
</section>
<section class="rgen-panel">
	<h2 class="hd">Price</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Outer wrapper" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData.price.wrapper"></rgen-box>
			<rgen-box label="Price block" config="{fonts:0, align:1, color:1, f_size:1, h:1}" buttonlabel="Edit" data-ng-model="themeData.price.block"></rgen-box>
			
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
						<li>
							<label class="lbl">Reward</label>
							<rgen-colorpicker type="alone" label="Reward" data-ng-model="themeData.price.reward"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Discounts</label>
							<rgen-colorpicker type="alone" label="Discounts" data-ng-model="themeData.price.discount"></rgen-colorpicker>
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
			
			<h3 class="rgen-hd-1">Product information</h3>
			<div class="field-box">
				<label>Product information</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Outer wrapper</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Item</label>
							<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.item"></rgen-box>
						</li>
						<li>
							<label class="lbl">Item label</label>
							<rgen-box type="alone" config="{color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.item_info.item_lbl"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>