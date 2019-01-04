<?php include $this->rgen('layout_top'); ?>

<div class="frm-wrp contact-info">
	<h3 class="frm-hd"><?php echo $text_location; ?></h3>
	<div class="row">
		<?php if ($image) { ?>
		<div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
		<?php } ?>
		<div class="col-sm-3">
			<h5 class="h5 bdr-b"><?php echo $store; ?></h5>
			<address>
			<?php echo $address; ?>
			</address>
			<?php if ($geocode) { ?>
			<a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="default-btn"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
			<?php } ?>
		</div>
		<div class="col-sm-3">
			<h5 class="h5 bdr-b"><?php echo $text_telephone; ?></h5>
			<?php echo $telephone; ?><br />
			<br />
			<?php if ($fax) { ?>
			<h5 class="h5 bdr-b"><?php echo $text_fax; ?></h5>
			<?php echo $fax; ?>
			<?php } ?>
		</div>
		<div class="col-sm-3">
			<?php if ($open) { ?>
			<h5 class="h5 bdr-b"><?php echo $text_open; ?></h5>
			<?php echo $open; ?><br />
			<br />
			<?php } ?>
			<?php if ($comment) { ?>
			<h5 class="h5 bdr-b"><?php echo $text_comment; ?></h5>
			<?php echo $comment; ?>
			<?php } ?>
		</div>
	</div>
</div>

<?php if ($locations) { ?>
<h3><?php echo $text_store; ?></h3>
<div class="panel-group" id="accordion">
<?php foreach ($locations as $location) { ?>
<div class="panel panel-default">
  <div class="panel-heading">
	<h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
  </div>
  <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
	<div class="panel-body">
	  <div class="row">
		<?php if ($location['image']) { ?>
		<div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
		<?php } ?>
		<div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
		  <address>
		  <?php echo $location['address']; ?>
		  </address>
		  <?php if ($location['geocode']) { ?>
		  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
		  <?php } ?>
		</div>
		<div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
		  <?php echo $location['telephone']; ?><br />
		  <br />
		  <?php if ($location['fax']) { ?>
		  <strong><?php echo $text_fax; ?></strong><br>
		  <?php echo $location['fax']; ?>
		  <?php } ?>
		</div>
		<div class="col-sm-3">
		  <?php if ($location['open']) { ?>
		  <strong><?php echo $text_open; ?></strong><br />
		  <?php echo $location['open']; ?><br />
		  <br />
		  <?php } ?>
		  <?php if ($location['comment']) { ?>
		  <strong><?php echo $text_comment; ?></strong><br />
		  <?php echo $location['comment']; ?>
		  <?php } ?>
		</div>
	  </div>
	</div>
  </div>
</div>
<?php } ?>
</div>
<?php } ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
<div class="frm-wrp">
<fieldset>
  <h3 class="frm-hd"><?php echo $text_contact; ?></h3>
  <div class="form-group required">
	<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
	<div class="col-sm-10">
	  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
	  <?php if ($error_name) { ?>
	  <div class="text-danger"><?php echo $error_name; ?></div>
	  <?php } ?>
	</div>
  </div>
  <div class="form-group required">
	<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
	<div class="col-sm-10">
	  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
	  <?php if ($error_email) { ?>
	  <div class="text-danger"><?php echo $error_email; ?></div>
	  <?php } ?>
	</div>
  </div>
  <div class="form-group required">
	<label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
	<div class="col-sm-10">
	  <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
	  <?php if ($error_enquiry) { ?>
	  <div class="text-danger"><?php echo $error_enquiry; ?></div>
	  <?php } ?>
	</div>
  </div>
  		            <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
            <div class="col-sm-10">
              <input type="text" name="captcha" id="input-captcha" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 pull-right">
              <img src="index.php?route=tool/captcha" alt="" />
              <?php if ($error_captcha) { ?>
                <div class="text-danger"><?php echo $error_captcha; ?></div>
              <?php } ?>
            </div>
          </div>
  <?php /* if ($site_key) { ?>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
        <?php if ($error_captcha) { ?>
          <div class="text-danger"><?php echo $error_captcha; ?></div>
        <?php } ?>
      </div>
    </div>
  <?php } */?>
</fieldset>
</div>
<div class="buttons">
  <div class="pull-right">
	<input class="default-btn" type="submit" value="<?php echo $button_submit; ?>" />
  </div>
</div>
</form>

<?php 
	include $this->rgen('layout_bottom');
	echo $footer;
?>