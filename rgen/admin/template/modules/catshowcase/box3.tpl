<h3 class="rgen-hd-1">Category showcase box 3</h3>

<rgen-box label="Info wrapper" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.info"></rgen-box>
<div class="field-box">
	<label>Content</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Name</label>
				<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.name"></rgen-box>
			</li>
			<li>
				<label class="lbl">Description</label>
				<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.text"></rgen-box>
			</li>
		</ul>
	</div>
</div>
<div class="field-box">
	<label>Sub category</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Wrapper</label>
				<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.sub_ct"></rgen-box>
			</li>
			<li>
				<label class="lbl">Category items</label>
				<rgen-button type="alone" ng-if="manage_tab == 'd'" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.sub_ct_items"></rgen-button>
				<rgen-button type="alone" ng-if="manage_tab != 'd'" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.sub_ct_items"></rgen-button>
			</li>
		</ul>
	</div>
</div>
<div class="field-box">
	<label>Button block</label>
	<div class="fields">
		<ul class="form-row">
			<li>
				<label class="lbl">Wrapper</label>
				<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.btn_wrp"></rgen-box>
			</li>
			<li>
				<label class="lbl">Button</label>
				<rgen-button type="alone" ng-if="manage_tab == 'd'" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.btn"></rgen-button>
				<rgen-button type="alone" ng-if="manage_tab != 'd'" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.btn"></rgen-button>
			</li>
			<li>
				<label class="lbl">Link</label>
				<rgen-button type="alone" ng-if="manage_tab == 'd'" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.link"></rgen-button>
				<rgen-button type="alone" ng-if="manage_tab != 'd'" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].ct_box3.link"></rgen-button>
			</li>
		</ul>
	</div>
</div>