<h2 class="main-hd-dark sticky-true">
	Backup / Restore
	<!-- <button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button> -->
</h2>
<div class="pd20">
	<div class="rgen-btn-group tab-group mr10-b">
		<label ng-repeat="data in manage_tabs" class="rgen-btn" ng-model="manage_tab" btn-radio="data.val" ng-click="tabtype(data.val)">{{data.label}}</label>
	</div>

	<div ng-if="manage_tab == 'backup'">
		<section class="rgen-panel">
			<h2 class="hd">Backup</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">
					<rgen-text label="Backup name" size="w-large" data-ng-model="backupData.name"></rgen-text>
					
					<h3 class="rgen-hd-1">Theme settings</h3>
					<rgen-onoff label="Full theme settings" data-ng-model="backupData.rgen_theme"></rgen-onoff>
					
					<h3 class="rgen-hd-1">Modules</h3>
					<div class="field-box">
						<label>Select modules from list to take backup</label>
						<div class="fields">
							<ul class="field-list">
								<li ng-repeat="mod in modlist">
									<label for="mod-{{mod.code}}">
										<input type="checkbox" id="mod-{{mod.code}}" checked="checked" data-ng-model="backupData.modlist[mod.code]">
										<i class="fa fa-times"></i>
										<i class="fa fa-check"></i>
										{{mod.name}}
									</label>
								</li>
							</ul>
							<br>
							<div class="help-text">
							<strong>NOTE:</strong> <br>
							<strong>"Revo slider"</strong> module backup process only include <strong>R.Gen theme Revo slider settings</strong>, Backup dose not include <strong>"Rev Slider Opencart"</strong> module data. <strong>Export/Import slider data from "Rev Slider Opencart" module itself.</strong></div>
						</div>
					</div>

				</div>
			</div>
		</section>
		<section class="rgen-panel pd20" ng-if="permission">
			<button class="rgen-btn large mediumlight" ng-click="backup()" type="submit">Backup now</button>
		</section>
	</div>

	<div ng-if="manage_tab == 'restore'">
		<section class="rgen-panel">
			<h2 class="hd">Restore</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-small">
					<rgen-select selectdata="backuplistData" size="w-large" label="Backup list" data-ng-model="selected_backup"></rgen-select>
					
					<h3 class="rgen-hd-1">Theme settings</h3>
					<rgen-onoff label="Full theme settings" data-ng-model="restoreData.rgen_theme"></rgen-onoff>
					
					<h3 class="rgen-hd-1">Modules</h3>
					<div class="field-box">
						<label>Select modules from list to restore</label>
						<div class="fields">
							<ul class="field-list">
								<li ng-repeat="mod in modlist">
									<label for="restore-mod-{{mod.code}}">
										<input type="checkbox" id="restore-mod-{{mod.code}}" checked="checked" data-ng-model="restoreData.modlist[mod.code]">
										<i class="fa fa-times"></i>
										<i class="fa fa-check"></i>
										{{mod.name}}
									</label>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</section>
		<section class="rgen-panel pd20" ng-if="permission">
			<button class="rgen-btn large mediumlight" ng-click="restore(selected_backup)" type="submit">Restore now</button>
			<button class="rgen-btn large" ng-click="remove(selected_backup)" type="submit">Remove</button>
		</section>
	</div>

</div>
