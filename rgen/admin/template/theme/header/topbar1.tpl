<rgen-reset ng-if="activeTab == 'header.home'" resetfn="reset('topbar1')" data-ng-model="themeData.status">Home page</rgen-reset>
<rgen-reset ng-if="activeTab == 'header.inner'" resetfn="reset('topbar1_inner')" data-ng-model="themeData.status">inner page</rgen-reset>

<section ng-if="activeTab == 'header.inner'" class="rgen-panel dark">
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<div class="field-box">
				<label>Use same settings as home page header</label>
				<div class="fields">
					<rgen-radio radiodata="yn" type="alone" data-ng-model="themeData.topbar_inner_status" radiofn="topbar_inner_status(themeData.topbar_inner_status)"></rgen-radio>
				</div>
			</div>
			<div ng-if="themeData.topbar_inner_status =='n'" class="field-box">
				<label>Copy settings from home page header</label>
				<div class="fields">
					<a class="rgen-btn highlighted" data-ng-click="topbar_inner_status('y', 'y')">Copy now</a>
					<div class="help-text">Copy settings will reset your existing settings</div>
				</div>
			</div>
		</div>
	</div>
</section>

<div ng-if="activeTab == 'header.home' || themeData.topbar_inner_status == 'n'">
	<section class="rgen-panel">
		<h2 class="hd">General</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-medium">
				<div class="field-box">
					<label>Header wrapper</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.header.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">BG image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.header.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>Inner wrapper</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.header.innerblock"></rgen-box>
							</li>
							<li>
								<label class="lbl">BG image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.header.innerimage"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
				<rgen-box config="{ fonts:0 }" label="Logo" buttonlabel="Edit" data-ng-model="themeData.logo"></rgen-box>

				<div class="field-box" ng-if="activeTab == 'header.inner'">
					<label>Breadcrumb</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Wrapper</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.breadcrumb.block_wrp"></rgen-box>
							</li>
							<li>
								<label class="lbl">Breadcrumb block</label>
								<rgen-box type="alone" config="{ fonts:0, align: 1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.breadcrumb.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Link normal</label>
								<rgen-colorpicker type="alone" data-ng-model="themeData.breadcrumb.link_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Link hover</label>
								<rgen-colorpicker type="alone" data-ng-model="themeData.breadcrumb.link_hover"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Separator</label>
								<rgen-colorpicker type="alone" data-ng-model="themeData.breadcrumb.sep"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
	<section class="rgen-panel">
		<h2 class="hd">Mobile devices</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-medium">
				<div class="field-box">
					<label>General</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Header</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.mob.header"></rgen-box>
							</li>
							<li>
								<label class="lbl">Logo</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.mob.logo"></rgen-box>
							</li>
							<li>
								<label class="lbl">Cart block</label>
								<rgen-box type="alone" config="{ fonts:0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.mob.cart_block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Search block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.mob.search_block"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="rgen-panel">
		<h2 class="hd">Top links</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-medium">
				<div class="field-box">
					<label>Top links</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.toplink.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">Link normal</label>
								<rgen-box type="alone" config="{ fonts:0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.toplink.link_normal"></rgen-box>
							</li>
							<li>
								<label class="lbl">Link hover</label>
								<rgen-box type="alone" config="{ fonts:0, color:1 }" buttonlabel="Edit" data-ng-model="themeData.toplink.link_hover"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	
	<section class="rgen-panel">
		<h2 class="hd">Top drop downs</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-medium">
				<div class="field-box">
					<label>Drop down</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-button type="alone" config="{ fonts:0, f_size: 1 }" buttonlabel="Edit" data-ng-model="themeData.tdd.dd"></rgen-button>
							</li>
							<li>
								<label class="lbl">Drop down</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.tdd.dd_sub"></rgen-box>
							</li>
							<li>
								<label class="lbl">Item normal</label>
								<rgen-box type="alone" config="{ fonts:0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.tdd.dd_item_normal"></rgen-box>
							</li>
							<li>
								<label class="lbl">Item hover</label>
								<rgen-box type="alone" config="{ fonts:0, color:1 }" buttonlabel="Edit" data-ng-model="themeData.tdd.dd_item_hover"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div ng-include="tpl.minicart"></div>
	<div ng-include="tpl.searchbox"></div>
</div>