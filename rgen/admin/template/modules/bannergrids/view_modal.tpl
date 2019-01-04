<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Content view style</h3>
	</div>
	<div class="modal-body">

		<!--
		Block content
		=========================-->
		<section class="rgen-panel">
			<!-- <h2 class="hd">Block content view style</h2> -->
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-select label="Grid gutter" selectdata="bnr_gt" size="w-mini" data-ng-model="modaldata.content_view.gt"></rgen-select>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, 'block')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>