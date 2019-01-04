<?php 
$rgen            = $this->rgen('settings');
$lng             = $rgen['lng'];
$lng_data        = $rgen['language_data'];
$button_cart     = $lng_data['button_cart'];
$button_wishlist = $lng_data['button_wishlist'];
$button_compare  = $lng_data['button_compare'];
$button_more     = $lng_data['button_more'];
?>
<div class="small-prd-block small-prd-block1">
	
	<?php if ($product['price']) { ?>
	<?php if ($product['special']) { ?>
	<span class="offer-tag-discount"><span><?php echo $this->rgen('factory')->discount($product['price'], $product['special']); ?></span></span>
	<?php } ?>
	<?php } ?>
	
	<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
	<div class="info">
		<h5 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h5>
		<?php if ($product['rating']) { ?>
		<div class="review-stars">
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
		<p class="price">
			<?php if (!$product['special']) { ?>
			<span class="price-new"><?php echo $product['price']; ?></span>
			<?php } else { ?>
			<span class="price-old"><?php echo $product['price']; ?></span>
			<span class="price-new price-spl"><?php echo $product['special']; ?></span>
			<?php } ?>
		</p>
		<?php } ?>
		
		<a href="<?php echo $product['href']; ?>" class="more-btn"><i class="fa fa-arrow-circle-o-right"></i></a>
	</div>
</div>