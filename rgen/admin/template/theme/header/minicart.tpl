<section class="rgen-panel">
	<h2 class="hd">Header cart</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Cart</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{ fonts:0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.cart.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Block hover</label>
							<rgen-box type="alone" config="{ fonts:0, color:1 }" buttonlabel="Edit" data-ng-model="themeData.cart.block_h"></rgen-box>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-box type="alone" config="{ fonts:0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.cart.icon"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Cart pop up</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{ fonts:0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.cart.popup_block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Text color</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.cart.popup_block_text"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">border</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.cart.popup_border_color"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Remove icon</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.cart.popup_remove_color"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Cart pop up links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.cart.popup_links.normal"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.cart.popup_links.hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Cart total block</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{ fonts:0, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.cart.popup_total_block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Text color</label>
							<rgen-colorpicker type="alone" label="Background color" data-ng-model="themeData.cart.popup_total_text"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Buttons</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Cart button</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.cart.popup_total_cartbtn"></rgen-button>
						</li>
						<li>
							<label class="lbl">Checkout button</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.cart.popup_total_checkoutbtn"></rgen-button>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Button icons</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Cart button icon</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart.popup_total_cartbtn_icon"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Checkout button icon</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart.popup_total_checkoutbtn_icon"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>