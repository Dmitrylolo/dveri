<h2 class="main-hd-dark sticky-true">
	R.Gen Menu
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<div ng-if="!module">
		<div class="alert alert-warning">No module available. <a ui-sref="mod_menu" class="dark rgen-btn mini">Create module</a></div>
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
			
			<rgen-reset resetfn="reset('fullmenu')" data-ng-model="themeData.status"></rgen-reset>

			<section class="rgen-panel">
				<h2 class="hd">General</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<div class="field-box">
							<label>Menu container</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Wrapper</label>
										<rgen-box type="alone" buttonlabel="Edit" config="{ fonts:0 }" data-ng-model="themeData.container"></rgen-box>
									</li>
									<li>
										<label class="lbl">Menu bar</label>
										<rgen-box type="alone" buttonlabel="Edit" config="{ fonts:0 }" data-ng-model="themeData.menubar"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<div class="field-box">
							<label>Menu item</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Wrapper</label>
										<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.menuitem.wrapper"></rgen-box>
									</li>
									<li>
										<label class="lbl">Link</label>
										<rgen-button type="alone" config="{ f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.menuitem.link"></rgen-button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="rgen-panel">
				<h2 class="hd">Sub menu</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						
						<div class="field-box">
							<label>Fly out menu</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Wrapper</label>
										<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.flyoutmenu.wrapper"></rgen-box>
									</li>
									<li>
										<label class="lbl">Link</label>
										<rgen-button type="alone" config="{ f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.flyoutmenu.link"></rgen-button>
									</li>
								</ul>
							</div>
						</div>

						<rgen-box label="Mega menu" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.megamenu.wrapper"></rgen-box>
					</div>
				</div>
			</section>

			<div class="rgen-btn-group tab-group mr10-b h-c">
				<label ng-repeat="data in item_type" class="rgen-btn mini" ng-model="item_type_tab" btn-radio="data.val" ng-click="itemtype(data.val)">{{data.label}}</label>
			</div>

			<div ng-if="item_type_tab == 'normal'" ng-include="tpl.mg_normal"></div>
			<div ng-if="item_type_tab == 'cat'" ng-include="tpl.mg_cat"></div>
			<div ng-if="item_type_tab == 'prd'" ng-include="tpl.mg_prd"></div>
			<div ng-if="item_type_tab == 'brand'" ng-include="tpl.mg_brand"></div>
			<div ng-if="item_type_tab == 'bannerimg'" ng-include="tpl.mg_bannerimg"></div>
			<div ng-if="item_type_tab == 'infobox'" ng-include="tpl.mg_infobox"></div>
			<div ng-if="item_type_tab == 'customhtml'" ng-include="tpl.mg_customhtml"></div>
			
			<section class="rgen-panel">
				<h2 class="hd">Mobile menu</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<rgen-box label="Menu handle" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_handle"></rgen-box>
						<rgen-box label="Sub handle" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_subhandle"></rgen-box>
						<rgen-box label="Menu wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.m_nav"></rgen-box>
						<rgen-box label="Sub menu wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.m_subwrp"></rgen-box>
						<rgen-box label="Menu items" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_mainitem"></rgen-box>
						<rgen-box label="Sub items" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_subitem"></rgen-box>
					</div>
				</div>
			</section>

		</div>
	</div>

</div>
