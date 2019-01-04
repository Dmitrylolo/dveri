<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<h2 class="hd">Hover content</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">
					<!-- <rgen-icons buttonlabel="Edit" label="Icon" data-ng-model="hover.icon"></rgen-icons> -->
					<rgen-langtext label="Caption title" pholder="Enter title" size="w-large" data-ng-model="hover.title"></rgen-langtext>
					<rgen-textarea label="Caption description" pholder="Enter code" size="w-large" data-ng-model="hover.html"></rgen-textarea>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(hover, 'hover')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>