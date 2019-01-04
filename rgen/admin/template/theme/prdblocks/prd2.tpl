<rgen-reset resetfn="reset(2)" data-ng-model="themeData.prd2.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Common settings</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Button icons</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Cart icon</label>
							<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="themeData.prd2.cart_ico"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Wish list icon</label>
							<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="themeData.prd2.wish_ico"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Compare icon</label>
							<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="themeData.prd2.compare_ico"></rgen-icons>
						</li>
						<li>
							<label class="lbl">More icon</label>
							<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="themeData.prd2.more_ico"></rgen-icons>
						</li>
						<li>
							<label class="lbl">Quick view icon</label>
							<rgen-icons type="alone" config="{color:0, type: 'ico', size:0, typebtn: 0}" buttonlabel="Edit" data-ng-model="themeData.prd2.quickview_ico"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="field-box">
				<label>Offer tags</label>
				<div class="fields">
					<div class="rgen-btn-group">
						<label ng-repeat="data in prd_offertag" class="rgen-btn small" ng-model="themeData.prd2.offer_tag" btn-radio="data.val">{{data.label}}</label>
					</div>
				</div>
			</div>
			
			<div ng-if="themeData.prd2.offer_tag == 'img'">
				<h3 class="rgen-hd-1">Offer tag - Image</h3>
				<rgen-bgimage label="Image" fhelp="Status OFF apply default settings" buttonlabel="Edit" data-ng-model="themeData.prd2.offer_img.img"></rgen-bgimage>
				<div class="field-box">
					<label>Tag width x height</label>
					<div class="fields">
						<input type="text" tooltip="Width" class="form-field w-tiny inline" data-ng-model="themeData.prd2.offer_img.tag_w"> x 
						<input type="text" tooltip="Height" class="form-field w-tiny inline" data-ng-model="themeData.prd2.offer_img.tag_h">
						<div class="help-text">Value will apply in PX</div>
					</div>
				</div>
			</div>

			<div ng-if="themeData.prd2.offer_tag == 'dis'">
				<h3 class="rgen-hd-1">Offer tag - Discount value</h3>
				<rgen-box label="Style settings" config="{f_size:1, color:1, align:1, w:1, h:1 }" fhelp="Status OFF apply default settings" buttonlabel="Edit" data-ng-model="themeData.prd2.offer_discount"></rgen-box>
			</div>

			<div ng-if="themeData.prd2.offer_tag == 'txt'">
				<h3 class="rgen-hd-1">Offer tag - Custom text</h3>
				<rgen-box label="Style settings" config="{f_size:1, color:1, align:1, w:1, h:1 }" fhelp="Status OFF apply default settings" buttonlabel="Edit" data-ng-model="themeData.prd2.offer_text.box"></rgen-box>
				<rgen-langtext label="Offer tag text" pholder="Enter name" size="w-medium" data-ng-model="themeData.prd2.offer_text.text"></rgen-langtext>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Other settings</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<!-- <rgen-radio radiodata="prd_types" label="Product box view type" data-ng-model="prd_viewtypes"></rgen-radio> -->
			<div class="field-box">
				<label>Product box view type</label>
				<div class="fields">
					<div class="rgen-btn-group">
						<label ng-repeat="data in prd_types" class="rgen-btn small" ng-model="prd_viewtypes" btn-radio="data.val" ng-click="viewtypes(data.val)">{{data.label}}</label>
					</div>
				</div>
			</div>
			<h3 class="rgen-hd-1">
				Product box - {{prd_viewtypes}} view
				<div class="help-text" ng-if="prd_viewtypes == 'normal'" style="text-transform: none; font-weight: normal;">
					Normal view settings will apply common on all blocks
				</div>
			</h3>
			<div class="field-box">
				<label>Product box buttons</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Cart</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].cart"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Wish list</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].wishlist"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Compare</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].compare"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">More</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].more"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Quick view</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].quickview"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Price & other settings</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Price</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].price"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Tax</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].tax"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Description</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].description"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Rating</label>
							<rgen-onoff type="alone" data-ng-model="themeData.prd2[prd_viewtypes].rating"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
			<rgen-prdbox2 label="Product style customization" config="{type:prd_viewtypes}" buttonlabel="Edit" data-ng-model="themeData.prd2[prd_viewtypes].style"></rgen-prdbox2>

			<div class="field-box">
				<label>Copy settings from</label>
				<div class="fields">
					<a class="rgen-btn small" ng-click="copySettings('prd2', 'normal', prd_viewtypes)" ng-if="prd_viewtypes != 'normal'">Normal</a>
					<a class="rgen-btn small" ng-click="copySettings('prd2', 'grid', prd_viewtypes)" ng-if="prd_viewtypes != 'grid'">Grid view</a>
					<a class="rgen-btn small" ng-click="copySettings('prd2', 'list', prd_viewtypes)" ng-if="prd_viewtypes != 'list'">List view</a>
					<div class="help-text">Copy settings will overwrite previous settings</div>
				</div>
			</div>
			
		</div>
	</div>
</section>