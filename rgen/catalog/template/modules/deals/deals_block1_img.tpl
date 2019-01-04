<div class="cl img-wrp" style="background-image: url(<?php echo $product['image']; ?>);">
	<?php if ($block['sub_image_status'] && isset($product['th_image']) && sizeof($product['th_image']) > 0) { ?>
	<ul>
		<?php foreach ($product['th_image'] as $key => $value) { ?>
		<li><a class="thimg" data-main="<?php echo $value['img']; ?>" data-th="<?php echo $value['th']; ?>"><img src="<?php echo $value['th']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"></a></li>
		<?php } ?>
	</ul>
	<?php } ?>
	<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['spacer']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"></a>
</div>