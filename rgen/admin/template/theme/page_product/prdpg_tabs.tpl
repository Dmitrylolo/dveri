<rgen-reset resetfn="reset('prdpg_tabs')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Tabs</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			
			<div class="field-box">
				<label>Tabs bar</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" label="Tab item bar" config="{fonts:0, align:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.bar"></rgen-box>
						</li>
						<li>
							<label class="lbl">Item wrapper</label>
							<rgen-box type="alone" label="Tab items" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.item_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active wrapper</label>
							<rgen-box type="alone" label="Tab active" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.active_wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Items</label>
							<rgen-box type="alone" label="Tab items" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.item"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active</label>
							<rgen-box type="alone" label="Tab active" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.active"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Tab content</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Container</label>
							<rgen-box type="alone" label="Tab container" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.container"></rgen-box>
						</li>
						<li>
							<label class="lbl">Tab pane</label>
							<rgen-box type="alone" label="Tab pane" config="{fonts:0, align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData.tabs.pane"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Specification table style</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Table</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Background</label>
							<rgen-colorpicker type="alone" label="Backgroud color" data-ng-model="themeData.table_style.table.background"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Border</label>
							<rgen-border type="alone" buttonlabel="Edit" label="Border settings" data-ng-model="themeData.table_style.table.border"></rgen-border>
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Table header (TH)</h3>
			<div class="field-box">
				<label>Table head</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">TH</label>
							<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.table_style.th.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">First TH</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.th.first"></rgen-box>
						</li>
						<li>
							<label class="lbl">Last TH</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.th.last"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Table body (TD)</h3>
			<div class="field-box">
				<label>Table body</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">TD</label>
							<rgen-box type="alone" config="{ fonts: 0, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.table_style.td.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">First TD</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.td.first"></rgen-box>
						</li>
						<li>
							<label class="lbl">Last TD</label>
							<rgen-box type="alone" config="{ fonts: 0, padding:0, margin: 0, shadow: 0 }" buttonlabel="Edit" data-ng-model="themeData.table_style.td.last"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Review tab</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<rgen-box config="{fonts:0}" label="Review block" buttonlabel="Edit" data-ng-model="themeData.review_tab.block"></rgen-box>

			<h3 class="rgen-hd-1">Comment box</h3>
			<div class="field-box">
				<label>Comment box</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box config="{fonts:0, color:1, f_size:1}" type="alone" buttonlabel="Edit" data-ng-model="themeData.review_tab.comment.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Name</label>
							<rgen-box config="{fonts:0, color:1, f_size:1}" type="alone" buttonlabel="Edit" data-ng-model="themeData.review_tab.comment.title"></rgen-box>
						</li>
						<li>
							<label class="lbl">Stars active</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.review_tab.comment.stars_active"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Stars normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.review_tab.comment.stars_normal"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Comment text</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.comment.comment"></rgen-box>
						</li>
						
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Pagination</h3>
			<div class="field-box">
				<label class="tip">Pagination settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.pagination.wrapper"></rgen-box>
						</li>
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.pagination.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Active</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.pagination.active"></rgen-box>
						</li>
						<li>
							<label class="lbl">Normal</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.pagination.normal"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

			<h3 class="rgen-hd-1">Review form</h3>
			<div class="field-box">
				<label class="tip">Form</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Title</label>
							<rgen-box type="alone" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.hd"></rgen-box>
						</li>
						<li>
							<label class="lbl">Labels</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.review_tab.frm.label"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Fields</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.fields"></rgen-box>
						</li>
						<li>
							<label class="lbl">Button</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.btn"></rgen-button>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label class="tip">Rating</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.rating"></rgen-box>
						</li>
						<li>
							<label class="lbl">Labels</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.rating_lbl"></rgen-box>
						</li>
						<li>
							<label class="lbl">Rating count</label>
							<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.review_tab.frm.rating_count"></rgen-box>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>