<rgen-reset resetfn="reset('default_ft_social')" data-ng-model="themeData.status"></rgen-reset>

<section class="rgen-panel">
	<h2 class="hd">Social network</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-button label="Icon block" buttonlabel="Edit" data-ng-model="themeData.icon_blocks"></rgen-button>

			<div class="field-box">
				<label class="v-top">
					Social icons
					<a class="rgen-btn mediumlight small mr10-t" ng-click="addSocial()">Add new</a>
				</label>
				<div class="fields">
					<div ng-repeat="(key, value) in themeData.network" style="border-bottom: 1px solid #f4f4f4; padding-bottom: 5px; margin-bottom:10px;">
						<ul class="form-row mr10-b" style="display: block;">
							<li style="width: 100%; float:none; display:block; ">
								<label class="lbl" style="display:block">URL</label>
								<input type="text" class="form-field inline" style="width: 480px; margin-left: 0" data-ng-model="value.link">
								<a class="rgen-btn highlighted small" ng-click="removeSocial($index)"><i class="fa fa-times"></i></a>
							</li>
						</ul>
						<ul class="form-row mr10-b">
							<li>
								<label class="lbl">Icon</label>
								<rgen-icons type="alone" config="{color:0}" buttonlabel="Edit" data-ng-model="value.icon"></rgen-icons>
							</li>
							<li>
								<label class="lbl">New window</label>
								<rgen-onoff type="alone" data-ng-model="value.win"></rgen-onoff>
							</li>
						</ul>	
					</div>
					
				</div>
			</div>

		</div>
	</div>
</section>