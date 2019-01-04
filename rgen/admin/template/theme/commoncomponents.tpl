<h2 class="main-hd-dark sticky-true">
	Common components
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
			
			<div ng-if="modId == 'global'" ng-include="tpl.global"></div>
			<div ng-if="modId == 'table_style'" ng-include="tpl.table_style"></div>
			<div ng-if="modId == 'pg_heading'" ng-include="tpl.pg_heading"></div>
			<div ng-if="modId == 'headings'" ng-include="tpl.headings"></div>
			<div ng-if="modId == 'buttons'" ng-include="tpl.buttons"></div>
			<div ng-if="modId == 'prd_filters'" ng-include="tpl.prd_filters"></div>
			<div ng-if="modId == 'forms'" ng-include="tpl.forms"></div>
			<div ng-if="modId == 'popup'" ng-include="tpl.popup"></div>
			<div ng-if="modId == 'panel'" ng-include="tpl.panel"></div>
			
		</div>
	</div>

</div>
