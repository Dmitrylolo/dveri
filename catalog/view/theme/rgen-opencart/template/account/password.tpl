<?php include $this->rgen('layout_top'); ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="frm-wrp">
		<fieldset>
			<legend class="frm-hd"><?php echo $text_password; ?></legend>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
				<div class="col-sm-10">
					<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
					<?php if ($error_password) { ?>
					<div class="text-danger"><?php echo $error_password; ?></div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
				<div class="col-sm-10">
					<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
					<?php if ($error_confirm) { ?>
					<div class="text-danger"><?php echo $error_confirm; ?></div>
					<?php } ?>
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
	echo $footer;
?>
