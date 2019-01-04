<?php 
if (isset($product['name']) && sizeof($product) > 0) { 
$pdid = 'prd-'.$this->rgen('factory')->uid();
$valign = $column['content_view']['v_align'] ? ' '.$column['content_view']['v_align'] : ' align-t';
$blockClass = $block['img_position'] ? ' '.$block['img_position'] : null;
?>
<div class="deals-box deals-box2<?php echo $blockClass; ?>" id="<?php echo $pdid; ?>">
	<div class="img-wrp" style="background-image: url(<?php echo $product['image']; ?>);">
		<?php if ($block['sub_image_status'] && isset($product['th_image']) && sizeof($product['th_image']) > 0) { ?>
		<ul>
			<?php foreach ($product['th_image'] as $key => $value) { ?>
			<li><a class="thimg" data-main="<?php echo $value['img']; ?>" data-th="<?php echo $value['th']; ?>"><img src="<?php echo $value['th']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"></a></li>
			<?php } ?>
		</ul>
		<?php } ?>
		<a href="<?php echo $product['href']; ?>" class="overlay"><img src="<?php echo $product['spacer']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"></a>
	</div>

	<div class="info-wrp">
		
		<?php if (isset($product['end_date'])) { ?>
		<?php if ($product['end_date']) { ?>
		<div class="countdown">
		</div>
		<?php } ?>
		<?php } ?>

		<div class="name">
			<h2 class="h2"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
			<?php if ($block['cat_status']) { ?>
			<?php if (isset($product['cat_info']) && sizeof($product['cat_info']) > 0) { ?>
			<p class="prd-cats">
				<?php echo $lng_data['text_category'] . ' : '; ?>
				<?php foreach ($product['cat_info'] as $cat) { ?>
				<a href="<?php echo $cat['url']; ?>"><?php echo $cat['name']; ?></a> 
				<?php } ?>
			</p>
			<?php } } ?>
		</div>

		<?php if ($block['description_status'] && isset($product['description'])) { ?>
		<div class="description"><?php echo $product['description']; ?></div>
		<?php } ?>
		
		<?php if ($product['price']) { ?>
		<div class="price-wrp">
			<div class="price">
				<?php if (!$product['special']) { ?>
				<span class="price-new"><?php echo $product['price']; ?></span>
				<?php } else { ?>
				<span class="price-old"><?php echo $product['price']; ?></span>
				<span class="price-new price-spl"><?php echo $product['special']; ?></span>
				<?php } ?>
			</div>

			<?php if ($product['special']) { ?>
			<span class="discount-tag"><span><?php echo $this->rgen('factory')->discount($product['price'], $product['special']); ?></span></span>
			<?php } ?>
		</div>
		<?php } ?>
		
		<?php if ($block['rating_status'] && $product['rating']) { ?>
		<div class="review-stars">
			<?php for ($rating = 1; $rating <= 5; $rating++) { ?>
			<?php if ($product['rating'] < $rating) { ?>
			<i class="fa fa-star-o"></i>
			<?php } else { ?>
			<i class="fa fa-star"></i>
			<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>

			
		<?php if ($block['cart_status'] || $block['wishlist_status'] || $block['compare_status']) { ?>
		<?php $btn = $block['btn_text'] ? $block['btn_text'][$lng] : $button_cart; ?>
		<div class="btn-wrp">
			<?php if ($block['cart_status']) { ?>
			<a class="btn default-btn" title="<?php echo $btn; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo isset($product['minimum']) ? $product['minimum'] : 1; ?>');"><?php echo $btn; ?></a>
			<?php } ?>
			
			<?php if ($block['wishlist_status'] || $block['compare_status']) { ?>
			<div class="links">
				<?php if ($block['wishlist_status']) { ?>
				<a title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>	
				<?php } ?>
				
				<?php if ($block['compare_status']) { ?>
				<a title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
		<?php } ?>

	</div>

</div>
<script>
var obj = { 
	source: "#<?php echo $pdid; ?> .thimg", 
	target: "#<?php echo $pdid; ?> .img-wrp", 
	exit_wrp: "#<?php echo $pdid; ?> .img-wrp ul", 
	exit_data: "li:first .thimg" 
}
thgallery_fn(obj);

<?php if (isset($product['end_date'])) { ?>
<?php if ($product['end_date']) { ?>
var config = {
	counter: "#<?php echo $pdid; ?> .countdown",
	end_date: "<?php echo $product['end_date'];?>",
	ele: "#<?php echo $pdid; ?>",
	d: "<?php echo $lng_data['day']; ?>", 
	h: "<?php echo $lng_data['hour']; ?>",
	m: "<?php echo $lng_data['min']; ?>",
	s: "<?php echo $lng_data['sec']; ?>"
}
countdown_fn(config);
<?php } } ?>
</script>
<?php } ?>