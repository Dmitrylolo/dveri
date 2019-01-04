<h2 class="main-hd-dark sticky-true">
	OC - Featured
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('ocmod_slideshow')" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">Slide show settings</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full form-medium">
				<div class="field-box">
					<label>Settings</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Speed</label><br>
								<input type="text" class="form-field w-tiny inline" data-ng-model="themeData.speed">
							</li>
							<li>
								<label class="lbl">Interval</label><br>
								<input type="text" class="form-field w-tiny inline" data-ng-model="themeData.interval">
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>Settings</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Auto play</label><br>
								<rgen-onoff type="alone" data-ng-model="themeData.autoplay"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Stop on hover</label><br>
								<rgen-onoff type="alone" data-ng-model="themeData.autoplay_hover"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Loop</label><br>
								<rgen-onoff type="alone" data-ng-model="themeData.loop"></rgen-onoff>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>Animation effect</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">In</label>
								<rgen-select type="alone" selectdata="effect" data-ng-model="themeData.animateIn"></rgen-select>
							</li>
							<li>
								<label class="lbl">Out</label>
								<rgen-select type="alone" selectdata="effect" data-ng-model="themeData.animateOut"></rgen-select>
							</li>
						</ul>
					</div>
				</div>
				
				<h3 class="rgen-hd-1">Slide show navigation</h3>
				<div class="field-box">
					<label>Arrow and dots</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Arrow display</label><br>
								<rgen-onoff type="alone" data-ng-model="themeData.arrow"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Dots display</label><br>
								<rgen-onoff type="alone" data-ng-model="themeData.dots"></rgen-onoff>
							</li>
						</ul>
					</div>
				</div>
				<rgen-radio label="Dots display style" helpimg="imgPath+'dots.jpg'" radiodata="dot_style" data-ng-model="themeData.dot_style"></rgen-radio>

				<h3 class="rgen-hd-1">Style customization</h3>
				<rgen-box label="Slide show wrapper" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData.wrapper"></rgen-box>
				<div class="field-box">
					<label>Dots</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Line</label><br>
								<rgen-colorpicker type="alone" data-ng-model="themeData.dot_line"></rgen-colorpicker>
							</li>
							<li>
								<label class="lbl">Normal</label>
								<rgen-box type="alone" config="{fonts:0, w:1, h:1, padding:0}" buttonlabel="Edit" data-ng-model="themeData.dot_normal"></rgen-box>
							</li>
							<li>
								<label class="lbl">Active</label>
								<rgen-box type="alone" config="{fonts:0, padding:0, margin:0}" buttonlabel="Edit" data-ng-model="themeData.dot_active"></rgen-box>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</section>

</div>
