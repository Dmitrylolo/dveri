<h2 class="main-hd-dark sticky-true">
	Custom HTML
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<div ng-if="!module">
		<div class="alert alert-warning">No module available. <a ui-sref="mod_customhtml" class="dark rgen-btn mini">Create module</a></div>
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
			<script type="text/ng-template" id="theme_data.html">
				<section class="rgen-panel">
					<h2 class="hd">General</h2>
					<div class="panel-container">
						<div class="rgen-form-wrp form-full form-medium">
							<div class="field-box">
								<label>Layout</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Main wrapper</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].main"></rgen-box>
										</li>
										<li>
											<label class="lbl">Container</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_wrp"></rgen-box>
										</li>
										<li>
											<label class="lbl">Content area</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_content"></rgen-box>
										</li>

										<li>
											<label class="lbl">Main header</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_hd"></rgen-box>
										</li>
									</ul>
								</div>
							</div>

							<div class="field-box">
								<label>Custom HTML row</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Row</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].rw"></rgen-box>
										</li>
										<li>
											<label class="lbl">Left</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].l_cl"></rgen-box>
										</li>
										<li>
											<label class="lbl">Middle</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].m_cl"></rgen-box>
										</li>
										<li>
											<label class="lbl">Right</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].r_cl"></rgen-box>
										</li>
									</ul>
								</div>
							</div>

							<div class="field-box">
								<label>Custom HTML</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Top</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].t_html"></rgen-box>
										</li>
										<li>
											<label class="lbl">Bottom</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].b_html"></rgen-box>
										</li>
										<li>
											<label class="lbl">Left</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].l_html"></rgen-box>
										</li>
										<li>
											<label class="lbl">Middle</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].m_html"></rgen-box>
										</li>
										<li>
											<label class="lbl">Right</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].r_html"></rgen-box>
										</li>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</section>
			</script>

			<div class="rgen-btn-group tab-group mr10-b h-c">
				<label ng-repeat="data in manage_tabs" class="rgen-btn" ng-model="manage_tab" btn-radio="data.val" ng-click="tabtype(data.val)">{{data.label}}</label>
			</div>
			<section class="rgen-panel" ng-if="manage_tab != 'd'">
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<div class="field-box">
							<label>Status</label>
							<div class="fields">
								<rgen-onoff type="alone" data-ng-model="themeData[manage_tab].status" ng-click="checkStatus(manage_tab)"></rgen-onoff>
							</div>
						</div>
						<div class="field-box">
							<label>Copy settings from large screen section</label>
							<div class="fields">
								<a class="rgen-btn mini mediumlight" ng-click="copySettings(manage_tab, 'copy')">Copy now</a>
								<a class="rgen-btn mini highlighted" ng-click="copySettings(manage_tab, 'reset')">Reset to default</a>
							</div>
						</div>
						
					</div>
				</div>
			</section>
			
			<div ng-if="manage_tab == 'd'" ng-include="'theme_data.html'"></div>
			<div ng-if="manage_tab == 't'" ng-include="'theme_data.html'"></div>
			<div ng-if="manage_tab == 'm'" ng-include="'theme_data.html'"></div>

		</div>
	</div>

</div>
