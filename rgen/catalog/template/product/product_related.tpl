<?php if ($products) { ?>
<div class="related-prd">

	<h3 class="h3"><?php echo $text_related; ?></h3>
	<div class="related-img ctrl-b" id="related-img">
		<?php  $i=1; foreach ($products as $product) { ?>
		
			<a href="<?php echo $product['href']; ?>" data-index="<?php echo $i; ?>" class="img" data-image="<?php echo $product['thumb']; ?>" title="<?php echo $product['sku'].' '.$product['name']; ?>"> <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['sku'].' '.$product['name']; ?>" alt="<?php echo $product['sku'].' '.$product['name']; ?>" /></a>
		
		<?php $i++; } ?>
		
		<script>

		</script>
		</div>
</div>

<?php } ?>
<script>
jQuery(document).ready(function($) {
		
		var main_img = $(".main-img img")[0].src;

		$("#related-img img").mouseleave(function(){
			$(".main-img img")[0].src = main_img;		
		});
		$("#related-img img").mouseover(function(){
			$(".main-img img")[0].src = this.src;
			
			
		});
	
	
	
	$('.related-img').owlCarousel({
		stagePadding: 1,
		items: 3,
		margin:1,
		nav:true,
		dots: false,
		slideBy: 1,
		navText: ['<i class="fa fa-chevron-left" onClick="prev()"></i>', '<i class="fa fa-chevron-right" onClick="next()"></i>']
	});
	
});
	
	function prev() {
		
	}
	function next() {
		
	}
</script>