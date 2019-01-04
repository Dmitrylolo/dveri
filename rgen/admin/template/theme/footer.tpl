<h2 class="main-hd-dark sticky-true">
	Default footer 
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
			
			<div ng-if="modId == 'default_ft_general'" ng-include="tpl.default_ft_general"></div>
			<div ng-if="modId == 'default_ft_contactinfo'" ng-include="tpl.default_ft_contactinfo"></div>
			<div ng-if="modId == 'default_ft_social'" ng-include="tpl.default_ft_social"></div>
			
		</div>
	</div>

</div>
