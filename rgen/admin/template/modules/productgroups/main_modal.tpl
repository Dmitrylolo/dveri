<div class="rgen-model">
	<div class="modal-header">
		<h3 class="modal-title">Item manager</h3>
	</div>
	<div class="modal-body">
		<div class="help-text mr5-b h-c">Changing group will reset existing data</div>
		<div class="rgen-btn-group tab-group mr10-b h-c">
			<rgen-radio type="alone" fhelp="Changing item will reset existing data" radiofn="tabtype(manage_tab)" radiodata="manage_tabs" data-ng-model="manage_tab"></rgen-radio>
			<!-- <label ng-repeat="data in manage_tabs" class="rgen-btn" ng-model="manage_tab" btn-radio="data.val" ng-click="tabtype(data.val)">{{data.label}}</label> -->
		</div>
		<div ng-if="manage_tab == 'special'" ng-include="tpl.special"></div>
		<div ng-if="manage_tab == 'latest'" ng-include="tpl.latest"></div>
		<div ng-if="manage_tab == 'best'" ng-include="tpl.best"></div>
		<div ng-if="manage_tab == 'category'" ng-include="tpl.category"></div>
		<div ng-if="manage_tab == 'brand'" ng-include="tpl.brand"></div>
		<div ng-if="manage_tab == 'custom'" ng-include="tpl.custom"></div>
	</div>
	<div class="modal-footer">
		<button class="rgen-btn mediumlight" ng-click="apply(modaldata, modaldata.node_type, 'setting')">Apply</button>
		<button class="rgen-btn" ng-click="cancel()">Cancel</button>
	</div>
</div>