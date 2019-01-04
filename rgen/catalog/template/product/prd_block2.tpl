<?php 
$rgen = $this->rgen('settings');
$lng = $rgen['lng'];
$lng_data        = $rgen['language_data'];
$button_cart     = $lng_data['button_cart'];
$button_wishlist = $lng_data['button_wishlist'];
$button_compare  = $lng_data['button_compare'];
$button_more     = $lng_data['button_more'];
$text_tax        = $lng_data['text_tax'];
$quickview_text  = isset($rgen['quickview']['quickview_text'][$lng]) ? html_entity_decode($rgen['quickview']['quickview_text'][$lng], ENT_QUOTES, 'UTF-8') : 'Quick view';

/*=====================*/

$prd2_grid   = $rgen['gb_prd2']['grid'];
$prd2_list   = $rgen['gb_prd2']['list'];
$prd2_normal = $rgen['gb_prd2']['normal'];

$cart_cls        = 	!$prd2_grid['cart'] ? ' grid-off' : ' grid-on';
$cart_cls       .= 	!$prd2_list['cart'] ? ' list-off' : ' list-on';
$cart_cls       .= 	!$prd2_normal['cart'] ? ' normal-off' : ' normal-on';

$wishlist_cls    = 	!$prd2_grid['wishlist'] ? ' grid-off' : ' grid-on';
$wishlist_cls   .= 	!$prd2_list['wishlist'] ? ' list-off' : ' list-on';
$wishlist_cls   .= 	!$prd2_normal['wishlist'] ? ' normal-off' : ' normal-on';

$compare_cls     = 	!$prd2_grid['compare'] ? ' grid-off' : ' grid-on';
$compare_cls    .= 	!$prd2_list['compare'] ? ' list-off' : ' list-on';
$compare_cls    .= 	!$prd2_normal['compare'] ? ' normal-off' : ' normal-on';

$more_cls     = 	!$prd2_grid['more'] ? ' grid-off' : ' grid-on';
$more_cls    .= 	!$prd2_list['more'] ? ' list-off' : ' list-on';
$more_cls    .= 	!$prd2_normal['more'] ? ' normal-off' : ' normal-on';

$description_cls  = !$prd2_grid['description'] ? ' grid-off' : ' grid-on';
$description_cls .= !$prd2_list['description'] ? ' list-off' : ' list-on';
$description_cls .= !$prd2_normal['description'] ? ' normal-off' : ' normal-on';

$rating_cls      = 	!$prd2_grid['rating'] ? ' grid-off' : ' grid-on';
$rating_cls     .= 	!$prd2_list['rating'] ? ' list-off' : ' list-on';
$rating_cls     .= 	!$prd2_normal['rating'] ? ' normal-off' : ' normal-on';

$price_cls       = 	!$prd2_grid['price'] ? ' grid-off' : ' grid-on';
$price_cls      .= 	!$prd2_list['price'] ? ' list-off' : ' list-on';
$price_cls      .= 	!$prd2_normal['price'] ? ' normal-off' : ' normal-on';

$tax_cls         = 	!$prd2_grid['tax'] ? ' grid-off' : ' grid-on';
$tax_cls        .= 	!$prd2_list['tax'] ? ' list-off' : ' list-on';
$tax_cls        .= 	!$prd2_normal['tax'] ? ' normal-off' : ' normal-on';

$quickview_cls   = 	!$prd2_grid['quickview'] ? ' grid-off' : ' grid-on';
$quickview_cls  .= 	!$prd2_list['quickview'] ? ' list-off' : ' list-on';
$quickview_cls  .= 	!$prd2_normal['quickview'] ? ' normal-off' : ' normal-on';

$btnwrp_cls  = 	$cart_cls;
$btnwrp_cls .= 	$wishlist_cls;
$btnwrp_cls .= 	$compare_cls;

/*=====================*/

$prd2_common = $rgen['gb_prd2']['common'];

