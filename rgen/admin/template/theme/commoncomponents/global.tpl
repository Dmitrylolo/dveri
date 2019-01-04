<rgen-reset resetfn="reset('global')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Links and border</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">

			<div class="field-box">
				<label>Link colors</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.links.normal"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.links.hover"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			<rgen-colorpicker label="Global border color" data-ng-model="themeData.border_color"></rgen-colorpicker>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">HR tag (Global Separators)</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<div class="field-box">
				<label>HR tag</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, w:1, h:1}" buttonlabel="Edit" data-ng-model="themeData.hr.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">BG</label>
							<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.hr.bg"></rgen-bgimage>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Scroll to top</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">

			<div class="field-box">
				<label>Settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Background</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.scrolltop.background"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" config="{type:'ico'}" buttonlabel="Edit" data-ng-model="themeData.scrolltop.icon"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Border</label>
							<rgen-border type="alone" buttonlabel="Edit" data-ng-model="themeData.scrolltop.border"></rgen-border>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Pagination</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<div class="field-box">
				<label class="tip">Pagination settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.pagination.wrapper"></rgen-box>
						</li>
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.pagination.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.pagination.active"></rgen-box>
						</li>
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.pagination.normal"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Carousel arrows</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<div class="field-box">
				<label class="tip">Arrows</label>

				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Arrow block</label>
							<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.arrow_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Arrows</label>
							<rgen-button type="alone" label="" buttonlabel="Edit" data-ng-model="themeData.arrows"></rgen-button>
						</li>
						<li>
							<label class="lbl">Line beside arrows</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.arrow_line"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Slide show dot navigation</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<div class="field-box">
				<label>Dots</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Line</label><br>
							<rgen-colorpicker type="alone" data-ng-model="themeData.dots.dot_line"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" config="{fonts:0, w:1, h:1, padding:0}" buttonlabel="Edit" data-ng-model="themeData.dots.dot_normal"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active</label>
							<rgen-box type="alone" config="{fonts:0, padding:0, margin:0}" buttonlabel="Edit" data-ng-model="themeData.dots.dot_active"></rgen-box>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>


