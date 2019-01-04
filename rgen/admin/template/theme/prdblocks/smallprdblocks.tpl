<rgen-reset resetfn="reset('global_smallprdblocks')" frmsize="resetsize" config="0" label="Reset data"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Small product block 1</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<rgen-smallprdbox1 helpimg="imgPath+'smallprdblocks.jpg'" label="Product style customization" buttonlabel="Edit" data-ng-model="themeData.smallprd1"></rgen-smallprdbox1>
			<div class="field-box">
				<label>Reset settings</label>
				<div class="fields">
					<a class="rgen-btn highlighted mini" ng-click="reset('smallprd1')">Reset settings</a>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Small product block 2</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full">
			<rgen-smallprdbox2 helpimg="imgPath+'smallprdblocks.jpg'" label="Product style customization" buttonlabel="Edit" data-ng-model="themeData.smallprd2"></rgen-smallprdbox2>
			<div class="field-box">
				<label>Reset settings</label>
				<div class="fields">
					<a class="rgen-btn highlighted mini" ng-click="reset('smallprd2')">Reset settings</a>
				</div>
			</div>
		</div>
	</div>
</section>