<?php 
$rgen            = $this->rgen('settings');
$lng             = $rgen['lng'];
$lng_data        = $rgen['language_data'];
$button_cart     = $lng_data['button_cart'];
$button_wishlist = $lng_data['button_wishlist'];
$button_compare  = $lng_data['button_compare'];
$button_more     = $lng_data['button_more'];
$text_tax        = $lng_data['text_tax'];
$quickview_text  = isset($rgen['quickview']['quickview_text'][$lng]) ? html_entity_decode($rgen['quickview']['quickview_text'][$lng], ENT_QUOTES, 'UTF-8') : 'Quick view';

/*=====================*/

$prd1_grid   = $rgen['gb_prd1']['grid'];
$prd1_list   = $rgen['gb_prd1']['list'];
$prd1_normal = $rgen['gb_prd1']['normal'];

$cart_cls        = 	!$prd1_grid['cart'] ? ' grid-off' : ' grid-on';
$cart_cls       .= 	!$prd1_list['cart'] ? ' list-off' : ' list-on';
$cart_cls       .= 	!$prd1_normal['cart'] ? ' normal-off' : ' normal-on';

$wishlist_cls    = 	!$prd1_grid['wishlist'] ? ' grid-off' : ' grid-on';
$wishlist_cls   .= 	!$prd1_list['wishlist'] ? ' list-off' : ' list-on';
$wishlist_cls   .= 	!$prd1_normal['wishlist'] ? ' normal-off' : ' normal-on';

$compare_cls     = 	!$prd1_grid['compare'] ? ' grid-off' : ' grid-on';
$compare_cls    .= 	!$prd1_list['compare'] ? ' list-off' : ' list-on';
$compare_cls    .= 	!$prd1_normal['compare'] ? ' normal-off' : ' normal-on';

$description_cls  = !$prd1_grid['description'] ? ' grid-off' : ' grid-on';
$description_cls .= !$prd1_list['description'] ? ' list-off' : ' list-on';
$description_cls .= !$prd1_normal['description'] ? ' normal-off' : ' normal-on';

$rating_cls      = 	!$prd1_grid['rating'] ? ' grid-off' : ' grid-on';
$rating_cls     .= 	!$prd1_list['rating'] ? ' list-off' : ' list-on';
$rating_cls     .= 	!$prd1_normal['rating'] ? ' normal-off' : ' normal-on';

$price_cls       = 	!$prd1_grid['price'] ? ' grid-off' : ' grid-on';
$price_cls      .= 	!$prd1_list['price'] ? ' list-off' : ' list-on';
$price_cls      .= 	!$prd1_normal['price'] ? ' normal-off' : ' normal-on';

$tax_cls         = 	!$prd1_grid['tax'] ? ' grid-off' : ' grid-on';
$tax_cls        .= 	!$prd1_list['tax'] ? ' list-off' : ' list-on';
$tax_cls        .= 	!$prd1_normal['tax'] ? ' normal-off' : ' normal-on';

$quickview_cls   = 	!$prd1_grid['quickview'] ? ' grid-off' : ' grid-on';
$quickview_cls  .= 	!$prd1_list['quickview'] ? ' list-off' : ' list-on';
$quickview_cls  .= 	!$prd1_normal['quickview'] ? ' normal-off' : ' normal-on';

$btnwrp_cls  = 	$cart_cls;
$btnwrp_cls .= 	$wishlist_cls;
$btnwrp_cls .= 	$compare_cls;

/*=====================*/

$prd1_common = $rgen['gb_prd1']['common'];

if ($prd1_common['cart_ico_type'] == 'ico' && $prd1_common['cart_ico_status']) {
	$cart_ico = $prd1_common['cart_ico'];
} else if($prd1_common['cart_ico_type'] == 'img' && $prd1_common['cart_ico_status']) {
	$cart_ico = '';
} else {
	$cart_ico = 'glyphicon glyphicon-shopping-cart';
}
if ($prd1_common['wish_ico_type'] == 'ico' && $prd1_common['wish_ico_status']) {
	$wish_ico = $prd1_common['wish_ico'];
} else if($prd1_common['wish_ico_type'] == 'img' && $prd1_common['wish_ico_status']) {
	$wish_ico = '';
} else {
	$wish_ico = 'fa fa-heart';
}
if ($prd1_common['compare_ico_type'] == 'ico' && $prd1_common['compare_ico_status']) {
	$compare_ico = $prd1_common['compare_ico'];
} else if($prd1_common['compare_ico_type'] == 'img' && $prd1_common['compare_ico_status']) {
	$compare_ico = '';
} else {
	$compare_ico = 'fa fa-retweet';
}

$quickview_ico = isset($prd1_common['quickview_ico']) ? $prd1_common['quickview_ico'] : 'fa fa-eye';
$offer_text    = is_array($prd1_common['offer_text']) && sizeof($prd1_common['offer_text']) > 0 ? $prd1_common['offer_text'][$lng] : 'Offer';
/*=====================*/

?>
<div class="prd-block prd-block1">
	
	<?php if ($prd1_common['offer_tag'] == 'img') { ?>
	<?php if ($product['special']) { ?><span class="offer-tag"></span><?php } ?>
	<?php } ?>
	
	<?php if ($product['price']) { ?>
	<?php if ($prd1_common['offer_tag'] == 'dis') { ?>
	<?php if ($product['special']) { ?>
	<span class="offer-tag-discount"><span><?php echo $this->rgen('factory')->discount($product['price'], $product['special']); ?></span></span>
	<?php } ?>
	<?php } ?>
	<?php } ?>

	<?php if ($prd1_common['offer_tag'] == 'txt') { ?>
	<?php if ($product['special']) { ?>
	<span class="offer-tag-txt"><span><?php echo $offer_text; ?></span></span>
	<?php } ?>
	<?php } ?>

	<div class="image">
		<a href="<?php echo $product['href'].'&urltype=quickview'; ?>" data-toggle="tooltip" title="<?php echo $quickview_text; ?>" class="quickview-link<?php echo $quickview_cls; ?>"><i class="<?php echo $quickview_ico; ?>"></i> <?php echo $quickview_text; ?></a>
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
	</div>
	
	<div class="info-wrp">
		<?php if ($product['price']) { ?>
		<div class="price-wrp">
			<p class="vm price<?php echo $price_cls; ?>">
				<span class="vm-item">
					<?php if (!$product['special']) { ?>
					<span class="price-new"><?php echo $product['price']; ?></span>
					<?php } else { ?>
					<span class="price-old"><?php echo $product['price']; ?></span>
					<span class="price-new price-spl"><?php echo $product['special']; ?></span>
					<?php } ?>
					<?php /* if ($product['tax']) { ?>
					<span class="price-tax<?php echo $tax_cls; ?>"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
					<?php } */?>	
				</span>
			</p>
		</div>
		<?php } ?>

		<div class="info">
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
			<div class="description<?php echo $description_cls; ?>"><?php echo $product['description']; ?></div>
			<div class="buy-option">
				<a class="vm btn btn-cart<?php echo $cart_cls; ?>" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo isset($product['minimum']) ? $product['minimum'] : 1; ?>');"><i class="vm-item <?php echo $cart_ico; ?>"></i></a>
				<ul>
					<li><a href="<?php echo $product['href']; ?>"><?php echo $button_more; ?></a></li>
					<li class="<?php echo $wishlist_cls; ?>"><a onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></li>
					<li class="<?php echo $compare_cls; ?>"><a onclick="compare.add('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>