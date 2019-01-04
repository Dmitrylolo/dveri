<section class="rgen-panel">
	<h2 class="hd">Brands</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">

			<h3 class="rgen-hd-1">Brand box style 1</h3>
			<div class="field-box">
				<label>Block</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" config="{fonts: 0}" buttonlabel="Edit" data-ng-model="themeData.megamenu.brandblock1.block.normal"></rgen-box>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-box type="alone" config="{fonts: 0}" buttonlabel="Edit" data-ng-model="themeData.megamenu.brandblock1.block.hover"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Text</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.megamenu.brandblock1.linktext.normal"></rgen-box>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-box type="alone" config="{fonts: 0}" buttonlabel="Edit" data-ng-model="themeData.megamenu.brandblock1.linktext.hover"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Brand box style 2</h3>
			<div class="field-box">
				<label>Block & hover settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Background</label>
							<rgen-box type="alone" config="{fonts: 0}" buttonlabel="Edit" data-ng-model="themeData.megamenu.brandblock2.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Hover background</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.megamenu.brandblock2.hover.background"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover text color</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.megamenu.brandblock2.hover.textcolor"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>