<h2 class="main-hd-dark sticky-true">
	Custom code
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<div class="rgen-btn-group tab-group mr10-b">
		<label ng-repeat="data in codetype" class="rgen-btn" ng-model="codetype_tab" btn-radio="data.val" ng-click="codetype_fn(data.val)">{{data.label}}</label>
	</div>

	<section class="rgen-panel" ng-if="codetype_tab == 'css'">
		<h2 class="hd">CSS code direct input</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-small">
				<rgen-onoff label="Status" data-ng-model="themeData.css_status"></rgen-onoff>
				<div class="pd20">
					<textarea class="form-field w-full code-input" ng-model="themeData.css" cols="100" rows="40"></textarea>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel" ng-if="codetype_tab == 'cssf'">
		<div class="hd">
			Add CSS files
			<a class="rgen-btn mediumlight small" ng-click="addFile('css')">Add file</a>
		</div>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-small">
				<rgen-onoff label="Status" data-ng-model="themeData.cssfile_status"></rgen-onoff>
				<div class="field-box" ng-repeat="(key, value) in themeData.cssfile">
					<label>Enter file path</label>
					<div class="fields">
						<input type="text" class="form-field inline" style="width: 695px; margin-left: 0" data-ng-model="value.file">
						<a class="rgen-btn highlighted small" ng-click="removeFile($index, 'css')"><i class="fa fa-times"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel" ng-if="codetype_tab == 'js'">
		<h2 class="hd">JS code direct input</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-small">
				<rgen-onoff label="Status" data-ng-model="themeData.js_status"></rgen-onoff>
				<div class="pd20">
					<textarea class="form-field w-full code-input" ng-model="themeData.js" cols="100" rows="40"></textarea>	
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel" ng-if="codetype_tab == 'jsf'">
		<div class="hd">
			Add JS files
			<a class="rgen-btn mediumlight small" ng-click="addFile('js')">Add file</a>
		</div>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-small">
				<rgen-onoff label="Status" data-ng-model="themeData.jsfile_status"></rgen-onoff>
				<div class="field-box" ng-repeat="(key, value) in themeData.jsfile">
					<label>Enter file path</label>
					<div class="fields">
						<input type="text" class="form-field inline" style="width: 695px; margin-left: 0" data-ng-model="value.file">
						<a class="rgen-btn highlighted small" ng-click="removeFile($index, 'js')"><i class="fa fa-times"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
