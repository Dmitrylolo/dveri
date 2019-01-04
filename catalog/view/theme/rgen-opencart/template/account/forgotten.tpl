<?php include $this->rgen('layout_top'); ?>

<p><?php echo $text_email; ?></p>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="frm-wrp">
		<fieldset>
			<legend class="frm-hd"><?php echo $text_your_email; ?></legend>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
				<div class="col-sm-10">
					<input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
				</div>
			</div>
		</fieldset>
	</div>
	<div class="buttons clearfix">
		<div class="pull-left"><a href="<?php echo $back; ?>" class="default-btn"><?php echo $button_back; ?></a></div>
		<div class="pull-right"><input type="submit" value="<?php echo $button_continue; ?>" class="primary-btn" /></div>
	</div>
</form>

<?php 
	include $this->rgen('layout_bottom');
	include $this->rgen('msg_error');
	echo $footer;
?>