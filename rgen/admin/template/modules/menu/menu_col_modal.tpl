<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Column size manager</h3>
	</div>
	<div class="modal-body">
		<div class="rgen-form-wrp">
			<rgen-radio radiodata="lg_desktop_size" size="mini" lhelp="Screen resolution : 1200px+" fhelp="Size based on 12 column concept" label="Large screens" data-ng-model="col.lg_desktop"></rgen-radio>
			
			<rgen-radio radiodata="desktop_size" size="mini" lhelp="Screen resolution : 980px to 1199px" fhelp="Size based on 12 column concept" label="Medium screens" data-ng-model="col.desktop"></rgen-radio>

			<rgen-radio radiodata="tablet_size" size="mini" lhelp="Screen resolution : 768px to 979px" fhelp="Size based on 12 column concept" label="Tablet screens" data-ng-model="col.tablet"></rgen-radio>
			
			<rgen-radio radiodata="mob_xl_size" size="mini" lhelp="Screen resolution : 600px to 767px" fhelp="Size based on 12 column concept" label="Mobile large screens" data-ng-model="col.mob_xl"></rgen-radio>
			
			<rgen-radio radiodata="mob_sm_size" size="mini" lhelp="Screen resolution : 480px to 599px" fhelp="Size based on 12 column concept" label="Mobile medium screens" data-ng-model="col.mob_sm"></rgen-radio>
			
			<rgen-radio radiodata="mob_xs_size" size="mini" lhelp="Screen resolution : 320px to 479px" fhelp="Size based on 12 column concept" label="Mobile small screens" data-ng-model="col.mob_xs"></rgen-radio>

			<rgen-border buttonlabel="Edit" label="Border settings" data-ng-model="col.border"></rgen-border>
		</div>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(col)">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>