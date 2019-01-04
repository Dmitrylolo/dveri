<rgen-reset resetfn="reset('panel')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Panel (Accordion)</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Panel wrapper" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.panel_wrp"></rgen-box>
			<rgen-box label="Title block" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.title_block"></rgen-box>
			<rgen-box label="Title" config="{ align:1, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.title"></rgen-box>
			<rgen-box label="Panel body wrapper" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.body_wrp"></rgen-box>
			<rgen-box label="Panel body" config="{ fonts:0, align:1, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.body"></rgen-box>
		</div>
	</div>
</section>