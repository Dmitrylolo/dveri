<?php include $this->rgen('layout_top'); ?>

<div class="frm-wrp address-book">
	<h2 class="frm-hd"><?php echo $text_address_book; ?></h2>
	<?php if ($addresses) { ?>
	<table class="table">
		<?php foreach ($addresses as $result) { ?>
		<tr>
			<td class="text-left"><?php echo $result['address']; ?></td>
			<td class="text-right"><a href="<?php echo $result['update']; ?>" class="primary-btn btn-xs"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="primary-btn btn-xs"><?php echo $button_delete; ?></a></td>
		</tr>
		<?php } ?>
	</table>
	<?php } else { ?>
	<p><?php echo $text_empty; ?></p>
	<?php } ?>
</div>

<div class="buttons clearfix">
	<div class="pull-left"><a href="<?php echo $back; ?>" class="default-btn"><?php echo $button_back; ?></a></div>
	<div class="pull-right"><a href="<?php echo $add; ?>" class="primary-btn"><?php echo $button_new_address; ?></a></div>
</div>

<?php 
	include $this->rgen('layout_bottom');
	include $this->rgen('msg_success');
	include $this->rgen('msg_error');
	echo $footer;
?>