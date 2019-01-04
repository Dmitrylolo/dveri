<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<div class="rgen-btn-group tab-group mr10-b h-l">
			<input type="text" tooltip="Preview title" class="form-field w-full fs13 h-c" data-ng-model="block_title">
		</div>

		<!--
		Block content
		=========================-->
		<section class="rgen-panel">
			<h2 class="hd">Tab content</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-langtext label="Tab name" pholder="Enter title" size="w-large" data-ng-model="modaldata.content.title"></rgen-langtext>
					<rgen-textarea label="Description" size="w-full h-250 code-input" data-ng-model="modaldata.content.description"></rgen-textarea>
				</div>
			</div>
		</section>
		
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, 'block')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>