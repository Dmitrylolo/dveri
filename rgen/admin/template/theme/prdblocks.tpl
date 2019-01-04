<h2 class="main-hd-dark sticky-true">
	Global product block settings
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<div class="rgen-row gut-10">
		
		<div class="rgen-col-3">
			<section class="rgen-panel">
				<ul class="list">
					<li ng-repeat="mod in modList" ng-class="{'active' : mod.val == modId}"><a ng-click="getkey(mod.val)">{{mod.name}}</a><i class="fa fa-caret-right crt"></i></li>
				</ul>
			</section>
		</div>

		<div class="rgen-col-9">
			
			<div ng-if="modId == 'global_prdblocks'" ng-include="tpl.global_prdblocks"></div>
			<div ng-if="modId == 'global_smallprdblocks'" ng-include="tpl.global_smallprdblocks"></div>
			<div ng-if="modId == 'global_prdgirdpages'" ng-include="tpl.global_prdgirdpages"></div>
			<div ng-if="modId == 'global_quickview'" ng-include="tpl.global_quickview"></div>
			
		</div>
	</div>

</div>
