<div class="mod-wrp oc-carousel">
	<div id="carousel<?php echo $module; ?>" data-widget="autoCarousel" class="widget-carousel ctrl-b" data-stpd="1" data-resitems="7" data-nav="false" data-dots="true" data-res="true">
	<?php foreach ($banners as $banner) { ?>
	<div class="item text-center">
		<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
		<?php } else { ?>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
		<?php } ?>
	</div>
	<?php } ?>
	</div>
</div>