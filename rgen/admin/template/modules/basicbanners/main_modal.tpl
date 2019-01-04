<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<section class="rgen-panel">
			<h2 class="hd">Item</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">
					<rgen-imgupload label="Image upload" data-ng-model="banner.img"></rgen-imgupload>
					<rgen-langtext label="Title" fhelp="Use as TITLE and ALT tag of image" pholder="Enter title" size="w-large" data-ng-model="banner.title"></rgen-langtext>
					<rgen-text label="URL" pholder="Enter URL - http://...." size="w-large" data-ng-model="banner.url"></rgen-text>
					<rgen-onoff label="Open in new window" data-ng-model="banner.win"></rgen-onoff>
				</div>
			</div>
		</section>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(banner, 'banner')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>