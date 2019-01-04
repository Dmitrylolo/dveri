<rgen-reset resetfn="reset('sitemap')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Site map blocks</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Main block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.main"></rgen-box>
			<rgen-box label="Left block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.left"></rgen-box>
			<rgen-box label="Right block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.right"></rgen-box>
			<rgen-box label="Main links" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.main_links"></rgen-box>
			<rgen-box label="Sub links" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.sub_links"></rgen-box>
			<div class="field-box">
				<label>Sub links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.a"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.a_hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>