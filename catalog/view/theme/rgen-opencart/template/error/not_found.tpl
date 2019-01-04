<?php include $this->rgen('layout_top'); ?>
<p><?php echo $text_error; ?></p>
<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>
<?php 
	include $this->rgen('layout_bottom');
	echo $footer;
?>