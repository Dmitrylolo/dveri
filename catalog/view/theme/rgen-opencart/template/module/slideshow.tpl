<?php 
if(null !== $this->registry->get('rgen_check') && $this->registry->get('rgen_check') != false){
$rgen        = $this->rgen('settings');
$mod         = $rgen['ocmd_slideshow'];
?>
<div id="slideshow<?php echo $module; ?>" class="oc-slideshow mod-wrp">

	<?php if ($mod['arrow']) { ?>
	<a class="prev"><i class="fa fa-chevron-left fa-5x"></i></a>
	<a class="next"><i class="fa fa-chevron-right fa-5x"></i></a>
	<?php } ?>

	<div class="owl-carousel<?php echo ' dots-typ'.$mod['dot_style']; ?>" style="opacity: 1;">
		<?php foreach ($banners as $banner) { ?>
		<div class="item">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		</div>
		<?php } ?>
	</div>
</div>
<script type="text/javascript"><!--
jQuery(document).ready(function($) {
	var owl<?php echo $module; ?> = $('#slideshow<?php echo $module; ?> .owl-carousel');
	owl<?php echo $module; ?>.owlCarousel({
		<?php if (sizeof($banners) > 1) { ?>
		loop            : <?php echo $mod['loop'] ? 'true' : 'false'; ?>,
		autoplay        : <?php echo $mod['autoplay'] ? 'true' : 'false'; ?>,
		autoplayHoverPause: <?php echo $mod['autoplay_hover'] ? 'true' : 'false'; ?>,
		autoplayTimeout : <?php echo $mod['interval']; ?>,
		<?php }; ?>
		smartSpeed      : <?php echo $mod['speed']; ?>,
		animateOut      : "<?php echo $mod['animateOut']; ?>",
		animateIn       : "<?php echo $mod['animateIn']; ?>",
		items           : 1,
		margin          : 30,
		stagePadding    : 0,
		dots            : <?php echo $mod['dots'] ? 'true' : 'false'; ?>,
		navigationText  : ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
	});	

	<?php if ($mod['arrow']) { ?>
	$('#slideshow<?php echo $module; ?> .next').on('click', function() { owl<?php echo $module; ?>.trigger('next.owl.carousel'); });
	$('#slideshow<?php echo $module; ?> .prev').on('click', function() { owl<?php echo $module; ?>.trigger('prev.owl.carousel'); });
	<?php } ?>

});
--></script>
<?php } ?>