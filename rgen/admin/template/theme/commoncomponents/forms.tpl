<rgen-reset resetfn="reset('forms')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Forms</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Outer box" config="{ fonts:0, color: 1, f_size: 1 }" buttonlabel="Edit" data-ng-model="themeData.block"></rgen-box>
			<rgen-box label="Title" config="{ align: 1, color: 1, f_size: 1 }" buttonlabel="Edit" data-ng-model="themeData.title"></rgen-box>
			<rgen-box label="Labels" config="{ align: 1, color: 1, f_size: 1 }" buttonlabel="Edit" data-ng-model="themeData.label"></rgen-box>
			<rgen-box label="Form controllers" config="{ fonts:0, align: 1, color: 1, f_size: 1 }"  buttonlabel="Edit" data-ng-model="themeData.form_control"></rgen-box>
			<rgen-box label="Button bar" config="{ align: 1, color: 1, f_size: 1 }" buttonlabel="Edit" data-ng-model="themeData.button_bar"></rgen-box>
		</div>
	</div>
</section>