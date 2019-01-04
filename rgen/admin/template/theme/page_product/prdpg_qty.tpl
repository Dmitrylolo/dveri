<rgen-reset resetfn="reset('prdpg_qty')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Product quantity block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Block" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.block"></rgen-box>

			<h3 class="rgen-hd-1">Quantity</h3>
			<rgen-box label="Label" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.qty_lbl"></rgen-box>
			<rgen-box label="Block" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.qty_block"></rgen-box>
			<rgen-box label="Input" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.qty_input"></rgen-box>
			<rgen-button label="Buttons" buttonlabel="Edit" data-ng-model="themeData.qty_btn"></rgen-button>
			
			<h3 class="rgen-hd-1">Buttons</h3>
			<div class="field-box">
				<label>Cart button</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons config="{color:0}" type="alone" buttonlabel="Edit" data-ng-model="themeData.cart_icon"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Button</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.cart_btn"></rgen-button>
						</li>
						<li>
							<label class="lbl">Button text</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart_txt"></rgen-onoff>
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
							<rgen-colorpicker type="alone" data-ng-model="themeData.links"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.links_h"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</section>
