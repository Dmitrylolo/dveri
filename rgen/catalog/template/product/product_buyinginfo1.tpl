<?php if ($rgen['prdpg_price_status']) { ?>
<div class="buying-info1">
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
			if ($rgen['prdpg_tax_status']) {
			if ($tax) { ?>
			<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
			<?php } } ?>
		</div>
		<?php 
		/* Points */
		if ($points) { ?>
		<span class="reward">1<?php echo $text_points; ?> <?php echo $points; ?></span>
		<?php } ?>

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