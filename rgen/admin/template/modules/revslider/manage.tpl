<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
	<a href="{{revomod_url}}" class="rgen-btn large highlighted btn-tr" style="right: 92px;">Manage sliders</a>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	{{modHd}}
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<!-- Inner layout -->
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Create</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		
		<!--
		Module name
		=========================-->
		<div class="rgen-panel dark" tooltip="Module name">
			<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
		</div>

		<!--
		Common settings
		=========================-->
		<section class="rgen-panel">
			<h2 class="hd">Title</h2>
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<rgen-onoff label="Title status" data-ng-model="modConetnt.common.title_status"></rgen-onoff>
					<rgen-langtext label="Title text" pholder="Enter title" size="w-large" data-ng-model="modConetnt.common.title"></rgen-langtext>
				</div>
			</div>
		</section>

		<section class="rgen-panel">
			<h2 class="hd">Custom HTML</h2>
			<div class="panel-container htmlcontent-panel">
				<div class="rgen-form-wrp form-full form-medium">
				<!-- customhtml_places.jpg -->
					<rgen-radio label="HTML content place" helpimg="imgPath+'customhtml_places.png'" radiofn="htmltypes()" radiodata="htmlplaces" data-ng-model="active_place"></rgen-radio>
					<rgen-radio ng-if="active_place == 'l' || active_place == 'r'" label="Column gutter" fhelp="Gutter value only apply if LEFT or RIGHT content active" radiodata="gutter" size="mini" data-ng-model="modConetnt.common.gt"></rgen-radio>

					<div ng-if="active_place == 't'">
						<h3 class="rgen-hd-1">Top HTML content</h3>
						<rgen-onoff label="Status" data-ng-model="modConetnt.common.top.status"></rgen-onoff>
						<rgen-textarea label="HTML Content" size="w-full h-250 code-input" data-ng-model="modConetnt.common.top.html"></rgen-textarea>
					</div>

					<div ng-if="active_place == 'b'">
						<h3 class="rgen-hd-1">Bottom HTML content</h3>
						<rgen-onoff label="Status" data-ng-model="modConetnt.common.bottom.status"></rgen-onoff>
						<rgen-textarea label="HTML Content" size="w-full h-250 code-input" data-ng-model="modConetnt.common.bottom.html"></rgen-textarea>
					</div>

					<div ng-if="active_place == 'l'">
						<h3 class="rgen-hd-1">Left HTML content</h3>
						<rgen-onoff label="Status" data-ng-model="modConetnt.common.left.status"></rgen-onoff>
						<rgen-radio label="Column size" radiodata="col_sizes" size="mini" data-ng-model="modConetnt.common.left.size"></rgen-radio>
						<rgen-textarea label="HTML Content" size="w-full h-250 code-input" data-ng-model="modConetnt.common.left.html"></rgen-textarea>
						<!-- <rgen-langcontent label="HTML Content" data-ng-model="modConetnt.common.left.html"></rgen-langcontent> -->
					</div>

					<div ng-if="active_place == 'r'">
						<h3 class="rgen-hd-1">Right HTML content</h3>
						<rgen-onoff label="Status" data-ng-model="modConetnt.common.right.status"></rgen-onoff>
						<rgen-radio label="Column size" radiodata="col_sizes" size="mini" data-ng-model="modConetnt.common.right.size"></rgen-radio>
						<rgen-textarea label="HTML Content" size="w-full h-250 code-input" data-ng-model="modConetnt.common.right.html"></rgen-textarea>
					</div>
					
				</div>
			</div>
		</section>

	</div>
</div>
