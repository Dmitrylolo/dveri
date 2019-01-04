<h2 class="main-hd-dark sticky-true">
	General
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('theme_general')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">Theme layout settings</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-onoff label="Responsive status" data-ng-model="themeData.layout_settings.responsive_status"></rgen-onoff>
				<rgen-onoff label="Wide layout" data-ng-model="themeData.layout_settings.wide_status"></rgen-onoff>
				<rgen-radio radiodata="layout_width" label="Layout width" data-ng-model="themeData.layout_settings.layout_width"></rgen-radio>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Body</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>Style settings</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Body</label>
								<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.body.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Background image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.body.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Page container</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>Style settings</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Page</label>
								<rgen-box type="alone" config="{ fonts:0, margin:0 }" buttonlabel="Edit" data-ng-model="themeData.page_container.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Background image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.page_container.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>
						Margin
						<div class="help-text">Top - Bottom</div>
					</label>
					<div class="fields">
						<input type="text" class="form-field inline w-tiny" data-ng-model="themeData.page_container.margin_t"> - 
						<input type="text" class="form-field inline w-tiny" data-ng-model="themeData.page_container.margin_b"> px
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Content area</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>Style settings</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.contentarea.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Background image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.contentarea.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Content area - Container</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>Style settings</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.contentbox.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Background image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.contentbox.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
