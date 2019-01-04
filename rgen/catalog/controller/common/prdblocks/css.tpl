<?php 
/* Product block 1
=========================*/
if (isset($prd1) && $prd1['status']) {
	
	// Offer tags
	echo isset($prd1['offer_img']) ? '
	.prd-block1 .offer-tag { '. $prd1['offer_img'] . ' }' : '';

	echo isset($prd1['offer_dis']) ? '
	.prd-block1 .offer-tag-discount { '. $prd1['offer_dis'] . ' }' : '';

	echo isset($prd1['offer_text']) ? '
	.prd-block1 .offer-tag-txt { '. $prd1['offer_text'] . ' }' : '';

	// Product box button icons
	echo isset($prd1['cart_ico']) ? '
	.prd-block1 .btn-cart i { '. $prd1['cart_ico'] . ' display: inline-block; }' : '';

	echo isset($prd1['wish_ico']) ? '
	.prd-block1 .btn-wish i { '. $prd1['wish_ico'] . ' display: inline-block; }' : '';

	echo isset($prd1['compare_ico']) ? '
	.prd-block1 .btn-compare i { '. $prd1['compare_ico'] . ' display: inline-block; }' : '';

	/* Normal view
	=========================*/
	if (isset($prd1['normal'])) {
		prd1($prd1['normal']);
		$normal_prd1 = $prd1['normal'];
		if (isset($normal_prd1)) {
			echo isset($normal_prd1['block_normal']) ? '
			.prd-block1 { '. $normal_prd1['block_normal'] . ' }' : '';

			echo isset($normal_prd1['block_hover']) ? '
			.prd-block1:hover { '. $normal_prd1['block_hover'] . ' }' : '';

			echo isset($normal_prd1['image_normal']) ? '
			.prd-block1 .image { '. $normal_prd1['image_normal'] . ' }' : '';

			echo isset($normal_prd1['image_hover']) ? '
			.prd-block1 .image:hover { '. $normal_prd1['image_hover'] . ' }' : '';

			echo isset($normal_prd1['info_block']) ? '
			.prd-block1 .caption { '. $normal_prd1['info_block'] . ' }' : '';

			echo isset($normal_prd1['info_wrpper']) ? '
			.prd-block1 .caption .info-wrp { '. $normal_prd1['info_wrpper'] . ' }' : '';

			echo isset($normal_prd1['info_name']) ? '
			.prd-block1 .caption .name a { '. $normal_prd1['info_name'] . ' }' : '';

			echo isset($normal_prd1['info_name_hover']) ? '
			.prd-block1 .caption .name a:hover { '. $normal_prd1['info_name_hover'] . ' }' : '';

			echo isset($normal_prd1['info_description']) ? '
			.prd-block1 .caption .info { '. $normal_prd1['info_description'] . ' }' : '';

			echo isset($normal_prd1['price_block']) ? '
			.prd-block1 .price { '. $normal_prd1['price_block'] . ' }' : '';

			echo isset($normal_prd1['price_new']) ? '
			.prd-block1 .price .price-new { '. $normal_prd1['price_new'] . ' }' : '';

			echo isset($normal_prd1['price_spl']) ? '
			.prd-block1 .price .price-spl { '. $normal_prd1['price_spl'] . ' }' : '';

			echo isset($normal_prd1['price_old']) ? '
			.prd-block1 .price .price-old { '. $normal_prd1['price_old'] . ' }' : '';

			echo isset($normal_prd1['price_tax']) ? '
			.prd-block1 .price .price-tax { '. $normal_prd1['price_tax'] . ' }' : '';

			echo isset($normal_prd1['btn_wrp']) ? '
			.prd-block1 .btn-wrp { '. $normal_prd1['btn_wrp'] . ' }' : '';

			echo isset($normal_prd1['cart_btn_normal']) ? '
			.prd-block1 .btn-cart { '. $normal_prd1['cart_btn_normal'] . ' }' : '';

			echo isset($normal_prd1['cart_btn_hover']) ? '
			.prd-block1 .btn-cart:hover { '. $normal_prd1['cart_btn_hover'] . ' }' : '';

			echo isset($normal_prd1['wish_btn_normal']) ? '
			.prd-block1 .btn-wish { '. $normal_prd1['wish_btn_normal'] . ' }' : '';

			echo isset($normal_prd1['wish_btn_hover']) ? '
			.prd-block1 .btn-wish:hover { '. $normal_prd1['wish_btn_hover'] . ' }' : '';

			echo isset($normal_prd1['compare_btn_normal']) ? '
			.prd-block1 .btn-compare { '. $normal_prd1['compare_btn_normal'] . ' }' : '';

			echo isset($normal_prd1['compare_btn_hover']) ? '
			.prd-block1 .btn-compare:hover { '. $normal_prd1['compare_btn_hover'] . ' }' : '';
		}
	}

	/* Grid view
	=========================*/
	if (isset($prd1['grid'])) {
		prd1($prd1['grid'], '.product-grid ');
	}

	/* List view
	=========================*/
	if (isset($prd1['list'])) {
		prd1($prd1['list'], '.product-list ');
	}
}


