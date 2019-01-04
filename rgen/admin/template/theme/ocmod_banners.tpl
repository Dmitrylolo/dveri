<h2 class="main-hd-dark sticky-true">
	OC - Banners
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('ocmod_banners')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">Content area view</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-radio label="Banners view in content area" radiodata="banner_view" buttonlabel="Edit" size="mini" data-ng-model="themeData.contentarea_view"></rgen-radio>
				
				<div ng-if="themeData.contentarea_view == 'grid'">
					<h3 class="rgen-hd-1">Grid settings</h3>
					<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="themeData.grids"></rgen-grids>	
				</div>

				<div ng-if="themeData.contentarea_view == 'carousel'">
					<h3 class="rgen-hd-1">Carousel settings</h3>
					<rgen-radio label="Display banner in row" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="themeData.carousel.item_display"></rgen-radio>
					<rgen-radio label="Space between banners" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="themeData.carousel.item_margin"></rgen-radio>
				</div>

			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Column area view</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-radio label="Banners view in column area" radiodata="banner_view" buttonlabel="Edit" size="mini" data-ng-model="themeData.column_view"></rgen-radio>
				
				<div ng-if="themeData.column_view == 'grid'">
					<h3 class="rgen-hd-1">Grid settings</h3>
					<rgen-grids label="Grid settings" buttonlabel="Edit" size="mini" data-ng-model="themeData.column_grids"></rgen-grids>	
				</div>

				<div ng-if="themeData.column_view == 'carousel'">
					<h3 class="rgen-hd-1">Carousel settings</h3>
					<rgen-radio label="Display banner in row" radiodata="item_range" buttonlabel="Edit" size="mini" data-ng-model="themeData.column_carousel.item_display"></rgen-radio>
					<rgen-radio label="Space between banners" radiodata="item_margin" buttonlabel="Edit" size="mini" data-ng-model="themeData.column_carousel.item_margin"></rgen-radio>
				</div>

			</div>
		</div>
	</section>
</div>
