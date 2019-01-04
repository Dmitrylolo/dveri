<h2 class="main-hd-dark sticky-true">
	Checkout page
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">

	<rgen-reset resetfn="reset('checkout')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>

	<section class="rgen-panel">
		<h2 class="hd">Buttons</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-button label="Default button" buttonlabel="Edit" data-ng-model="themeData.default_btn"></rgen-button>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Panel (Accordion)</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">

				<rgen-box label="Panel wrapper" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.panel.panel_wrp"></rgen-box>
			
				<div class="field-box">
					<label>Title</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" label="Title block" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.panel.title_block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Title</label>
								<rgen-box type="alone" label="Title" config="{ align:1, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.panel.title"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>Panel body</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Wrapper</label>
								<rgen-box type="alone" label="Panel body wrapper" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.panel.body_wrp"></rgen-box>
							</li>
							<li>
								<label class="lbl">Body</label>
								<rgen-box type="alone" label="Panel body" config="{ fonts:0, align:1, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.panel.body"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Forms</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-box label="Outer box" config="{ fonts:0, color: 1, f_size: 1 }" buttonlabel="Edit" data-ng-model="themeData.forms.block"></rgen-box>

				<div class="field-box">
					<label>Other</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Title</label>
								<rgen-box type="alone" label="Title" config="{ align: 1 }" buttonlabel="Edit" data-ng-model="themeData.forms.title"></rgen-box>
							</li>
							<li>
								<label class="lbl">Labels</label>
								<rgen-box type="alone" label="Labels" config="{ align: 1 }" buttonlabel="Edit" data-ng-model="themeData.forms.label"></rgen-box>
							</li>
							<li>
								<label class="lbl">Controllers</label>
								<rgen-box type="alone" label="Form controllers" config="{ fonts:0, align: 1, color: 1, f_size: 1 }"  buttonlabel="Edit" data-ng-model="themeData.forms.form_control"></rgen-box>
							</li>
							<li>
								<label class="lbl">Button bar</label>
								<rgen-box type="alone" label="Button bar" buttonlabel="Edit" data-ng-model="themeData.forms.button_bar"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
			
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Table style</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>Table</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" label="Backgroud color" data-ng-model="themeData.table_style.table.background"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-border type="alone" buttonlabel="Edit" label="Border settings" data-ng-model="themeData.table_style.table.border"></rgen-border>
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
								<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.table_style.th.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">First TH</label>
								<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.th.first"></rgen-box>
							</li>
							<li>
								<label class="lbl">Last TH</label>
								<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.th.last"></rgen-box>
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
								<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.table_style.td.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">First TD</label>
								<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.td.first"></rgen-box>
							</li>
							<li>
								<label class="lbl">Last TD</label>
								<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.td.last"></rgen-box>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
</div>
