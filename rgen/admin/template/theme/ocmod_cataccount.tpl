<h2 class="main-hd-dark sticky-true">
	OC - Category and My account
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('ocmod_cataccount')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">General</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-box label="Title" config="{f_size:1, color:1, align:1}" buttonlabel="Edit" data-ng-model="themeData.hd"></rgen-box>
				<rgen-box label="List wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.list_wrp"></rgen-box>
				<rgen-button label="List items" buttonlabel="Edit" data-ng-model="themeData.list_item"></rgen-button>
				<rgen-box label="Sublink wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.sublink_wrp"></rgen-box>

				<div class="field-box">
					<label>Sub links</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Normal</label>
								<rgen-colorpicker type="alone" data-ng-model="themeData.sublink_item"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Hover</label>
								<rgen-colorpicker type="alone" data-ng-model="themeData.sublink_item_hover"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Bullet</label>
								<rgen-colorpicker type="alone" data-ng-model="themeData.sublink_bullet"></rgen-colorpicker>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
</div>
