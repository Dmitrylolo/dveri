<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	R.Gen Basic Slideshow
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div ng-if="!module">
	<div class="alert alert-warning">No module available. <a ui-sref="mod_basicslideshow" class="dark rgen-btn mini">Create module</a></div>
</div>
<div class="rgen-row gut-10" ng-if="module">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<h2 class="hd h-c">Module list</h2>
			<ul class="list">
				<li ng-repeat="mod in modList | orderBy: 'name'" ng-class="{'active' : mod.val == modId}"><a ng-click="getkey(mod.val)">{{mod.name}}</a><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		
		<rgen-reset resetfn="reset('fullreset')" data-ng-model="themeData.status"></rgen-reset>
		
		<section class="rgen-panel">
			<h2 class="hd">General</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
				
					<div class="field-box">
						<label>Module style</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Main wrapper</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.main_wrp"></rgen-box>
								</li>
								<li>
									<label class="lbl">Container</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.container"></rgen-box>
								</li>
								<li>
									<label class="lbl">Slide show wrapper</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.slideshow_wrp"></rgen-box>
								</li>
								<li>
									<label class="lbl">Slide show block</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.slideshow"></rgen-box>
								</li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</section>


	</div>
</div>