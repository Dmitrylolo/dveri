<?php include $this->rgen('layout_top'); ?>

<p><?php echo $text_total; ?> <b><?php echo $total; ?></b>.</p>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td class="text-left"><?php echo $column_date_added; ?></td>
				<td class="text-left"><?php echo $column_description; ?></td>
				<td class="text-right"><?php echo $column_amount; ?></td>
			</tr>
		</thead>
		<tbody>
			<?php if ($transactions) { ?>
			<?php foreach ($transactions	as $transaction) { ?>
			<tr>
				<td class="text-left"><?php echo $transaction['date_added']; ?></td>
				<td class="text-left"><?php echo $transaction['description']; ?></td>
				<td class="text-right"><?php echo $transaction['amount']; ?></td>
			</tr>
			<?php } ?>
			<?php } else { ?>
			<tr>
				<td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div>
<div class="row">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<br><br>
<div class="buttons clearfix">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>

<?php 
	include $this->rgen('layout_bottom');
	echo $footer;
?>