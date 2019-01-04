<h2 class="main-hd-dark sticky-true">
	Other pages
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
			
			<div ng-if="modId == 'contactus'" ng-include="tpl.contactus"></div>
			<div ng-if="modId == 'brands'" ng-include="tpl.brands"></div>
			<div ng-if="modId == 'sitemap'" ng-include="tpl.sitemap"></div>
			<div ng-if="modId == 'login'" ng-include="tpl.login"></div>
			<div ng-if="modId == 'buttons'" ng-include="tpl.buttons"></div>
			
		</div>
	</div>

</div>
