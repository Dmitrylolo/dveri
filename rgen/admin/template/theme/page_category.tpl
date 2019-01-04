<h2 class="main-hd-dark sticky-true">
	Category page
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('category')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">General</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>Category info</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">status</label>
								<rgen-onoff type="alone" label="Responsive status" data-ng-model="themeData.cat_info.status"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.cat_info.block"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Refine search</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				
				<rgen-radio label="Styles" helpimg="imgPath+'refine_search.jpg'" radiodata="refine_styles" size="small" data-ng-model="themeData.refine_search.style"></rgen-radio>
				<rgen-radio label="Refine cateogy view" radiodata="refineview_styles" size="small" data-ng-model="themeData.refine_search.view"></rgen-radio>
				
				<div ng-if="themeData.refine_search.style == 1">
					<h3 class="rgen-hd-1">Refine search style 1</h3>
					<div class="field-box">
						<label>Refine search settings</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Block</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine1.block"></rgen-box>
								</li>
								<li>
									<label class="lbl">Title</label>
									<rgen-box type="alone" config="{ align:1, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine1.title"></rgen-box>
								</li>
							</ul>
						</div>
					</div>
					<div class="field-box">
						<label>Category links</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Normal</label>
									<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine1.catlink_normal"></rgen-box>
								</li>
								<li>
									<label class="lbl">Hover</label>
									<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine1.catlink_hover"></rgen-box>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div ng-if="themeData.refine_search.style == 2">
					<h3 class="rgen-hd-1">Refine search style 2</h3>
					<div class="field-box">
						<label>Refine search settings</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Block</label>
									<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine2.block"></rgen-box>
								</li>
								<li>
									<label class="lbl">Title</label>
									<rgen-box type="alone" config="{ align:1, color:1, f_size:1 }" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine2.title"></rgen-box>
								</li>
							</ul>
						</div>
					</div>
					<div class="field-box">
						<label>Category links</label>
						<div class="fields">
							<ul class="form-row">
								<li>
									<label class="lbl">Normal</label>
									<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine2.catlink_normal"></rgen-box>
								</li>
								<li>
									<label class="lbl">Hover</label>
									<rgen-box type="alone" config="{fonts:0, color:1, f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.refine_search.refine2.catlink_hover"></rgen-box>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	
	<!-- <section class="rgen-panel">
		<h2 class="hd">Products</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label class="tip">
						Product settings <a href="{{imgPath+'prdblocks.jpg'}}" class="help-tip mg-pop"><i class="fa fa-question-circle"></i></a>
					</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Product box style</label>
								<div class="rgen-btn-group">
									<label ng-repeat="data in prdblock_styles" class="rgen-btn small" ng-model="themeData.prd_grid.prd_style" btn-radio="data.val">{{data.label}}</label>
								</div>
							</li>
							<li>
								<label class="lbl">Grid view</label>
								<rgen-grids type="alone" buttonlabel="Edit" size="mini" data-ng-model="themeData.prd_grid.gridview"></rgen-grids>
							</li>
							<li>
								<label class="lbl">List view</label>
								<rgen-grids type="alone" buttonlabel="Edit" size="mini" data-ng-model="themeData.prd_grid.listview"></rgen-grids>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section> -->

</div>
