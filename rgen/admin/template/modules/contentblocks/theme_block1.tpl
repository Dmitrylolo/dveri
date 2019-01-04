<h3 class="rgen-hd-1">Content block 1</h3>
<div class="field-box">
	<label>Outer wrapper</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" config="{fonts:0, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.main.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.main.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Inner wrapper</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" config="{fonts:0, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.inner_wrp.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.inner_wrp.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Image / Icon block</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" config="{fonts:0, align:1, f_size:1, color:1, w:1, h:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.figure.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.figure.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Text wrapper</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" config="{fonts:0, align:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.text_wrp.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.text_wrp.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Title</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" ng-if="manage_tab == 'd'" config="{f_size:1, align:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.name.normal"></rgen-box>
				<rgen-box type="alone" ng-if="manage_tab != 'd'" config="{fonts:0, f_size:1, align:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.name.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.name.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Description text</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" ng-if="manage_tab == 'd'" config="{f_size:1, align:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.text.normal"></rgen-box>
				<rgen-box type="alone" ng-if="manage_tab != 'd'" config="{fonts:0, f_size:1, align:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.text.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.text.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Button wrapper</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Normal</label>
				<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.btn_wrp.normal"></rgen-box>
			</li>
			<li>
				<label class="lbl">Hover</label>
				<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.btn_wrp.hover"></rgen-box>
			</li>
		</ul>
	</div>
</div>

<div class="field-box">
	<label>Button / Link</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Button</label>
				<rgen-button type="alone" ng-if="manage_tab == 'd'" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.btn"></rgen-button>
				<rgen-button type="alone" ng-if="manage_tab != 'd'" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.btn"></rgen-button>
			</li>
			<li>
				<label class="lbl">Link</label>
				<rgen-button type="alone" ng-if="manage_tab == 'd'" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.link"></rgen-button>
				<rgen-button type="alone" ng-if="manage_tab != 'd'" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ctn_block1.setting.link"></rgen-button>
			</li>
		</ul>
	</div>
</div>