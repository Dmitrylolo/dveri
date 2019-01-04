<!--
Common settings
=========================-->
<section class="rgen-panel">
	<h2 class="hd">Common title</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-onoff label="Title status" data-ng-model="modConetnt.common.title_status"></rgen-onoff>
			<rgen-langtext label="Title text" pholder="Enter title" size="w-large" data-ng-model="modConetnt.common.title"></rgen-langtext>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">Common custom HTML</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-radio label="HTML content place" radiodata="htmlplaces" data-ng-model="active_place"></rgen-radio>
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