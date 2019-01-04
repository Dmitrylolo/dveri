<?php 
$rgen           = $this->rgen('settings');
$lng_data       = $rgen['language_data'];
$button_cart		= $lng_data['button_cart'];
?>
<div class="flyout-prd">
	<div class="image">
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
	</div>
	<div class="info-wrp">
		<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
		<?php if ($product['price']) { ?>
		<div class="price">
			<?php if (!$product['special']) { ?>
			<span class="price-new"><?php echo $product['price']; ?></span>
			<?php } else { ?>
			<span class="price-new"><?php echo $product['special']; ?></span>
			<span class="price-old"><?php echo $product['price']; ?></span>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
</div>