if ($prd2_common['cart_ico_type'] == 'ico' && $prd2_common['cart_ico_status']) {
	$cart_ico = $prd2_common['cart_ico'];
} else if($prd2_common['cart_ico_type'] == 'img' && $prd2_common['cart_ico_status']) {
	$cart_ico = '';
} else {
	$cart_ico = 'glyphicon glyphicon-shopping-cart';
}
if ($prd2_common['wish_ico_type'] == 'ico' && $prd2_common['wish_ico_status']) {
	$wish_ico = $prd2_common['wish_ico'];
} else if($prd2_common['wish_ico_type'] == 'img' && $prd2_common['wish_ico_status']) {
	$wish_ico = '';
} else {
	$wish_ico = 'fa fa-heart';
}
if ($prd2_common['compare_ico_type'] == 'ico' && $prd2_common['compare_ico_status']) {
	$compare_ico = $prd2_common['compare_ico'];
} else if($prd2_common['compare_ico_type'] == 'img' && $prd2_common['compare_ico_status']) {
	$compare_ico = '';
} else {
	$compare_ico = 'fa fa-retweet';
}
if ($prd2_common['more_ico_type'] == 'ico' && $prd2_common['more_ico_status']) {
	$more_ico = $prd2_common['more_ico'];
} else if($prd2_common['more_ico_type'] == 'img' && $prd2_common['more_ico_status']) {
	$more_ico = '';
} else {
	$more_ico = 'fa fa-arrow-circle-o-right';
}

$quickview_ico = isset($prd2_common['quickview_ico']) ? $prd2_common['quickview_ico'] : 'fa fa-eye';
$offer_text = is_array($prd2_common['offer_text']) && sizeof($prd2_common['offer_text']) > 0 ? $prd2_common['offer_text'][$lng] : 'Offer';

/*=====================*/

?>
<div class="prd-block prd-block2">
	
	<?php if ($prd2_common['offer_tag'] == 'img') { ?>
	<?php if ($product['special']) { ?><span class="offer-tag"></span><?php } ?>
	<?php } ?>

	<?php if ($product['price']) { ?>
	<?php if ($prd2_common['offer_tag'] == 'dis') { ?>
	<?php if ($product['special']) { ?>
	<span class="offer-tag-discount"><span><?php echo $this->rgen('factory')->discount($product['price'], $product['special']); ?></span></span>
	<?php } ?>
	<?php } ?>
	<?php } ?>

	<?php if ($prd2_common['offer_tag'] == 'txt') { ?>
	<?php if ($product['special']) { ?>
	<span class="offer-tag-txt"><span><?php echo $offer_text; ?></span></span>
	<?php } ?>
	<?php } ?>

<!--	<a href="<?php echo $product['href'].'&urltype=quickview'; ?>" title="<?php echo $quickview_text; ?>" class="quickview-link<?php echo $quickview_cls; ?>"><i class="<?php echo $quickview_ico; ?>"></i> <?php echo $quickview_text; ?></a>-->

	<div class="image">
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
		<div class="info-wrp">
			<div class="info-content">
				<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
				
				<?php if ($product['rating']) { ?>
				<div class="review-stars<?php echo $rating_cls; ?>">
					<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($product['rating'] < $i) { ?>
					<i class="fa fa-star-o"></i>
					<?php } else { ?>
					<i class="fa fa-star"></i>
					<?php } ?>
					<?php } ?>
				</div>
				<?php } ?>
				<?php if ($product['price']) { ?>
				<div class="price<?php echo $price_cls; ?>">
					<?php if (!$product['special']) { ?>
					<span class="price-new"><?php echo $product['price']; ?></span>
					<?php } else { ?>
					<span class="price-old"><?php echo $product['price']; ?></span>
					<span class="price-new price-spl"><?php echo $product['special']; ?></span>
					
					<?php } ?>
					<?php if ($product['tax']) { ?>
					<span class="price-tax<?php echo $tax_cls; ?>"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
				</div>
				<?php } ?>
				<div class="btn-wrp<?php echo $btnwrp_cls; ?>">

					<a class="btn btn-cart<?php echo $cart_cls; ?>" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo isset($product['minimum']) ? $product['minimum'] : 1; ?>');"><i class="<?php echo $cart_ico; ?>"></i></a>

					<a class="btn btn-wish<?php echo $wishlist_cls; ?>" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="<?php echo $wish_ico; ?>"></i></a>

					<a class="btn btn-compare<?php echo $compare_cls; ?>" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="<?php echo $compare_ico; ?>"></i></a>
<!--	<a href="<?php echo $product['href'].'&urltype=quickview'; ?>" title="<?php echo $quickview_text; ?>" class="quickview-link<?php echo $quickview_cls; ?>"><i class="<?php echo $quickview_ico; ?>"></i> <?php echo $quickview_text; ?></a>-->

					<a class="quickview-link btn btn-more<?php echo $more_cls; ?>" data-toggle="tooltip" title="<?php echo $button_more; ?>" href="<?php echo $product['href'].'&urltype=quickview'; ?>"><i class="<?php echo $quickview_ico; ?>"></i></a>

				</div>
				<!--<p class="info<?php echo $description_cls; ?>"><?php echo $product['description']; ?></p>-->	
			</div>
			
		</div>

	</div>
	
</div>