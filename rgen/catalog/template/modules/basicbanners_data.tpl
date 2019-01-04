<?php 
switch ($modules['config']['hoverstyle']) {
	case '1': ?>
		<div class="effect-1 h-effect">
			<img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
			<figcaption>
				<div>
					<h2 class="h3"><?php echo html_entity_decode($banner['cp_title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
					<p><?php echo html_entity_decode($banner['cp_text'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
				</div>
				<?php if ($banner['url'] && $banner['url'] != '') { ?>
				<a href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>>View more</a>
				<?php } ?>
			</figcaption>
		</div>
	<?php break;

	case '2': ?>
		<figure class="effect-2 h-effect">
			<img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
			<figcaption>
				<h2 class="h3"><?php echo html_entity_decode($banner['cp_title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
				<p><?php echo html_entity_decode($banner['cp_text'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
				<?php if ($banner['url'] && $banner['url'] != '') { ?>
				<a href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>>View more</a>
				<?php } ?>
			</figcaption>
		</figure>
	<?php break;

	case '3': ?>
		<figure class="effect-3 h-effect">
			<img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
			<figcaption>
				<h2 class="h3"><?php echo html_entity_decode($banner['cp_title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
				<p><?php echo html_entity_decode($banner['cp_text'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
				<?php if ($banner['url'] && $banner['url'] != '') { ?>
				<a href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>>View more</a>
				<?php } ?>
			</figcaption>
		</figure>
	<?php break;

	case '4': ?>
		<figure class="effect-4 h-effect">
			<?php if ($banner['url'] && $banner['url'] != '') { ?>
			<a href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>><img src="image/spacer.gif" alt="<?php echo $banner['title'][$lng]; ?>"></a>
			<?php } ?>
			<img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
			<figcaption>
				<h2 class="h4"><?php echo html_entity_decode($banner['cp_title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
				<p class="description"><?php echo html_entity_decode($banner['cp_text'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
			</figcaption>
		</figure>
	<?php break;

	case '5': ?>
		<figure class="effect-5 h-effect">
			<img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
			<figcaption>
				<h2 class="h3"><?php echo html_entity_decode($banner['cp_title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
				<p><?php echo html_entity_decode($banner['cp_text'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
				<?php if ($banner['url'] && $banner['url'] != '') { ?>
				<a href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>><img src="image/spacer.gif" alt="<?php echo $banner['title'][$lng]; ?>"></a>
				<?php } ?>
			</figcaption>
		</figure>
	<?php break;

	case '6': ?>
		<figure class="effect-6 h-effect">
			<img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" />
			<figcaption>
				<h2 class="h3"><?php echo html_entity_decode($banner['cp_title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
				<p><?php echo html_entity_decode($banner['cp_text'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
				<?php if ($banner['url'] && $banner['url'] != '') { ?>
				<a href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>><img src="image/spacer.gif" alt="<?php echo $banner['title'][$lng]; ?>"></a>
				<?php } ?>
			</figcaption>
		</figure>
	<?php break;
		
	default: ?>
		<?php if ($banner['url']) { ?>
		<a class="bnr-img" href="<?php echo $banner['url']; ?>"<?php echo $banner['win']; ?>><img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" /></a>
		<?php } else { ?>
		<span class="bnr-img"><img src="<?php echo $banner['img']; ?>" alt="<?php echo $banner['title'][$lng]; ?>" class="img-responsive" /></span>
		<?php } ?>
	<?php break;
} ?>