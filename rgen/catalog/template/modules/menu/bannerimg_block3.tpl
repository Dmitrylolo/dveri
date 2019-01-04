<div class="bannerimg-block bannerimg-block3<?php echo $banner['margin_b']; ?>">
	<?php if (isset($banner['url']) && $banner['url'] != '') { ?>
	<a class="image" href="<?php echo $banner['url']; ?>"<?php echo $banner['open'] == true ? " target='_blank'" : null; ?>>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" title="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
		<?php if ($banner['title_status'] == true) { ?>
		<span class="name"><b><?php echo html_entity_decode($banner['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></b></span>
		<?php } ?>
	</a>
	<?php } else { ?>
	<span class="image">
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" title="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
		<?php if ($banner['title_status'] == true) { ?>
		<span class="name"><b><?php echo html_entity_decode($banner['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></b></span>
		<?php } ?>
	</span>
	<?php } ?>
</div>