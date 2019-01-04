<?php 
$cls  = isset($block['setting']['img_pos']) ? ' '.$block['setting']['img_pos'] : ' l';
$cls .= isset($block['setting']['cssclass']) && $block['setting']['cssclass'] != '' ? ' '.$block['setting']['cssclass'] : null;
$img_style  = isset($block['setting']['img_block_w']) && $block['setting']['img_block_w'] != '' ? 'max-width:'.$block['setting']['img_block_w'].'px; ' : null;
$img_style .= isset($block['setting']['img_block_t']) && $block['setting']['img_block_t'] != '' ? 'top:'.$block['setting']['img_block_t'].'px; ' : null;

if (isset($block['setting']['img_block_gt']) && $block['setting']['img_block_gt'] != '') {
	if (isset($block['setting']['img_pos']) && $block['setting']['img_pos'] == 'l') {
	$mrg = 'margin-left:'.($block['setting']['img_block_w']+$block['setting']['img_block_gt']).'px;';
	} else {
	$mrg = 'margin-right:'.($block['setting']['img_block_w']+$block['setting']['img_block_gt']).'px; margin-left: auto;';
	}
} else {
	$mrg = '';
} ?>

<section class="ctn-block ctn-block-small2<?php echo $cls; ?>"
	<?php if ($block['setting']['full_link'] && $block['setting']['url_status']) { ?>
		<?php if ($block['setting']['win']) { ?>
		onclick="window.open('<?php echo $block['setting']['url']; ?>','mywindow');" style="cursor: pointer;"
		<?php } else { ?>
		onclick="location.href='<?php echo $block['setting']['url']; ?>';"
		<?php } ?>
	<?php } ?>>
	<div class="ctn-inner-wrp">
		
		<?php 
		// Image / Icon
		if ($block['setting']['image_status']) { ?>
			<?php if ($block['setting']['img_type'] == 'ico') { ?>
				
				<?php if ($block['setting']['img_link'] && $block['setting']['url_status']) { ?>
				<a href="<?php echo $block['setting']['url']; ?>"<?php echo $block['setting']['win'] ? ' target="_blank"' : null; ?> class="img-wrp" style="<?php echo $img_style; ?>">
				<?php } else { ?>
				<span class="img-wrp" style="<?php echo $img_style; ?>">
				<?php } ?>
				<figure class="icon vm" style="<?php echo $block['icon']['css'].$block['icon_style']; ?>"><i class="<?php echo $block['icon']['icon']; ?>"></i></figure>
				<?php echo $block['setting']['img_link'] && $block['setting']['url_status'] ? '</a>' : '</span>'; ?>

			<?php } else { ?>
				
				<?php if ($block['setting']['img_link'] && $block['setting']['url_status']) { ?>
				<a href="<?php echo $block['setting']['url']; ?>"<?php echo $block['setting']['win'] ? ' target="_blank"' : null; ?> class="img-wrp" style="<?php echo $img_style; ?>">
				<?php } else { ?>
				<span class="img-wrp" style="<?php echo $img_style; ?>">
				<?php } ?>
				<figure class="image"><img src="<?php echo $block['img']; ?>" alt="<?php echo $block['img_alt'][$lng]; ?>"></figure>
				<?php echo $block['setting']['img_link'] && $block['setting']['url_status'] ? '</a>' : '</span>'; ?>

			<?php } ?>
		<?php } ?>

		<div class="text-wrp" style="<?php echo $mrg; ?>">
			<?php 
			// Title 
			if ($block['setting']['title_status']) { ?>
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

	</div>
</section>