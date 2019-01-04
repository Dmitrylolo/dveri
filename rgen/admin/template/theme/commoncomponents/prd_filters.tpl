<rgen-reset resetfn="reset('prd_filters')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Product filters</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<rgen-box label="Filter bar" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.block"></rgen-box>
			<rgen-button label="Compare button" buttonlabel="Edit" data-ng-model="themeData.compare"></rgen-button>
			<rgen-colorpicker label="Filter labels" data-ng-model="themeData.filter_lbl"></rgen-colorpicker>
			<rgen-box label="Filter controls" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.filter_ctrl"></rgen-box>
			<div class="field-box">
				<label>Display buttons</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Color</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.display"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Button</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, w:1, h:1}" buttonlabel="Edit" data-ng-model="themeData.display_btn"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active color</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.display_active"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Active button</label>
							<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData.display_btn_active"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>