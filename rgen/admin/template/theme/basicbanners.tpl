<h2 class="main-hd-dark sticky-true">
	R.Gen Basic banners
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
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
										<label class="lbl">Outer container</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.container"></rgen-box>
									</li>
									<li>
										<label class="lbl">Main wrapper</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.wrapper"></rgen-box>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.mod_hd"></rgen-box>
									</li>
									<li>
										<label class="lbl">Content block</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.content_wrp"></rgen-box>
									</li>
									<li>
										<label class="lbl">Custom HTML</label>
										<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.mod_customhtml"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Banner item</h3>
						<div class="field-box">
							<label>Items</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Items</label>
										<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.items"></rgen-box>
									</li>
								</ul>
							</div>
						</div>
						
						<h3 class="rgen-hd-1">Hover effect - 1</h3>
						<div class="field-box">
							<label>Customization</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Background</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect1.background"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Overlay</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect1.overlay"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect1.title"></rgen-box>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect1.description"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Hover effect - 2</h3>
						<div class="field-box">
							<label>Customization</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Background</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect2.background"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Overlay</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect2.overlay"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect2.title"></rgen-box>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect2.description"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Hover effect - 3</h3>
						<div class="field-box">
							<label>Customization</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Background</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect3.background"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Overlay</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect3.overlay"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Border</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect3.bdrcolor"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect3.title"></rgen-box>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect3.description"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Hover effect - 4</h3>
						<div class="field-box">
							<label>Customization</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Background</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect4.background"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Overlay</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect4.overlay"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect4.title"></rgen-box>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect4.description"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Hover effect - 5</h3>
						<div class="field-box">
							<label>Customization</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Background</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect5.background"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Overlay</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect5.overlay"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Border</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect5.bdrcolor"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect5.title"></rgen-box>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect5.description"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<h3 class="rgen-hd-1">Hover effect - 6</h3>
						<div class="field-box">
							<label>Customization</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Background</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect6.background"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Overlay</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect6.overlay"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Border</label>
										<rgen-colorpicker type="alone" data-ng-model="themeData.h_effect6.bdrcolor"></rgen-colorpicker>
									</li>
									<li>
										<label class="lbl">Title</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect6.title"></rgen-box>
									</li>
									<li>
										<label class="lbl">Description</label>
										<rgen-box type="alone" config="{color:1, f_size:1, margin:0, shadow:0, padding:0, border:0, bg:0}" buttonlabel="Edit" data-ng-model="themeData.h_effect6.description"></rgen-box>
									</li>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</section>


		</div>
	</div>

</div>
