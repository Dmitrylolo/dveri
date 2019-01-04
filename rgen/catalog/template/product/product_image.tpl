<?php 
/* PLACE - ABOVE IMAGE
**************************/ ?>
<?php echo isset($pdpg_timg) ? $pdpg_timg : null; ?>

<?php if ($thumb || $images) { ?>
<div class="product-images">
	<?php if ($thumb) { 
		if (sizeof($images) > 0) {
			$firstimg = array('popup' => $popup,'thumb' => $thumb);
			array_unshift($images, $firstimg);
		}
	?>
	<div class="main-img">
		<a <?php if ($rgen['prdpg_popup']) { ?>href="<?php echo $popup; ?>" <?php } ?>title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="m_i"/></a>
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
<script>
jQuery(document).ready(function($) {
	$('.additional-img').owlCarousel({
		stagePadding: 1,
		items: 5,
		margin:1,
		nav:true,
		dots: false,
		slideBy: 1,
		navText: ['<i class="fa fa-chevron-left" onClick="prev()"></i>', '<i class="fa fa-chevron-right" onClick="next()"></i>']
	});

	zoom = function () {
		setTimeout(function(){
			var h = $('.main-img').height();
			$(".main-img img").elevateZoom({
				gallery:'additional-img', cursor: 'pointer', galleryActiveClass: 'active',
				lensBorderSize:0,
				//zoomType: "inner",
				zoomWindowWidth: parseInt($('.main-img').width()),
				zoomWindowHeight: parseInt(h ? h : 400),
				zoomWindowOffetx: 10,
				zoomWindowOffety: -1
			});
			$('.additional-img .owl-item:first').find('.img').click();
		}, 300);
	}
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

	<?php if ($rgen['responsive_status']) { ?>
	enquire.register("only screen and (min-width: 768px)", {
		match : function() { zoom(); }
	}).register("only screen and (min-width: 200px) and (max-width: 767px)", {
		match : function() { innerzoom(); },
		unmatch : function() { zoom(); }
	});
	<?php } else { ?>
	zoom();
	<?php } ?>
	
	$('.main-img').magnificPopup({
		items: [
		<?php if ($images) { ?>
			<?php if ($thumb) { ?>{src: '<?php echo $popup; ?>'},<?php } ?>
			<?php foreach ($images as $image) { ?>{src: '<?php echo $image['popup']; ?>'},<?php } ?>
		<?php }else{ ?>
			<?php if ($thumb) { ?>{src: '<?php echo $popup; ?>'}<?php } ?>
		<?php } ?>
		],
		gallery: { enabled: true, preload: [0,2] },
		type: 'image',
		mainClass: 'mfp-fade',
		callbacks: {
			open: function() {
				<?php if ($images) { ?>
				var activeIndex = parseInt($('.additional-img .img.active').attr('data-index'));
				//var activeIndex = activeIndexVal;
				<?php }else{ ?>
				var activeIndex = 0;
				<?php } ?>
				var magnificPopup = $.magnificPopup.instance;
				magnificPopup.goTo(activeIndex);
			}
		}
	});

	<?php if ($rgen['prdpg_cloudzoom'] == false) { ?>
	$('body').addClass('hide-zoom');
	<?php } ?>
	
});
	
	function prev() {
		
	}
	function next() {
		
	}
</script>

<?php 
/* PLACE - BELOW IMAGE
**************************/ ?>
<?php echo isset($pdpg_bimg) ? $pdpg_bimg : null; ?>