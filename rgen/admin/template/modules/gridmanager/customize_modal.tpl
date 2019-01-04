<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">CSS customization</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-box label="CSS customization" config="{fonts:0}" buttonlabel="Edit" data-ng-model="modaldata.customize.block"></rgen-box>
					<rgen-bgimage label="Background image" buttonlabel="Edit" data-ng-model="modaldata.customize.bg_img"></rgen-bgimage>
					<rgen-text label="Custom CSS class" size="w-medium" data-ng-model="modaldata.customize.cssclass"></rgen-text>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata.customize, 'customize')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>