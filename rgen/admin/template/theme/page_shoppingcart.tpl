<h2 class="main-hd-dark sticky-true">
	Shopping cart page
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('shoppingcart')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>

	<section class="rgen-panel">
		<h2 class="hd">General</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-box label="Cart title" config="{color:1, f_size:1, align:1 }" buttonlabel="Edit" data-ng-model="themeData.cart_title"></rgen-box>
				<rgen-box label="Other title" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.other_title"></rgen-box>
				<rgen-box label="Quantity" config="{color:1, f_size:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.qty"></rgen-box>
				<rgen-box label="Cart total block" config="{fonts:1, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.total_block"></rgen-box>
				<rgen-box label="Cart total summary" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.total_summary"></rgen-box>
				<rgen-box label="Cart total" config="{color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.total"></rgen-box>
			</div>
		</div>
	</section>
</div>
