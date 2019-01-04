<?php include $this->rgen('layout_top'); ?>
<?php if ($returns) { ?>
<table class="table table-bordered">
	<thead>
		<tr>
			<td class="text-right"><?php echo $column_return_id; ?></td>
			<td class="text-left"><?php echo $column_status; ?></td>
			<td class="text-left"><?php echo $column_date_added; ?></td>
			<td class="text-right"><?php echo $column_order_id; ?></td>
			<td class="text-left"><?php echo $column_customer; ?></td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($returns as $return) { ?>
		<tr>
			<td class="text-right">#<?php echo $return['return_id']; ?></td>
			<td class="text-left"><?php echo $return['status']; ?></td>
			<td class="text-left"><?php echo $return['date_added']; ?></td>
			<td class="text-right"><?php echo $return['order_id']; ?></td>
			<td class="text-left"><?php echo $return['name']; ?></td>
			<td><a href="<?php echo $return['href']; ?>" title="<?php echo $button_view; ?>" class="btn-xs primary-btn"><?php echo $button_view; ?></a></td>
		</tr>
		<?php } ?>
	</tbody>
</table>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<?php } ?>
<div class="buttons clearfix">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>

<?php 
	include $this->rgen('layout_bottom');
	echo $footer;
?>