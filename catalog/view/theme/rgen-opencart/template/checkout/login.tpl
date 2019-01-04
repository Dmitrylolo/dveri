<div class="row gut-30" >
	<div class="col-sm-6">
		<div class="frm-wrp">
			<h2 class="frm-hd"><?php echo $text_new_customer; ?></h2>
			<p><?php echo $text_checkout; ?></p>

			<?php if ($checkout_guest) { ?>
			<div class="radio">
				<label>
				<?php if ($account == 'guest') { ?>
				<input type="radio" name="account" value="guest" checked="checked" />
				<?php } else { ?>
				<input type="radio" name="account" value="guest" checked="checked" />
				<?php } ?>
				<?php echo $text_guest; ?></label>
			</div>
			<?php } ?>
			<input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="primary-btn" />
		</div>
	</div>
	
</div>

<script language="Javascript" type="text/javascript">
 $(document).ready(function(){
 $('#button-account').trigger('click');
 });
</script>
