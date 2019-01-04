<rgen-reset resetfn="reset('prdpg_ly2')" data-ng-model="themeData.status"></rgen-reset>

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
	<h2 class="hd">General</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<!-- <rgen-box label="Quick info link block" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.info_links.block"></rgen-box>
			<rgen-button label="Quick info links" buttonlabel="Edit" data-ng-model="themeData.info_links.links"></rgen-button> -->

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
		</div>
	</div>
</section>
