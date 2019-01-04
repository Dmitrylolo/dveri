<rgen-reset resetfn="reset('prdpg_main_img')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Main image block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-onoff label="Image - Pop up" data-ng-model="themeData.popup"></rgen-onoff>
			<rgen-onoff label="Image - Zoom" data-ng-model="themeData.cloudzoom"></rgen-onoff>

			<rgen-box label="Outer main wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.outer_block"></rgen-box>
			<rgen-box label="Main image wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.main_img_wrp"></rgen-box>
			<rgen-box label="Main image block" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.main_img"></rgen-box>

			<rgen-box label="Thumb image wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.th_wrp"></rgen-box>
			<rgen-box label="Thumb image" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.th_img"></rgen-box>
			<rgen-box label="Thumb image - active" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.th_active"></rgen-box>
			<rgen-colorpicker label="Thumb image - active border" data-ng-model="themeData.th_img_active"></rgen-colorpicker>

			<rgen-box label="Arrow block" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.arrow_wrp"></rgen-box>
			<rgen-button label="Arrows" buttonlabel="Edit" data-ng-model="themeData.arrows"></rgen-button>
			<rgen-colorpicker label="Line beside arrows" data-ng-model="themeData.arrow_line"></rgen-colorpicker>
		</div>
	</div>
</section>
