<div class="bannerimg-block bannerimg-block4<?php echo $banner['margin_b']; ?>">
	<?php if (isset($banner['url']) && $banner['url'] != '') { ?>
	<a class="image" href="<?php echo $banner['url']; ?>"<?php echo $banner['open'] == true ? " target='_blank'" : null; ?>>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" title="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
	</a>	
	<?php } else { ?>
	<span class="image">
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" title="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
	</span>
	<?php } ?>
</div>