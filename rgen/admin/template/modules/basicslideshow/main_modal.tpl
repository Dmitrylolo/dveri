<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<h2 class="hd">Item</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full">
					<rgen-imgupload label="Image upload" data-ng-model="modaldata.slide"></rgen-imgupload>
					<rgen-langtext label="Slide title" pholder="Enter title" size="w-large" data-ng-model="modaldata.title"></rgen-langtext>
					<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="modaldata.url"></rgen-text>
					<rgen-onoff label="Open in new window" data-ng-model="modaldata.win"></rgen-onoff>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata)">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>