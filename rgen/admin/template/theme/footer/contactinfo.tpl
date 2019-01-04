<rgen-reset resetfn="reset('default_ft_contactinfo')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Contact info</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<div class="field-box">
				<label>Style</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Main block</label>
							<rgen-box type="alone" config="{color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Icon box</label>
							<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData.icon_blocks"></rgen-box>
						</li>
						<li>
							<label class="lbl">Text</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.text_color"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Link - normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.a"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Link - hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.a_hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			
			<h3 class="rgen-hd-1">Phone</h3>
			<div class="field-box">
				<label>Icon and status</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="themeData.ph_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" config="{ color:0 }" buttonlabel="Edit" data-ng-model="themeData.phone_icon"></rgen-icons>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Numbers</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Number 1</label>
							<input type="text" class="form-field w-small" data-ng-model="themeData.phone1">
						</li>
						<li>
							<label class="lbl">Number 2</label>
							<input type="text" class="form-field w-small" data-ng-model="themeData.phone2">
						</li>
					</ul>
				</div>
			</div>
			
			<h3 class="rgen-hd-1">FAX</h3>
			<div class="field-box">
				<label>Icon and status</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="themeData.fax_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" config="{ color:0 }" buttonlabel="Edit" data-ng-model="themeData.fax_icon"></rgen-icons>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Numbers</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Number 1</label>
							<input type="text" class="form-field w-small" data-ng-model="themeData.fax1">
						</li>
						<li>
							<label class="lbl">Number 2</label>
							<input type="text" class="form-field w-small" data-ng-model="themeData.fax2">
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Email address</h3>
			<div class="field-box">
				<label>Icon, Status and Email</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="themeData.mail_status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" config="{ color:0 }" buttonlabel="Edit" data-ng-model="themeData.mail_icon"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Email</label>
							<input type="text" class="form-field w-small" data-ng-model="themeData.maillink">
						</li>
					</ul>
				</div>
			</div>
			<rgen-langtext label="Mail text" pholder="Enter text" size="w-medium" data-ng-model="themeData.mailtext"></rgen-langtext>

		</div>
	</div>
</section>