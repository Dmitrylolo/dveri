<rgen-reset resetfn="reset('table_style')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Table style</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Table</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Background</label>
							<rgen-colorpicker type="alone" label="Backgroud color" data-ng-model="themeData.table.background"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Border</label>
							<rgen-border type="alone" buttonlabel="Edit" label="Border settings" data-ng-model="themeData.table.border"></rgen-border>
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Table header (TH)</h3>
			<div class="field-box">
				<label>Table head</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">TH</label>
							<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.th.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">First TH</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.th.first"></rgen-box>
						</li>
						<li>
							<label class="lbl">Last TH</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.th.last"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Table body (TD)</h3>
			<div class="field-box">
				<label>Table body</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">TD</label>
							<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.td.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">First TD</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.td.first"></rgen-box>
						</li>
						<li>
							<label class="lbl">Last TD</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.td.last"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>