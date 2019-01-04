<?php 
if ($prdpg == 1 || $prdpg == 2) {?>
	<ul class="ul-reset item-info">
		<?php if ($manufacturer) { ?>
		<li><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
		<?php } ?>
		<li><span><?php echo $text_model; ?></span> <?php echo $model; ?></li>
		<?php if ($reward) { ?>
		<li><span><?php echo $text_reward; ?></span> <?php echo $reward; ?></li>
		<?php } ?>
		<li><span><?php echo $text_stock; ?></span> <?php echo $stock; ?></li>
	</ul>

	<?php 
	/* PLACE - BELOW INFORMATION
	**************************/ ?>
	<?php echo isset($pdpg_binfo) ? $pdpg_binfo : null; ?>

	<?php 
	/* REIVEW
	**************************/ ?>
	<?php if ($rgen['prdpg_rating_status']) { ?>
	<?php if ($review_status) { ?>
	<div class="rating-wrp">
		<span class="review-stars large" data-toggle="tooltip" title="<?php echo '('.$reviews.')'; ?>">
			<?php for ($i = 1; $i <= 5; $i++) { ?>
			<?php if ($rating < $i) { ?>
			<i class="fa fa-star-o"></i>
			<?php } else { ?>
			<i class="fa fa-star"></i>
			<?php } ?>
			<?php } ?>	
		</span>
		<span class="review-links">
			<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a><br>
			<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>	
		</span>
	</div>
	<?php } ?>
	<?php } ?>

<?php } ?>

<?php 
/* PLACE - ABOVE OPTIONS
**************************/ ?>
<?php echo isset($pdpg_toption) ? $pdpg_toption : null; ?>
<?php 
/* PRODUCT OPTIONS
**************************/
if ($rgen['prdpg_options_status']) { include $this->rgen('prd_option_fields'); } ?>

<?php 
/* PLACE - BELOW OPTIONS
**************************/ ?>
<?php echo isset($pdpg_boption) ? $pdpg_boption : null; ?>

<?php 
if ($prdpg == 2 || $prdpg == 3) {
/* PRODUCT QUANTITY BOX
**************************/ ?>
<div class="buy-btn-wrp1">
	<?php if ($rgen['prdpg_cart_status']) { ?>
	<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
	<div class="control-qty">
		<a class="qty-handle" onclick="qtyMinus();"><i class="fa fa-minus-circle"></i></a>
		<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
		<a class="qty-handle" onclick="qtyPlus();"><i class="fa fa-plus-circle"></i></a>
		<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
	</div>
	<button type="button" class="btn btn-cart<?php echo $carttxt; ?>" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" ><i class="<?php echo $cart_ico; ?>"></i><?php echo $button_cart; ?></button>
	<?php } ?>
	
	<div class="cart-option">
		<?php if ($rgen['prdpg_wishlist_status']) { ?>
		<a onclick="wishlist.add('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
		<?php } ?>
		<?php if ($rgen['prdpg_compare_status']) { ?>
		<a onclick="compare.add('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>	
		<?php } ?>
	</div>
	<?php if ($minimum > 1) { ?>
	<div class="min-qty"><?php echo $text_minimum; ?></div>
	<?php } ?>
</div>
<?php 
/* PLACE - BELOW QUANTITY
**************************/ ?>
<?php echo isset($pdpg_bqty) ? $pdpg_bqty : null; ?>

<?php } ?>

<!-- AddThis Button BEGIN -->
<?php 
if (isset($rgen['prdpg_social_sharing'])) {
	echo html_entity_decode($rgen['prdpg_social_sharing'], ENT_QUOTES, 'UTF-8'); 	
}?>
<!-- <div class="addthis_toolbox addthis_default_style">
	<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a>
</div>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>  -->
<!-- AddThis Button END --> 
