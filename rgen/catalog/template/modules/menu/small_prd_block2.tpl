<?php 
$rgen           = $this->rgen('settings');
$lng_data       = $rgen['language_data'];
$button_cart		= $lng_data['button_cart'];
?>
<div class="sm-prd-block sm-prd-block2">
	<div class="image">
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
	</div>
	<div class="info-wrp">
		<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
		<?php if ($product['rating']) { ?>
		<!-- <div class="rating">
			<?php for ($i = 1; $i <= 5; $i++) { ?>
			<?php if ($product['rating'] < $i) { ?>
			<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
			<?php } else { ?>
			<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
			<?php } ?>
			<?php } ?>
		</div> -->
		<?php } ?>
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
		<button type="button" class="btn btn-default btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>	
	</div>
	
</div>