/* Product block 2
=========================*/
if (isset($prd2) && $prd2['status']) {
	
	// Offer tags
	echo isset($prd2['offer_img']) ? '
	.prd-block2 .offer-tag { '. $prd2['offer_img'] . ' }' : '';

	echo isset($prd2['offer_dis']) ? '
	.prd-block2 .offer-tag-discount { '. $prd2['offer_dis'] . ' }' : '';

	echo isset($prd2['offer_text']) ? '
	.prd-block2 .offer-tag-txt { '. $prd2['offer_text'] . ' }' : '';

	// Product box button icons
	echo isset($prd2['cart_ico']) ? '
	.prd-block2 .btn-cart i { '. $prd2['cart_ico'] . ' }' : '';

	echo isset($prd2['wish_ico']) ? '
	.prd-block2 .btn-wish i { '. $prd2['wish_ico'] . ' }' : '';

	echo isset($prd2['compare_ico']) ? '
	.prd-block2 .btn-compare i { '. $prd2['compare_ico'] . ' }' : '';

	echo isset($prd2['more_ico']) ? '
	.prd-block2 .btn-more i { '. $prd2['more_ico'] . ' }' : '';

	/* Normal view
	=========================*/
	if (isset($prd2['normal'])) {
		prd2($prd2['normal']);
	}

	/* Grid view
	=========================*/
	if (isset($prd2['grid'])) {
		prd2($prd2['grid'], '.product-grid ');
	}

	/* List view
	=========================*/
	if (isset($prd2['list'])) {
		prd2($prd2['list'], '.product-list ');
	}
}

/* Product block 3
=========================*/
if (isset($prd3) && $prd3['status']) {
	
	// Offer tags
	echo isset($prd3['offer_img']) ? '
	.prd-block3 .offer-tag { '. $prd3['offer_img'] . ' }' : '';

	echo isset($prd3['offer_dis']) ? '
	.prd-block3 .offer-tag-discount { '. $prd3['offer_dis'] . ' }' : '';

	echo isset($prd3['offer_text']) ? '
	.prd-block3 .offer-tag-txt { '. $prd3['offer_text'] . ' }' : '';

	// Product box button icons
	echo isset($prd3['cart_ico']) ? '
	.prd-block3 .btn-cart i { '. $prd3['cart_ico'] . ' }' : '';

	echo isset($prd3['wish_ico']) ? '
	.prd-block3 .btn-wish i { '. $prd3['wish_ico'] . ' }' : '';

	echo isset($prd3['compare_ico']) ? '
	.prd-block3 .btn-compare i { '. $prd3['compare_ico'] . ' }' : '';

	echo isset($prd3['more_ico']) ? '
	.prd-block3 .btn-more i { '. $prd3['more_ico'] . ' }' : '';

	/* Normal view
	=========================*/
	if (isset($prd3['normal'])) {
		prd3($prd3['normal']);
	}

	/* Grid view
	=========================*/
	if (isset($prd3['grid'])) {
		prd3($prd3['grid'], '.product-grid ');
	}

	/* List view
	=========================*/
	if (isset($prd3['list'])) {
		prd3($prd3['list'], '.product-list ');
	}
}

/* Product block 4
=========================*/
if (isset($prd4) && $prd4['status']) {
	
	// Product box button icons
	echo isset($prd4['quickview_ico']) ? '
	.prd-block4 .quickview-link i { '. $prd4['quickview_ico'] . ' }' : '';

	// Offer tags
	echo isset($prd4['offer_img']) ? '
	.prd-block4 .offer-tag { '. $prd4['offer_img'] . ' }' : '';

	echo isset($prd4['offer_dis']) ? '
	.prd-block4 .offer-tag-discount { '. $prd4['offer_dis'] . ' }' : '';

	echo isset($prd4['offer_text']) ? '
	.prd-block4 .offer-tag-txt { '. $prd4['offer_text'] . ' }' : '';

	/* Normal view
	=========================*/
	if (isset($prd4['normal'])) {
		prd4($prd4['normal']);
	}

	/* Grid view
	=========================*/
	if (isset($prd4['grid'])) {
		prd4($prd4['grid'], '.product-grid ');
	}

	/* List view
	=========================*/
	if (isset($prd4['list'])) {
		prd4($prd4['list'], '.product-list ');
	}
}

/* Small product block 1
=========================*/
if (isset($smallprd1)) {
	smallprd1($smallprd1);
}

/* Small product block 2
=========================*/
if (isset($smallprd2)) {
	smallprd2($smallprd2);
}
?>