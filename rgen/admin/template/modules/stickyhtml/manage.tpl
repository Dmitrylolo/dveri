<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	Sticky HTML
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<!-- Inner layout -->
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Create</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		
		<!--
		Module name
		=========================-->
		<div class="rgen-panel dark" tooltip="Module name">
			<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
		</div>

		<!--
		Common settings
		=========================-->
		<section class="rgen-panel">
			<h2 class="hd">Block settings</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">

					<div class="field-box">
						<label class="tip">Settings</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Icon</label>
									<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="modConetnt.common.icon"></rgen-icons>
								</li>
								<li>
									<label class="lbl">Position</label>
									<rgen-radio type="alone" radiodata="htmlplaces" size="small" data-ng-model="modConetnt.common.position"></rgen-radio>
								</li>
							</ul>
						</div>
					</div>

					<div class="field-box">
						<label class="tip">Position and Width</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Position from top</label><br>
									<input type="text" class="form-field w-mini inline" data-ng-model="modConetnt.common.top">
								</li>
								<li>
									<label class="lbl">Content width</label><br>
									<input type="text" class="form-field w-mini inline" data-ng-model="modConetnt.common.w">
								</li>
								<li>
									<label class="lbl">CSS Class</label><br>
									<input type="text" class="form-field w-small inline" data-ng-model="modConetnt.common.cssclass">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="rgen-panel">
			<h2 class="hd">Block content</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">

					<h3 class="rgen-hd-1">Title</h3>
					<rgen-onoff label="Status" data-ng-model="modConetnt.common.title_status"></rgen-onoff>
					<rgen-langtext label="Text" pholder="Enter title" size="w-full" data-ng-model="modConetnt.common.title"></rgen-langtext>
					
					<h3 class="rgen-hd-1">HTML content</h3>
					<rgen-onoff label="Status" data-ng-model="modConetnt.common.html_status"></rgen-onoff>
					<rgen-textarea label="Content" size="w-full h-250 code-input" data-ng-model="modConetnt.common.html"></rgen-textarea>
				</div>
			</div>
		</section>

	</div>
</div>
