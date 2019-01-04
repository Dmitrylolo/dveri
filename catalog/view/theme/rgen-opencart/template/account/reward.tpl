<?php include $this->rgen('layout_top'); ?>
<p><?php echo $text_total; ?> <b><?php echo $total; ?></b>.</p>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td class="text-left"><?php echo $column_date_added; ?></td>
				<td class="text-left"><?php echo $column_description; ?></td>
				<td class="text-right"><?php echo $column_points; ?></td>
			</tr>
		</thead>
		<tbody>
			<?php if ($rewards) { ?>
			<?php foreach ($rewards	as $reward) { ?>
			<tr>
				<td class="text-left"><?php echo $reward['date_added']; ?></td>
				<td class="text-left"><?php if ($reward['order_id']) { ?>
				<a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
				<?php } else { ?>
				<?php echo $reward['description']; ?>
				<?php } ?></td>
				<td class="text-right"><?php echo $reward['points']; ?></td>
			</tr>
			<?php } ?>
			<?php } else { ?>
			<tr>
				<td class="text-center" colspan="3"><?php echo $text_empty; ?></td>
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