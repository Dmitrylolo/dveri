<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	Basic banners
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div ng-if="!module">
	<div class="alert alert-warning">No module available. <a ui-sref="mod_basicbanners" class="dark rgen-btn mini">Create module</a></div>
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
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.container"></rgen-box>
								</li>
								<li>
									<label class="lbl">Container</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.wrapper"></rgen-box>
								</li>
								<li>
									<label class="lbl">Content area</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.content_wrp"></rgen-box>
								</li>
								<li>
									<label class="lbl">Title</label>
									<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.mod_hd"></rgen-box>
								</li>
								<li>
									<label class="lbl">Custom HTML</label>
									<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.mod_customhtml"></rgen-box>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</section>

		<section class="rgen-panel">
			<h2 class="hd">Hover effects</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-select label="Select hover effect" selectdata="hover_effects" data-ng-model="themeData.effect_block"></rgen-select>

					<div ng-if="themeData.effect_block == 'n'" ng-include="tpl.none"></div>
					<div ng-if="themeData.effect_block == '1'" ng-include="tpl.effect1"></div>
					<div ng-if="themeData.effect_block == '2'" ng-include="tpl.effect2"></div>
					<div ng-if="themeData.effect_block == '3'" ng-include="tpl.effect3"></div>
					<div ng-if="themeData.effect_block == '4'" ng-include="tpl.effect4"></div>
					<div ng-if="themeData.effect_block == '5'" ng-include="tpl.effect5"></div>
					<div ng-if="themeData.effect_block == '6'" ng-include="tpl.effect6"></div>

				</div>
			</div>
		</section>


	</div>
</div>