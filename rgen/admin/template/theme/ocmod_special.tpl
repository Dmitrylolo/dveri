<h2 class="main-hd-dark sticky-true">
	OC - Special offer
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('ocmod_special')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">General</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-radio label="Product view" radiodata="prdblock_view" buttonlabel="Edit" size="mini" data-ng-model="themeData.prd_view"></rgen-radio>
				
				<div ng-if="themeData.prd_view == 'grid'">
					<h3 class="rgen-hd-1">Grid settings</h3>
					<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="themeData.grids"></rgen-grids>	
				</div>

				<div ng-if="themeData.prd_view == 'carousel'">
					<h3 class="rgen-hd-1">Carousel settings</h3>
					<rgen-radio label="Display product in row" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="themeData.carousel.item_display"></rgen-radio>
					<rgen-radio label="Space between products" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="themeData.carousel.item_margin"></rgen-radio>
				</div>
				
				<h3 class="rgen-hd-1">Module CSS customization</h3>
				<div class="field-box">
					<label>Module style</label>
					<div class="fields">
						<ul class="form-row">
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
								<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.prd_wrp"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Product box</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-radio label="Product box style" helpimg="imgPath+'prdblocks.jpg'" radiodata="prdblock_styles" buttonlabel="Edit" size="mini" data-ng-model="themeData.prd_style"></rgen-radio>
				<div ng-if="themeData.prd_style == 1">
					<rgen-prdbox1 label="Product box 1 style customization" buttonlabel="Edit" data-ng-model="themeData.prd1_css"></rgen-prdbox1>
				</div>
				<div ng-if="themeData.prd_style == 2">
					<rgen-prdbox2 label="Product box 2 style customization" buttonlabel="Edit" data-ng-model="themeData.prd2_css"></rgen-prdbox2>
				</div>

				<rgen-radio label="Column product box style" helpimg="imgPath+'smallprdblocks.jpg'" radiodata="prdblock_styles" buttonlabel="Edit" size="mini" data-ng-model="themeData.col_prd_style"></rgen-radio>

				<div ng-if="themeData.col_prd_style == 1">
					<rgen-smallprdbox1 label="Small product box 1 style customization" buttonlabel="Edit" data-ng-model="themeData.smallprd1_css"></rgen-smallprdbox1>
				</div>
				<div ng-if="themeData.col_prd_style == 2">
					<rgen-smallprdbox2 label="Small product box 2 style customization" buttonlabel="Edit" data-ng-model="themeData.smallprd2_css"></rgen-smallprdbox2>
				</div>
			</div>
		</div>
	</section>

</div>
