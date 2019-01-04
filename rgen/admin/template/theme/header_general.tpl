<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>	
</div>
<div>
	<div class="rgen-row gut-10">
		
		<div class="rgen-col-3">
			<section class="rgen-panel">
				<ul class="list">
					<li ng-repeat="mod in modList" ng-class="{'active' : mod.val == modId}"><a ng-click="getkey(mod.val)">{{mod.name}}</a><i class="fa fa-caret-right crt"></i></li>
				</ul>
			</section>
		</div>

		<div class="rgen-col-9">
			
			<div ng-if="modId == 'topbar_common'" ng-include="tpl.topbar_common"></div>
			<div ng-if="modId == 'topbar1_general'" ng-include="tpl.topbar1_general"></div>
			<div ng-if="modId == 'topbar2_general'" ng-include="tpl.topbar2_general"></div>
			
		</div>
	</div>
</div>

















<!-- <div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="saveGeneral()" type="submit">Save</button>	
</div>

<rgen-reset resetfn="reset('topbar_general')" frmsize="resetsize" config="0" label="Reset data"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">General settings</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<div class="field-box">
				<label>Topbar styles</label>
				<div class="fields">
					<div class="rgen-btn-group">
						<label ng-repeat="data in topbar_styles" class="rgen-btn small" ng-model="topbar_general.style" btn-radio="data.val" ng-click="topbar_preview(data.val)">{{data.label}}</label>
					</div>
				</div>
			</div>
			<rgen-radio radiodata="topbar_styles" label="Topbar styles" data-ng-model="topbar_general.style" data-ng-click="topbar_preview()"></rgen-radio>
			<div class="mr10 preview-block"><img ng-src="{{preview}}" /></div>
			<rgen-radio radiodata="topbar_width" label="Topbar layout" data-ng-model="topbar_general.layout"></rgen-radio>
			
			Cart link
			<div class="field-box">
				<label>Shopping cart link</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="topbar_general.cart_link.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="topbar_general.cart_link.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

			Check out link
			<div class="field-box">
				<label>Checkout link</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="topbar_general.checkout_link.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="topbar_general.checkout_link.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

			Wish list
			<div class="field-box">
				<label>Wish list</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="topbar_general.wishlist.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="topbar_general.wishlist.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

			My account
			<div class="field-box">
				<label>My account</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="topbar_general.myaccount.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="topbar_general.myaccount.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>
			
			Cart
			<div class="field-box">
				<label>Cart</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Status</label>
							<rgen-onoff type="alone" data-ng-model="topbar_general.cart.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="topbar_general.cart.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

			Other options
			<div class="field-box">
				<label>Other options</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Search box</label>
							<rgen-onoff type="alone" label="Search box" data-ng-model="topbar_general.search"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Currency</label>
							<rgen-onoff type="alone" label="Currency" data-ng-model="topbar_general.currency"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Language</label>
							<rgen-onoff type="alone" label="Language" data-ng-model="topbar_general.language"></rgen-onoff>
						</li>
						<li ng-click="customlinks_status();">
							<label class="lbl">Custom links</label>
							<rgen-onoff type="alone" label="Language" data-ng-model="topbar_general.customlinks"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel" ng-if="topbar_general.customlinks == true">
	<h2 class="hd">Custom links</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">

			<div class="field-box">
				<label>Custom links</label>
				<div class="fields">
					<a class="rgen-btn mediumlight small" ng-click="addCustomlink()">Add</a>
				</div>
			</div>
			
			<div ng-repeat="(key, value) in topbar_general.customlink_data">
				<h3 class="rgen-hd-1">
					Custom link
					<a class="rgen-btn highlighted small remove" ng-click="removeCustomlink($index)"><i class="fa fa-times"></i></a>
				</h3>
				<div class="pos-rel">
					<rgen-langtext label="Link text" size="w-large" data-ng-model="value.text"></rgen-langtext>
					<div class="field-box">
						<label>Icon and URL</label>
						<div class="fields">
							<ul class="form-row mr10-b" >
								<li>
									<label class="lbl">Icon</label>
									<rgen-icons type="alone" config="{color:0, size:0, type:'ico', typebtn: 0}" buttonlabel="Edit" data-ng-model="value.icon"></rgen-icons>
								</li>
								<li>
									<label class="lbl" style="display:block">Name and URL</label>
									<input type="text" class="form-field inline" style="width: 390px; margin-left: 0" data-ng-model="value.link">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section> -->