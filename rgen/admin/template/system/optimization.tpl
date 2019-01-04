<h2 class="main-hd-dark sticky-true">
	Theme optimization
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<section class="rgen-panel">
		<h2 class="hd">CSS and JS Compress</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">

				<div class="field-box">
					<label>CSS compress</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Status</label>
								<rgen-onoff type="alone" data-ng-model="systemData.system_optimization.cssminify"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Clear</label><br>
								<a class="rgen-btn highlighted mini" ng-click="clear('css', 'n')">Clear CSS files</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>JS compress</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Status</label>
								<rgen-onoff type="alone" data-ng-model="systemData.system_optimization.jsminify"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Clear</label><br>
								<a class="rgen-btn highlighted mini" ng-click="clear('js', 'n')">Clear JS files</a>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Cache module data</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">

				<div class="field-box" ng-repeat="mod in modlist">
					<label>{{mod.name}}</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Status</label>
								<rgen-onoff type="alone" data-ng-model="systemData.system_optimization[mod.code]"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Clear</label><br>
								<a class="rgen-btn highlighted mini" ng-click="clear('module', mod.code)">Clear cache data</a>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</section>


</div>
