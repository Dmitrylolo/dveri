<rgen-reset resetfn="reset('headings')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Headings</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">

			<rgen-box config="{ align: 1, color: 1, f_size:1 }" label="Module headings" buttonlabel="Edit" data-ng-model="themeData.module_hd"></rgen-box>
			<rgen-box config="{ align: 1, color: 1, f_size:1 }" label="Column module headings" buttonlabel="Edit" data-ng-model="themeData.column_module_hd"></rgen-box>
			<rgen-box config="{ align: 1, color: 1, f_size:1 }" label="Footer headings" buttonlabel="Edit" data-ng-model="themeData.footer_hd"></rgen-box>
			
			<h3 class="rgen-hd-1">Other headings used in content</h3>
			<rgen-fonts label="Common fonts" buttonlabel="Edit" data-ng-model="themeData.other_hd.fonts"></rgen-fonts>
			<div class="field-box">
				<label>Other heading classes</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">.h1</label>
							<rgen-box type="alone" config="{ fonts:0, bg:0, shadow:0, f_size:1, color: 1 }" buttonlabel="Edit" data-ng-model="themeData.other_hd.h1"></rgen-box>
						</li>
						<li>
							<label class="lbl">.h2</label>
							<rgen-box type="alone" config="{ fonts:0, bg:0, shadow:0, f_size:1, color: 1 }" buttonlabel="Edit" data-ng-model="themeData.other_hd.h2"></rgen-box>
						</li>
						<li>
							<label class="lbl">.h3</label>
							<rgen-box type="alone" config="{ fonts:0, bg:0, shadow:0, f_size:1, color: 1 }" buttonlabel="Edit" data-ng-model="themeData.other_hd.h3"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Other heading classes</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">.h4</label>
							<rgen-box type="alone" config="{ fonts:0, bg:0, shadow:0, f_size:1, color: 1 }" buttonlabel="Edit" data-ng-model="themeData.other_hd.h4"></rgen-box>
						</li>
						<li>
							<label class="lbl">.h5</label>
							<rgen-box type="alone" config="{ fonts:0, bg:0, shadow:0, f_size:1, color: 1 }" buttonlabel="Edit" data-ng-model="themeData.other_hd.h5"></rgen-box>
						</li>
						<li>
							<label class="lbl">.h6</label>
							<rgen-box type="alone" config="{ fonts:0, bg:0, shadow:0, f_size:1, color: 1 }" buttonlabel="Edit" data-ng-model="themeData.other_hd.h6"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>