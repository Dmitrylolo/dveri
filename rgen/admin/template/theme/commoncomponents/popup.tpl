<rgen-reset resetfn="reset('popup')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Pop up block</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box label="Outer box" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.modal"></rgen-box>
			<rgen-box label="Header box" config="{ fonts:0, align: 1 }" buttonlabel="Edit" data-ng-model="themeData.modal_header"></rgen-box>
			<rgen-fonts label="Header fonts" buttonlabel="Edit" data-ng-model="themeData.modal_header_fonts"></rgen-fonts>
			<rgen-box label="Content area" config="{ color:1, align: 1 }" buttonlabel="Edit" data-ng-model="themeData.modal_body"></rgen-box>
			<rgen-colorpicker label="Close button" data-ng-model="themeData.modal_close"></rgen-colorpicker>
		</div>
	</div>
</section>