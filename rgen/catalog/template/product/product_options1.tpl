<?php 
/* PRODUCT OPTIONS
**************************/ ?>
<div id="product">
	<?php 
	/* PLACE - ABOVE OPTIONS
	**************************/ ?>
	<?php echo isset($pdpg_toption) ? $pdpg_toption : null; ?>
	
	<?php if ($rgen['prdpg_options_status']) { ?>
	<h4 class="options-title"><?php echo $text_option; ?></h4>
	<?php include $this->rgen('prd_option_fields');
	} ?>

	<?php 
	/* PLACE - BELOW OPTIONS
	**************************/ ?>
	<?php echo isset($pdpg_boption) ? $pdpg_boption : null; ?>

	<?php 
	/* PRODUCT QUANTITY BOX
	**************************/ ?>
	<div class="buy-btn-wrp">
		<?php if ($rgen['prdpg_cart_status']) { ?>
		<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
		<div class="control-qty">
			<a class="qty-handle" onclick="qtyMinus();"><i class="fa fa-minus-circle"></i></a>
			<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
			<a class="qty-handle" onclick="qtyPlus();"><i class="fa fa-plus-circle"></i></a>
			<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
		</div>
		<?php } ?>
		
		<div class="btn-group">
			<?php if ($rgen['prdpg_cart_status']) { ?>
			<button type="button" data-toggle="tooltip" class="btn btn-cart<?php echo $carttxt; ?>" title="<?php echo $button_cart; ?>" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" ><i class="<?php echo $cart_ico; ?>"></i><?php echo $button_cart; ?></button>
			<?php } ?>
			<?php if ($rgen['prdpg_wishlist_status']) { ?>
			<button type="button" data-toggle="tooltip" class="btn btn-wish" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="<?php echo $wish_ico; ?>"></i><?php echo $button_wishlist; ?></button>
			<?php } ?>
			<?php if ($rgen['prdpg_compare_status']) { ?>
			<button type="button" data-toggle="tooltip" class="btn btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="<?php echo $compare_ico; ?>"></i><?php echo $button_compare; ?></button>
			<?php } ?>
		</div>

		<?php if ($minimum > 1) { ?>
		<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
		<?php } ?>
	</div>
	
	<?php 
	/* PLACE - BELOW QUANTITY
	**************************/ ?>
	<?php echo isset($pdpg_bqty) ? $pdpg_bqty : null; ?>
	
</div>

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
