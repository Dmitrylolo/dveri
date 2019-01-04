<rgen-reset resetfn="reset('prdpg_options')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Product options</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Block" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.block"></rgen-box>
			<rgen-box label="Title" config="{align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.hd"></rgen-box>
			<rgen-box label="Form group" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.frm_group"></rgen-box>
			<rgen-box label="Form label" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.frm_lbl"></rgen-box>
			<rgen-box label="Form field block" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.frm_fields"></rgen-box>
			<rgen-box label="Form fields" config="{fonts:0, align:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.frm_ctrls"></rgen-box>
			<rgen-button label="Form buttons" buttonlabel="Edit" data-ng-model="themeData.frm_btn"></rgen-button>
		</div>
	</div>
</section>
