<?php $blockclass = isset($block['setting']['cssclass']) ? ' '.$block['setting']['cssclass'] : null; ?>
<div 
	class="banner-grid-item" 
	id="<?php echo 'banner_grid_block_'.$g; ?>" 
	data-colspan="<?php echo $block['setting']['w']; ?>" 
	data-rowspan="<?php echo $block['setting']['h']; ?>">

	<?php 
	switch ($block['setting']['hoverstyle']) {
		case '1': ?>
			<figure class="effect-1 h-effect<?php echo $blockclass; ?>">
				<img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" />
				<figcaption>
					<?php if ($block['title_status'] || $block['description_status']) { ?>
					<div>
						<?php if ($block['title_status']) { ?>
						<h2 class="h3"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
						<?php } ?>
						<?php if ($block['description_status']) { ?>
						<p><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
						<?php } ?>
					</div>
					<?php } ?>

					<?php if ($block['images']['url'] != '') { ?>
					<a href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="image/spacer.gif" alt="<?php echo $block['images']['img_alt'][$lng]; ?>"></a>
					<?php } ?>
				</figcaption>
			</figure>
		<?php break;

		case '2': ?>
			<figure class="effect-2 h-effect<?php echo $blockclass; ?>">
				<img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" />
				<figcaption>
					<?php if ($block['title_status'] || $block['description_status']) { ?>
						<?php if ($block['title_status']) { ?>
						<h2 class="h3"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
						<?php } ?>
						<?php if ($block['description_status']) { ?>
						<p><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
						<?php } ?>
					<?php } ?>

					<?php if ($block['images']['url'] != '') { ?>
					<a href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="image/spacer.gif" alt="<?php echo $block['images']['img_alt'][$lng]; ?>"></a>
					<?php } ?>
				</figcaption>
			</figure>
		<?php break;

		case '3': ?>
			<figure class="effect-3 h-effect<?php echo $blockclass; ?>">
				<img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" />
				<figcaption>
					<?php if ($block['title_status'] || $block['description_status']) { ?>
						<?php if ($block['title_status']) { ?>
						<h2 class="h3"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
						<?php } ?>
						<?php if ($block['description_status']) { ?>
						<p><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
						<?php } ?>
					<?php } ?>
					
					<?php if ($block['images']['url'] != '') { ?>
					<a href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="image/spacer.gif" alt="<?php echo $block['images']['img_alt'][$lng]; ?>"></a>
					<?php } ?>
				</figcaption>
			</figure>
		<?php break;

		case '4': ?>
			<figure class="effect-4 h-effect<?php echo $blockclass; ?>">
				<?php if ($block['images']['url'] != '') { ?>
				<a href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="image/spacer.gif" alt="<?php echo $block['images']['img_alt'][$lng]; ?>"></a>
				<?php } ?>
				<img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" />
				<figcaption>
					<?php if ($block['title_status'] || $block['description_status']) { ?>
						<?php if ($block['title_status']) { ?>
						<h2 class="h4"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
						<?php } ?>
						<?php if ($block['description_status']) { ?>
						<p class="description"><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
						<?php } ?>
					<?php } ?>
				</figcaption>
			</figure>
		<?php break;

		case '5': ?>
			<figure class="effect-5 h-effect<?php echo $blockclass; ?>">
				<img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" />
				<figcaption>
					<?php if ($block['title_status'] || $block['description_status']) { ?>
						<?php if ($block['title_status']) { ?>
						<h2 class="h3"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
						<?php } ?>
						<?php if ($block['description_status']) { ?>
						<p><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
						<?php } ?>
					<?php } ?>

					<?php if ($block['images']['url'] != '') { ?>
					<a href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="image/spacer.gif" alt="<?php echo $block['images']['img_alt'][$lng]; ?>"></a>
					<?php } ?>
				</figcaption>
			</figure>
		<?php break;

		case '6': ?>
			<figure class="effect-6 h-effect<?php echo $blockclass; ?>">
				<img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" />
				<figcaption>
					<?php if ($block['title_status'] || $block['description_status']) { ?>
						<?php if ($block['title_status']) { ?>
						<h2 class="h3"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h2>
						<?php } ?>
						<?php if ($block['description_status']) { ?>
						<p><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
						<?php } ?>
					<?php } ?>

					<?php if ($block['images']['url'] != '') { ?>
					<a href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="image/spacer.gif" alt="<?php echo $block['images']['img_alt'][$lng]; ?>"></a>
					<?php } ?>
				</figcaption>
			</figure>
		<?php break;
			
		default: ?>
			<?php if ($block['images']['url'] != '') { ?>
			<a class="bnr-img" href="<?php echo $block['images']['url']; ?>"<?php echo $block['images']['win']; ?>><img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<span class="bnr-img"><img src="<?php echo $block['images']['img']; ?>" alt="<?php echo $block['images']['img_alt'][$lng]; ?>" class="img-responsive" /></span>
			<?php } ?>
		<?php break;
	} ?>

</div>