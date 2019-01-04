<rgen-reset resetfn="reset('pg_heading')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Page heading</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-radio radiodata="pghd_styles" label="Page header style" data-ng-model="themeData.style"></rgen-radio>
			<rgen-radio radiodata="pghd_positions" size="mini" label="Page header position" data-ng-model="themeData.position"></rgen-radio>
			<rgen-box config="{ fonts: 0, align: 1 }" label="Wrapper" buttonlabel="Edit" data-ng-model="themeData.block"></rgen-box>
			<rgen-bgimage label="Wrapper background image" buttonlabel="Edit" data-ng-model="themeData.block_img"></rgen-bgimage>

			<div class="field-box">
				<label>Header text</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">H1 block</label>
							<rgen-box type="alone" config="{ align: 1, f_size:1, color:1 }" buttonlabel="Edit" data-ng-model="themeData.h1_block"></rgen-box>
						</li>
						<li>
							<label class="lbl">H1 text</label>
							<rgen-box type="alone" config="{ fonts: 0, align: 1, f_size:1, color:1 }" buttonlabel="Edit" data-ng-model="themeData.h1_text"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<rgen-radio radiodata="breadcrumb_home" label="Breadcrumb home link" data-ng-model="themeData.breadcrumb.home"></rgen-radio>
			<rgen-box config="{ align: 1, f_size:1, color:1 }" label="Breadcrumb block" buttonlabel="Edit" data-ng-model="themeData.breadcrumb.block"></rgen-box>
			<div class="field-box">
				<label>Breadcrumb links & separator</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Link normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.breadcrumb.link_normal"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Link hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.breadcrumb.link_hover"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Separator</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.breadcrumb.sep"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>