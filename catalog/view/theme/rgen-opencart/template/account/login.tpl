<?php include $this->rgen('layout_top'); ?>
<div class="row gut-30 login">
	<div class="col-sm-6">
		<div class="frm-wrp">
			<h2 class="frm-hd"><?php echo $text_new_customer; ?></h2>
			<p><strong><?php echo $text_register; ?></strong></p>
			<p><?php echo $text_register_account; ?></p>
			<a href="<?php echo $register; ?>" class="primary-btn"><?php echo $button_continue; ?></a>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="frm-wrp">
			<h2 class="frm-hd"><?php echo $text_returning_customer; ?></h2>
			<p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
				<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
				</div>
				<div class="form-group">
				<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
				<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
				<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
				<input type="submit" value="<?php echo $button_login; ?>" class="primary-btn" />
				<?php if ($redirect) { ?>
				<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
				<?php } ?>
			</form>
		</div>
	</div>
</div>

<?php 
	include $this->rgen('layout_bottom');
	include $this->rgen('msg_success');
	include $this->rgen('msg_error');
	echo $footer;
?>