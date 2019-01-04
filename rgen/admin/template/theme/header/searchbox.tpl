<section class="rgen-panel">
	<h2 class="hd">Search</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-medium">
			<div class="field-box">
				<label>Search block</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Block</label>
							<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.search.block"></rgen-box>
						</li>
						<li>
							<label class="lbl">Block hover</label>
							<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.search.block_h"></rgen-box>
						</li>
						<li>
							<label class="lbl">Input box</label>
							<rgen-box type="alone" config="{ align:1, f_size:1, color:1, h:1 }" buttonlabel="Edit" data-ng-model="themeData.search.input"></rgen-box>
						</li>
						<li>
							<label class="lbl">Button</label>
							<rgen-button type="alone" buttonlabel="Edit" data-ng-model="themeData.search.button"></rgen-button>
						</li>
						<!-- <li>
							<label class="lbl">Icon</label>
							<rgen-box type="alone" config="{ fonts:0, align:0, f_size:1, border:0, bg:0, shadow:0 }" buttonlabel="Edit" data-ng-model="themeData.search.icon"></rgen-box>
						</li> -->
					</ul>
				</div>
			</div>
			
			<h3 class="rgen-hd-1">Auto complete search</h3>
			<div class="field-box">
				<label>Result block</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Wrapper</label>
							<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.search.autosearch.wrp"></rgen-box>
						</li>
						<li>
							<label class="lbl">Product box</label>
							<rgen-button type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.search.autosearch.prd"></rgen-button>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Links</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.links"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.links_h"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>Prices</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Price - normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.normal_price"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Price - hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.normal_price_h"></rgen-colorpicker>
						</li>
					
						<li>
							<label class="lbl">Special - normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.spl_price"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Special - hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.spl_price_h"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>Old prices</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">Old - normal</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.old_price"></rgen-colorpicker>
						</li>
						<li>
							<label class="lbl">Old - hover</label>
							<rgen-colorpicker type="alone" data-ng-model="themeData.search.autosearch.old_price_h"></rgen-colorpicker>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>