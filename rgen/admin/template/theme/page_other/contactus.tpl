<rgen-reset resetfn="reset('contactus')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Contact information</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Block" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.info_block"></rgen-box>
			<rgen-box label="Title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.info_hd"></rgen-box>
			<rgen-box label="Content title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.info_sub_hd"></rgen-box>
			<rgen-box label="Image block" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.img_block"></rgen-box>
		</div>
	</div>
</section>