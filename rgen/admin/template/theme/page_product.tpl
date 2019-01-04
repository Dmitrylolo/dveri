<h2 class="main-hd-dark sticky-true">
	Product page
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
			
			<div ng-if="modId == 'prdpg_general'" ng-include="tpl.prdpg_general"></div>
			<div ng-if="modId == 'prdpg_main_img'" ng-include="tpl.prdpg_main_img"></div>
			<div ng-if="modId == 'prdpg_tabs'" ng-include="tpl.prdpg_tabs"></div>
			<div ng-if="modId == 'prdpg_options'" ng-include="tpl.prdpg_options"></div>
			<div ng-if="modId == 'prdpg_qty'" ng-include="tpl.prdpg_qty"></div>
			<div ng-if="modId == 'prdpg_ly1'" ng-include="tpl.prdpg_ly1"></div>
			<div ng-if="modId == 'prdpg_ly2'" ng-include="tpl.prdpg_ly2"></div>
			<div ng-if="modId == 'prdpg_ly3'" ng-include="tpl.prdpg_ly3"></div>
			
		</div>
	</div>

</div>
