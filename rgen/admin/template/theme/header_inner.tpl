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
			
			<div ng-if="modId == 'topbar1_inner'" ng-include="tpl.topbar1"></div>
			<div ng-if="modId == 'topbar2_inner'" ng-include="tpl.topbar2"></div>
			
		</div>
	</div>
</div>




















<!-- <div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>	
</div>
<section class="rgen-panel">
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			
			<div class="field-box">
				<label>Use same settings as home page header</label>
				<div class="fields">
					<rgen-radio radiodata="yn" type="alone" data-ng-model="topbar.topbar_inner_status" data-ng-click="topbar_inner_status()"></rgen-radio>
				</div>
			</div>

		</div>
	</div>
</section>
<div id="tbar-inner" ng-show="topbar.topbar_inner_status == 'n'">
	<section class="rgen-panel">
		<h2 class="hd">General</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				
				Logo
				<div class="field-box">
					<label>Logo</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Margin</label>
								<rgen-margin type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.logo_margin"></rgen-margin>
							</li>
							<li>
								<label class="lbl">Padding</label>
								<rgen-padding type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.logo_padding"></rgen-padding>
							</li>
						</ul>
					</div>
				</div>

				Background
				<div class="field-box">
					<label>Header background</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Color</label>
								<rgen-colorpicker type="alone" label="Background color" data-ng-model="topbar.topbar_inner.background"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Image</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>

				
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Top links</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-colorpicker label="Background color" data-ng-model="topbar.topbar_inner.top_links.background"></rgen-colorpicker>
				<rgen-border label="Border" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.top_links.border"></rgen-border>

				<div class="field-box">
					<label>Links color</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.link_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.link_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>Links background</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.link_bg_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.link_bg_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>Links border color</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.link_bdr_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.link_bdr_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
				<h3 class="rgen-hd-1">Top links drop down settings</h3>
				<div class="field-box">
					<label>Drop down style</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_link_dd.bg"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-border type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.top_link_dd.border"></rgen-border>
							</li>
							<li>
								<label class="lbl">Shadow</label>
								<rgen-shadow type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.top_link_dd.shadow"></rgen-shadow>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>Drop down text</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_link_dd.link_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_link_dd.link_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>Drop down text background</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_link_dd.linkbg_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_link_dd.linkbg_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

				<h3 class="rgen-hd-1">Custom link color</h3>
				<div class="field-box">
					<label>
						Custom link text
						<div class="help-text">Only apply on <strong>Header 1</strong></div>
					</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.cst_link_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.top_links.cst_link_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Header mini cart</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				
				<div class="field-box">
					<label>Cart style</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Icon</label>
								<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.cart.icon"></rgen-icons>
							</li>
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.text_color"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-border type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.cart.border"></rgen-border>
							</li>
							<li>
								<label class="lbl">Separators</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_sep"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.background"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
				
				<h3 class="rgen-hd-1">Mini cart pop-up settings</h3>
				<div class="field-box">
					<label>Pop-up style</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_bg"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-border type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.cart.popup_border"></rgen-border>
							</li>
							<li>
								<label class="lbl">Shadow</label>
								<rgen-shadow type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.cart.popup_shadow"></rgen-shadow>
							</li>
						</ul>
					</div>
				</div>
				<rgen-colorpicker label="Text color" data-ng-model="topbar.topbar_inner.cart.popup_text"></rgen-colorpicker>
				<div class="field-box">
					<label>Links</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_links"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_links_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="field-box">
					<label>Total section</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_total_bg"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_total_text"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
				
				Cart button
				<rgen-onoff label="Cart button icon" data-ng-model="topbar.topbar_inner.cart.popup_cart_btn_icon"></rgen-onoff>
				<div class="field-box">
					<label>Cart button - Normal</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_cart_btn"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_cart_btn_bg"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>Cart button - Hover</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_cart_btn_hover"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_cart_btn_bg_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

				Checkout button
				<rgen-onoff label="Checkout button icon" data-ng-model="topbar.topbar_inner.cart.popup_checkout_btn_icon"></rgen-onoff>
				<div class="field-box">
					<label>Checkout button - Normal</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_checkout_btn"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_checkout_btn_bg"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>Checkout button - Hover</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_checkout_btn_hover"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.cart.popup_checkout_btn_bg_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Header search box</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">

				<div class="field-box">
					<label>Search box input</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Text</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.text_color"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.bg"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.border"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Shadow</label>
								<rgen-shadow type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.search.shadow"></rgen-shadow>
							</li>
							<li>
								<label class="lbl">Padding</label>
								<rgen-padding type="alone" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.search.padding"></rgen-padding>
							</li>
						</ul>
					</div>
				</div>

				<rgen-padding label="Search box button padding" buttonlabel="Edit" data-ng-model="topbar.topbar_inner.search.btn_padding"></rgen-padding>
				<div class="field-box">
					<label>Search box button - Normal</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Icon</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.btn_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.btnbg_normal"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.btnbdr_normal"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>Search box button - Hover</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Icon</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.btn_hover"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Background</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.btnbg_hover"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Border</label>
								<rgen-colorpicker type="alone" data-ng-model="topbar.topbar_inner.search.btnbdr_hover"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
</div> -->