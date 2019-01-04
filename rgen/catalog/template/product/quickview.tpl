<?php  
	if ($_SERVER['HTTPS']) {
		$base = HTTPS_SERVER;
	} else {
		$base = HTTP_SERVER;
	}
	$cssFiles   = $this->rgen('assets')->cssFiles;
	$jsFiles    = $this->rgen('assets')->jsFiles;
	$qv_setting = $rgen['quickview'];
	
	$customizeCSS = FILE_CONFIG_STYLE.'?'.time();
	$cssFiles[md5($customizeCSS)] = $customizeCSS;
?>
<html>
<head>
	<title><?php echo $heading_title; ?></title>
	<meta name="robots" content="noindex">
	<base href="<?php echo $base; ?>" />
	<?php foreach ($cssFiles as $css) { ?>
	<link href="<?php echo $css ?>" rel="stylesheet">
	<?php } ?>
	<?php foreach ($jsFiles as $js) { ?>
	<script type="text/javascript" src="<?php echo $js; ?>"></script>
	<?php } ?>
</head>
<body class="quickview-body">
	<div class="quickview-wrp">
		<h1>
			<strong><?php echo $heading_title; ?></strong>
			<a class="more-info default-btn btn-xs"><?php echo isset($qv_setting['moreinfo_text'][$rgen['lng']]) ? html_entity_decode($qv_setting['moreinfo_text'][$rgen['lng']], ENT_QUOTES, 'UTF-8') : 'Go to product page'; ?></a>
		</h1>
		<div class="rw gt20">
			<div class="cl6">
				<?php if ($thumb || $images) { ?>
				<div class="product-images">
					<?php if ($thumb) { 
						if (sizeof($images) > 0) {
							$firstimg = array('popup' => $popup,'thumb' => $thumb);
							array_unshift($images, $firstimg);
						}
					?>
					<div class="main-img">
						<a title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
					</div>
					<?php } ?>
					<?php if ($images) { ?>
					<div class="additional-img ctrl-b" id="additional-img">
						<?php $i=1; foreach ($images as $image) { ?>
						<a data-index="<?php echo $i; ?>" class="img" data-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
						<?php $i++; } ?>	
					</div>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
			<div class="cl6">

				<?php if ($qv_setting['description_status']) { ?>
				<ul class="nav nav-tabs">
					<?php if ($qv_setting['description_status']) { ?>
					<li class="active"><a href="#tab-options" data-toggle="tab"><?php echo $text_option; ?></a></li>
					<li><a href="#tab-description" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
					<?php } ?>
				</ul>
				<?php } ?>
				
				<?php if ($qv_setting['description_status']) { ?>
				<div class="tab-content">
				<?php } ?>

					<?php if ($qv_setting['description_status']) { ?>
					<div class="tab-pane active" id="tab-options">
					<?php } ?>

						<div class="item-info">
							<ul class="ul-reset">
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
							/* REIVEW
							**************************/ ?>
							<?php if ($qv_setting['rating_status']) { ?>
							<?php if ($review_status) { ?>
							<span class="review-stars large" data-toggle="tooltip" title="<?php echo '('.$reviews.')'; ?>">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($rating < $i) { ?>
								<i class="fa fa-star-o"></i>
								<?php } else { ?>
								<i class="fa fa-star"></i>
								<?php } ?>
								<?php } ?>	
							</span>
							<?php } } ?>
						</div>
						
						
						<?php if ($qv_setting['price_status']) { ?>
						<div class="price-info">
							<?php 
							/* PRICE DATA
							**************************/
							if ($price) { ?>
								<div class="price">
									<?php 
									/* Price */
									if (!$special) { ?>
									<span class="price-new"><?php echo $price; ?></span>
									<?php } else { ?>
									<span class="price-old"><?php echo $price; ?></span>
									<span class="price-new price-spl"><?php echo $special; ?></span>
									<?php } ?>
									<?php 

									/* TAX */
									if ($qv_setting['tax_status']) {
									if ($tax) { ?>
									<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
									<?php } }

									/* Points */
									if ($points) { ?>
									<span class="reward">3<?php echo $text_points; ?> <?php echo $points; ?></span>
									<?php } ?>
								</div>
								<?php 

								/* Discount */
								if ($discounts) { ?>
								<ul class="discount ul-reset">
									<?php foreach ($discounts as $discount) { ?>
									<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
									<?php } ?>
								</ul>
								<?php } ?>
							<?php } ?>
						</div>
						<?php } ?>
						
						<div id="product">
							<?php if ($qv_setting['options_status']) { ?>
							<?php include $this->rgen('prd_option_fields'); ?>
							<?php } ?>

							<?php 
							/* PRODUCT QUANTITY BOX
							**************************/ ?>
							<?php if ($qv_setting['options_status'] || $qv_setting['cart_status']) { ?>
							<div class="buy-btn-block">
								<?php if ($qv_setting['options_status']) { ?>
									<?php if ($qv_setting['cart_status']) { ?>
									<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
									<div class="control-qty">
										<a class="qty-handle" onClick="qtyMinus();"><i class="fa fa-minus-circle"></i></a>
										<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
										<a class="qty-handle" onClick="qtyPlus();"><i class="fa fa-plus-circle"></i></a>
										<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
									</div>
									<button type="button" class="btn btn-cart<?php echo $carttxt; ?>" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" ><i class="<?php echo $qv_setting['cart_icon']; ?>"></i><?php echo $button_cart; ?></button>
									<?php } ?>
								<?php } else { ?>
									<?php if ($qv_setting['cart_status']) { ?>
									<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
									<div class="control-qty">
										<a class="qty-handle" onClick="qtyMinus();"><i class="fa fa-minus-circle"></i></a>
										<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
										<a class="qty-handle" onClick="qtyPlus();"><i class="fa fa-plus-circle"></i></a>
										<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
									</div>
									<button type="button" onClick="parent.cart.add('<?php echo $product_id; ?>', $('#input-quantity').val());" class="btn btn-cart<?php echo $carttxt; ?>" data-loading-text="<?php echo $text_loading; ?>" ><i class="<?php echo $qv_setting['cart_icon']; ?>"></i><?php echo $button_cart; ?></button>
									<?php } ?>
								<?php } ?>

								<div class="cart-option">
									<?php if ($qv_setting['wishlist_status']) { ?>
									<a onClick="parent.wishlist.add('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
									<?php } ?>
									<?php if ($qv_setting['compare_status']) { ?>
									<a onClick="parent.compare.add('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>	
									<?php } ?>
								</div>
								<?php if ($minimum > 1) { ?>
								<div class="min-qty"><?php echo $text_minimum; ?></div>
								<?php } ?>
							</div>
							<?php } ?>

						</div>

					<?php if ($qv_setting['description_status']) { ?>
					</div>
					<?php } ?>
					

					<?php if ($qv_setting['description_status']) { ?>
					<div class="tab-pane" id="tab-description">
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
					<?php } ?>

				<?php if ($qv_setting['description_status']) { ?>
				</div>
				<?php } ?>

			</div>
		</div>
	</div>

	<script>
	jQuery(document).ready(function($) {
		$('.additional-img').owlCarousel({
			stagePadding: 1,
			items: 5,
			margin:1,
			nav:true,
			dots: false,
			slideBy: 1,
			navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>']
		});
		innerzoom = function () {
			setTimeout(function(){
				var h = $('.main-img').height();
				$(".main-img img").elevateZoom({
					gallery:'additional-img', cursor: 'pointer', galleryActiveClass: 'active',
					lensBorderSize:0,
					zoomType: "inner",
					zoomWindowWidth: parseInt($('.main-img').width()),
					zoomWindowHeight: parseInt(h ? h : 400),
					zoomWindowOffetx: 10,
					zoomWindowOffety: -1
				});
				$('.additional-img .owl-item:first').find('.img').click();
			}, 300);
		}
		innerzoom();
		$('.more-info').on('click', function(event) {
			event.preventDefault();
			var str = location.href;
			var url = str.replace("?urltype=quickview", "");
			parent.location.href = url;
		});
	});
	</script>