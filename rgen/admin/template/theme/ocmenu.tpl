<h2 class="main-hd-dark sticky-true">
	OC - Default menu
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('ocmenu')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">General settings</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-box label="Main wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.menu_wrp"></rgen-box>
				<rgen-box label="Inner wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.container"></rgen-box>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Menu items</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-button label="Main items" buttonlabel="Edit" data-ng-model="themeData.mainitem"></rgen-button>
				<rgen-button label="Sub items" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.subitem"></rgen-button>
				<rgen-box label="Sub wrapper" config="{fonts:0, align:1}" buttonlabel="Edit" data-ng-model="themeData.subwrp"></rgen-box>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">Mobile menu</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<rgen-box label="Menu handle" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_handle"></rgen-box>
				<rgen-box label="Sub handle" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_subhandle"></rgen-box>
				<rgen-box label="Menu wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.m_nav"></rgen-box>
				<rgen-box label="Sub menu wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.m_subwrp"></rgen-box>
				<rgen-box label="Menu items" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_mainitem"></rgen-box>
				<rgen-box label="Sub items" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_subitem"></rgen-box>
				<rgen-box label="See all" config="{fonts:0, color:1, f_size:1}" buttonlabel="Edit" data-ng-model="themeData.m_seeall"></rgen-box>
			</div>
		</div>
	</section>

</div>
