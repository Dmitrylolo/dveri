<h3 class="mod-hd"><?php echo $heading_title; ?></h3>
<div class="mod-wrp oc-filter">
	<?php foreach ($filter_groups as $filter_group) { ?>
	<div class="filter-group">
		<h5><?php echo $filter_group['name']; ?></h5>
		<ul class="ul-reset" id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
			<?php foreach ($filter_group['filter'] as $filter) { ?>
			<?php if (in_array($filter['filter_id'], $filter_category)) { ?>
			<li><label><input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" /> <?php echo $filter['name']; ?></label></li>
			<?php } else { ?>
			<li><label><input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" /> <?php echo $filter['name']; ?></label></li>
			<?php } ?>
			<?php } ?>
		</ul>
	</div>
	<?php } ?>
	<button type="button" id="button-filter" class="btn default-btn btn-block btn-small"><?php echo $button_filter; ?></button>
</div>

<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];
	
	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
