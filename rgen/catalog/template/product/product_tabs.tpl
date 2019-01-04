<?php 
/* PLACE - ABOVE TABS
**************************/ ?>
<?php echo isset($pdpg_ttab) ? $pdpg_ttab : null; 

/* PRODUCT CUSTOM TABS
**************************/
include $this->rgen('prd_customtabs'); ?>

<ul class="nav nav-tabs">

	<?php if ($rgen['prdpg_description_status']) { ?>
	<li><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
	<?php } ?>
	
	<?php if ($rgen['prdpg_specification_status']) { ?>
	<?php if ($attribute_groups) { ?>
	<li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
	<?php } } ?>
	
	<?php 
	/* CUSTOM TAB
	**************************/
	if (isset($tab_list) && sizeof($tab_list) > 0) { ?>
	<?php foreach ($tab_list as $key => $value) { ?>
	<li><a href="#<?php echo $value['tab_id']; ?>" data-toggle="tab"><?php echo $value['title'][$rgen['lng']]; ?></a></li>
	<?php } } ?>
	
	<?php if ($rgen['prdpg_rating_status']) { ?>
	<?php if ($review_status) { ?>
	<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
	<?php } ?>
	<?php } ?>
</ul>
<div class="tab-content">
	<?php 
	/* DESCRIPTION TAB
	**************************/ ?>
	<?php if ($rgen['prdpg_description_status']) { ?>
	<div class="tab-pane" id="tab-description"><?php echo $description; ?></div>
	<?php } ?>

	<?php 
	/* SPECIFICATION TAB
	**************************/ ?>
	<?php if ($rgen['prdpg_specification_status']) { ?>
	<?php if ($attribute_groups) { ?>
	<div class="tab-pane" id="tab-specification">
		<table class="table table-bordered">
			<?php foreach ($attribute_groups as $attribute_group) { ?>
			<thead>
				<tr>
					<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
				<tr>
					<td><?php echo $attribute['name']; ?></td>
					<td><?php echo $attribute['text']; ?></td>
				</tr>
				<?php } ?>
			</tbody>
			<?php } ?>
		</table>
	</div>
	<?php } } ?>
	
	<?php 
	/* CUSTOM TAB
	**************************/ ?>
	<?php if (isset($tab_list) && sizeof($tab_list) > 0) { ?>
	<?php foreach ($tab_list as $key => $value) { ?>
	<div class="tab-pane" id="<?php echo $value['tab_id']; ?>">
	<?php echo html_entity_decode($value['description'][$rgen['lng']], ENT_QUOTES, 'UTF-8'); ?>
	</div>
	<?php } } ?>

	<?php 
	/* REIVEW TAB
	**************************/ ?>
	<?php if ($rgen['prdpg_rating_status']) { ?>
	<?php if ($review_status) { ?>
	<div class="tab-pane" id="tab-review">
		<form id="form-review">
			<div id="review"></div>
			<h4 class="h4 bdr-b"><?php echo $text_write; ?></h4>
			<?php if ($review_guest) { ?>
			<div class="form-group required">
				<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
				<input type="text" name="name" value="" id="input-name" class="form-control" />
			</div>
			<div class="form-group required">
				<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
				<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
				<div class="help-block"><?php echo $text_note; ?></div>
			</div>
			<div class="form-group required">
				<label class="control-label"><?php echo $entry_rating; ?></label>
				<ul class="rating ul-reset">
					<li><?php echo $entry_bad; ?></li>
					<li class="rate-count">
						<input type="radio" name="rating" value="1" />
						<input type="radio" name="rating" value="2" />
						<input type="radio" name="rating" value="3" />
						<input type="radio" name="rating" value="4" />
						<input type="radio" name="rating" value="5" />	
					</li>
					<li><?php echo $entry_good; ?></li>
				</ul>
			</div>
			<?php if ($site_key) { ?>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
				</div>
			</div>
			<?php } ?>

			<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn default-btn"><?php echo $button_continue; ?></button>
			<?php } else { ?>
			<?php echo $text_login; ?>
			<?php } ?>
		</form>
	</div>
	<?php } ?>
	<?php } ?>
</div>
<script>
$('.product-info .nav-tabs > li:first').addClass('active');
$('.product-info .tab-content > .tab-pane:first').addClass('active');
</script>

<?php 
/* PLACE - BELOW TABS
**************************/ ?>
<?php echo isset($pdpg_btab) ? $pdpg_btab : null; ?>