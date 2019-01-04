<h2 class="main-hd-dark sticky-true">
	Product groups
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<div ng-if="!module">
		<div class="alert alert-warning">No module available. <a ui-sref="mod_productgroups" class="dark rgen-btn mini">Create module</a></div>
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
				<h2 class="hd">Controls</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">

						<div class="field-box">
							<label>Arrows</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Wrapper</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.arrows.wrp"></rgen-box>
									</li>
									<li>
										<label class="lbl">Line</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.arrows.arrow_line"></rgen-box>
									</li>
									<li>
										<label class="lbl">Arrows</label>
										<rgen-button type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.arrows.arrow"></rgen-button>
									</li>
								</ul>
							</div>
						</div>
						<div class="field-box">
							<label>Dots</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Wrapper</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.dots.wrp"></rgen-box>
									</li>
									<li>
										<label class="lbl">Normal</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.dots.normal"></rgen-box>
									</li>
									<li>
										<label class="lbl">Active</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.dots.active"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</section>

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
									</ul>
								</div>
							</div>

							<div class="field-box">
								<label>Headers</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Common header</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_hd"></rgen-box>
										</li>
										<li>
											<label class="lbl">Sub headers</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_sub_hd"></rgen-box>
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
											<label class="lbl">Right</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].r_html"></rgen-box>
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

						</div>
					</div>
				</section>

				<section class="rgen-panel">
					<h2 class="hd">Tab 1</h2>
					<div class="panel-container">
						<div class="rgen-form-wrp form-full form-medium">
							<rgen-box label="Container" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_container"></rgen-box>

							<div class="field-box">
								<label>Tab items</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Panel</label>
											<rgen-box type="alone" config="{fonts:0,align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_panel"></rgen-box>
										</li>
										<li>
											<label class="lbl">Items</label>
											<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_item"></rgen-box>
										</li>
										<li>
											<label class="lbl">Active items</label>
											<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_item_active"></rgen-box>
										</li>
										<li>
											<label class="lbl">Text</label>
											<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_item_a"></rgen-box>
										</li>
										<li>
											<label class="lbl">Active text</label>
											<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_item_active_a"></rgen-box>
										</li>
									</ul>
								</div>
							</div>

							<div class="field-box">
								<label>Tab panes</label>
								<div class="fields">
									<ul class="form-row">
										<li>
											<label class="lbl">Wrapper</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_pane_wrp"></rgen-box>
										</li>
										<!-- <li>
											<label class="lbl">Tab pane</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_pane"></rgen-box>
										</li> -->
										<li>
											<label class="lbl">Active tab pane</label>
											<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].tab1.tab_pane_active"></rgen-box>
										</li>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</section>

				<section class="rgen-panel">
					<h2 class="hd">Product blocks</h2>
					<div class="panel-container">
						<div class="rgen-form-wrp form-full form-medium">
							<rgen-prdbox1 label="Product block 1" config="{type: 'normal'}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].prd_block1"></rgen-prdbox1>
							<rgen-prdbox2 label="Product block 2" config="{type: 'normal'}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].prd_block2"></rgen-prdbox2>
							<rgen-smallprdbox1 label="Small product block 1" buttonlabel="Edit" data-ng-model="themeData[manage_tab].prd_small1"></rgen-smallprdbox1>
							<rgen-smallprdbox2 label="Small product block 2" buttonlabel="Edit" data-ng-model="themeData[manage_tab].prd_small2"></rgen-smallprdbox2>
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
