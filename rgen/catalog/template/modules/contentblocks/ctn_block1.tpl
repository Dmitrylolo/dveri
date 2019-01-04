<section class="ctn-block ctn-block1 <?php echo $block['setting']['cssclass']; ?>"
	<?php if ($block['setting']['full_link'] && $block['setting']['url_status']) { ?>
		<?php if ($block['setting']['win']) { ?>
		onclick="window.open('<?php echo $block['setting']['url']; ?>','mywindow');" style="cursor: pointer;"
		<?php } else { ?>
		onclick="location.href='<?php echo $block['setting']['url']; ?>';"
		<?php } ?>
	<?php } ?>>
	<div class="ctn-inner-wrp">

		<?php 
		// Title above image
		if ($block['setting']['title_status'] && $title_pos == 'above') { ?>
			<h3 class="name">
				<?php if ($block['setting']['title_link'] && $block['setting']['url_status']) { ?>
				<a href="<?php echo $block['setting']['url']; ?>"<?php echo $block['setting']['win'] ? ' target="_blank"' : null; ?>>
				<?php } ?>
				<?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?>
				<?php if ($block['setting']['title_link'] && $block['setting']['url_status']) { ?></a><?php } ?>
			</h3>
		<?php } ?>
		
		<?php 
		// Image / Icon
		if ($block['setting']['image_status']) { ?>
			<?php if ($block['setting']['img_type'] == 'ico') { ?>
				
				<?php if ($block['setting']['img_link'] && $block['setting']['url_status']) { ?>
				<a href="<?php echo $block['setting']['url']; ?>"<?php echo $block['setting']['win'] ? ' target="_blank"' : null; ?>>
				<?php } ?>
				<figure class="icon vm" style="<?php echo $block['icon']['css'].$block['icon_style']; ?>"><i class="<?php echo $block['icon']['icon']; ?>"></i></figure>
				<?php if ($block['setting']['img_link'] && $block['setting']['url_status']) { ?></a><?php } ?>

			<?php } else { ?>
				
				<?php if ($block['setting']['img_link']) { ?>
				<a href="<?php echo $block['setting']['url']; ?>"<?php echo $block['setting']['win'] ? ' target="_blank"' : null; ?>>
				<?php } ?>
				<figure class="image"><img src="<?php echo $block['img']; ?>" alt="<?php echo $block['img_alt'][$lng]; ?>"></figure>
				<?php if ($block['setting']['img_link']) { ?></a><?php } ?>

			<?php } ?>
		<?php } ?>
		
		<div class="text-wrp">
			<?php 
			// Title below image
			if ($block['setting']['title_status'] && $title_pos == 'below') { ?>
				<h3 class="name">
					<?php if ($block['setting']['title_link'] && $block['setting']['url_status']) { ?>
					<a href="<?php echo $block['setting']['url']; ?>"<?php echo $block['setting']['win'] ? ' target="_blank"' : null; ?>>
					<?php } ?>
					<?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?>
					<?php if ($block['setting']['title_link'] && $block['setting']['url_status']) { ?></a><?php } ?>
				</h3>
			<?php } ?>
			
			<?php if ($block['setting']['description_status']) { ?>
			<div class="text"><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></div>
			<?php } ?>
		</div>

		<?php if ($block['setting']['btn_status'] && $block['setting']['url_status']) { ?>
			<?php if ($block['setting']['btn_style'] == 'lnk') { ?>
				<a href="<?php echo $block['setting']['url']; ?>" <?php echo $block['setting']['win'] ? 'target="_blank" ' : null; ?>class="ctn-block-lnk">
					<?php echo html_entity_decode($block['btn_text'][$lng], ENT_QUOTES, 'UTF-8'); ?>
				</a>
			<?php } else { ?>
			<div class="btn-wrp">
				<a href="<?php echo $block['setting']['url']; ?>" <?php echo $block['setting']['win'] ? 'target="_blank" ' : null; ?>class="default-btn">
					<?php echo html_entity_decode($block['btn_text'][$lng], ENT_QUOTES, 'UTF-8'); ?>
				</a>
			</div>
			<?php } ?>
		<?php } ?>

	</div>
</section>