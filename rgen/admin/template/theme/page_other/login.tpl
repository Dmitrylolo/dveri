<rgen-reset resetfn="reset('login')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">New customer block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.new_cust.block"></rgen-box>
			<rgen-box label="Title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.new_cust.hd"></rgen-box>
			<rgen-button label="Button" buttonlabel="Edit" data-ng-model="themeData.new_cust.btn"></rgen-button>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Old customer block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.old_cust.block"></rgen-box>
			<rgen-box label="Title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.old_cust.hd"></rgen-box>
			<rgen-box label="Field labels" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.old_cust.label"></rgen-box>
			<rgen-box label="Fields" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.old_cust.fields"></rgen-box>
			<rgen-button label="Button" buttonlabel="Edit" data-ng-model="themeData.old_cust.btn"></rgen-button>
		</div>
	</div>
</section>