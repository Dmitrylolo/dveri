<rgen-reset resetfn="reset('brands')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Brand index block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Index block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.index.block"></rgen-box>
			<rgen-box label="Index title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.index.hd"></rgen-box>
			<rgen-button label="A to Z" buttonlabel="Edit" data-ng-model="themeData.index.atoz"></rgen-button>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Brand name listing</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="List block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.list.block"></rgen-box>
			<rgen-box label="List title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.list.hd"></rgen-box>
			<rgen-box label="List body block" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.list.body"></rgen-box>
			<rgen-box label="List item" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.list.item"></rgen-box>
			<div class="field-box">
				<label>List item links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.list.a"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.list.a_hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>