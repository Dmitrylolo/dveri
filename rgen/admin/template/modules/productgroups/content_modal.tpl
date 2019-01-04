<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<h2 class="hd">Content</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">
					<rgen-onoff label="Title status" data-ng-model="modaldata.content.title_status"></rgen-onoff>
					<rgen-langtext label="Title" fhelp="Used as tab name or section title" pholder="Enter title" size="w-large" data-ng-model="modaldata.content.title"></rgen-langtext>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, modaldata.node_type, 'content')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>