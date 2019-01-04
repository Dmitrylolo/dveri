<rgen-reset resetfn="reset('default_ft_general')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">General</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">

			<div class="field-box">
				<label>Footer width settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Footer top</label>
							<rgen-radio type="alone" radiodata="layout_width" data-ng-model="themeData.top_width"></rgen-radio>
						</li>
						<li>
							<label class="lbl">Footer bottom</label>
							<rgen-radio type="alone" radiodata="layout_width" data-ng-model="themeData.bottom_width"></rgen-radio>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Footer main wrapper</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.main_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">BG image</label>
							<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.main_wrp_bgimg"></rgen-bgimage>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Footer top</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.top_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">BG image</label>
							<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.top_wrp_bgimg"></rgen-bgimage>
						</li>
						<li>
							<label class="lbl">Links</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.top_a"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Links hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.top_a_hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Footer bottom</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.bottom_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">BG image</label>
							<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.bottom_wrp_bgimg"></rgen-bgimage>
						</li>
						<li>
							<label class="lbl">Links</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.bottom_a"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Links hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.bottom_a_hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>
<section class="rgen-panel">
	<h2 class="hd">Footer cards</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-textarea label="Footer cards" pholder="Enter code" size="w-large" data-ng-model="themeData.cards"></rgen-textarea>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Copy right block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Copy right block</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.cp_block.wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Container</label>
							<rgen-box type="alone" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.cp_block.container"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<rgen-textarea label="Custom HTML" pholder="Enter code" size="w-large" data-ng-model="themeData.cp_block.html"></rgen-textarea>
		</div>
	</div>
</section>