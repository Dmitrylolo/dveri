<?php include $this->rgen('layout_top'); ?>

<?php if ($orders) { ?>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td class="text-right"><?php echo $column_order_id; ?></td>
				<td class="text-left"><?php echo $column_status; ?></td>
				<td class="text-left"><?php echo $column_date_added; ?></td>
				<td class="text-right"><?php echo $column_product; ?></td>
				<td class="text-left"><?php echo $column_customer; ?></td>
				<td class="text-right"><?php echo $column_total; ?></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($orders as $order) { ?>
			<tr>
				<td class="text-right">#<?php echo $order['order_id']; ?></td>
				<td class="text-left"><?php echo $order['status']; ?></td>
				<td class="text-left"><?php echo $order['date_added']; ?></td>
				<td class="text-right"><?php echo $order['products']; ?></td>
				<td class="text-left"><?php echo $order['name']; ?></td>
				<td class="text-right"><?php echo $order['total']; ?></td>
				<td class="text-right"><a href="<?php echo $order['href']; ?>" title="<?php echo $button_view; ?>" class="btn-xs primary-btn"><?php echo $button_view; ?></a></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div>
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