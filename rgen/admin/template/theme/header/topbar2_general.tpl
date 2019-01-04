<section class="rgen-panel">
	<h2 class="hd">Logo</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-radio radiodata="yn" label="Logo inline with menu" data-ng-model="themeData.logo.in_menu"></rgen-radio>
			<rgen-text ng-if="themeData.logo.in_menu == 'y'" fhelp="Value will apply in PX" label="Logo block width" size="w-mini" data-ng-model="themeData.logo.w"></rgen-text>
			<rgen-radio ng-if="themeData.logo.in_menu == 'n'" radiodata="positions" label="Logo position" data-ng-model="themeData.logo.position"></rgen-radio>
		</div>
	</div>
</section>


<section class="rgen-panel">
	<h2 class="hd">Header links</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<div class="field-box">
				<label>Links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Shopping cart</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart_link"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Checkout</label>
							<rgen-onoff type="alone" data-ng-model="themeData.checkout_link"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Wish list</label>
							<rgen-onoff type="alone" data-ng-model="themeData.wishlist"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>My account</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="themeData.myaccount.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="themeData.myaccount.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Header components</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>Mini cart</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="themeData.cart.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Components</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Search box</label>
							<rgen-onoff type="alone" data-ng-model="themeData.search"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Currency</label>
							<rgen-onoff type="alone" data-ng-model="themeData.currency"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Language</label>
							<rgen-onoff type="alone" data-ng-model="themeData.language"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Custom links</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>Custom links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" ng-click="customlinks_status()" data-ng-model="themeData.customlinks"></rgen-onoff>
						</li>
						<li ng-if="themeData.customlinks == true">
							<label class="lbl">Search box</label><br>
							<a class="rgen-btn mini" ng-click="addCustomlink()">Add link</a>
						</li>
					</ul>
				</div>
			</div>

			<div ng-if="themeData.customlinks == true">
				<div ng-repeat="(key, value) in themeData.customlink_data">
					<h3 class="rgen-hd-1">
						Custom link
						<a class="rgen-btn highlighted small remove" ng-click="removeCustomlink($index)"><i class="fa fa-times"></i></a>
					</h3>
					<div class="pos-rel">
						<rgen-langtext label="Link text" size="w-large" data-ng-model="value.text"></rgen-langtext>
						<rgen-text label="URL" size="w-large" data-ng-model="value.link"></rgen-text>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>
