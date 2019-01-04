<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Row item manager</h3>
	</div>
	<div class="modal-body">
		<div class="rgen-form-wrp">
			<rgen-radio radiodata="gutter" size="mini" fhelp="Values in 'px'" label="Space between columns" data-ng-model="row.gutter"></rgen-radio>
			<rgen-radio radiodata="margin_b" size="mini" fhelp="Values in 'px'" label="Bottom margin of columns" data-ng-model="row.margin_b"></rgen-radio>
		</div>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(row)">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>