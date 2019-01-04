<div 
	class="menu-infobox-block menu-infobox2<?php echo $infobox['margin_b']; ?>" 
	style="<?php echo isset($infobox['align']) ? 'text-align:' . $infobox['align'] . ';' : null; ?>">
	
	<?php if ($infobox['image_status'] == true) { ?>
	<a class="image" href="<?php echo $infobox['url']; ?>"<?php echo $infobox['open'] == true ? " target='_blank'" : null; ?>>
		<img src="<?php echo $infobox['image']; ?>" alt="<?php echo $infobox['title'][$lng]; ?>" title="<?php echo $infobox['title'][$lng]; ?>" class="img-responsive" />
	</a>
	<?php } ?>
	
	<?php if ($infobox['title_status'] == true) { ?>
	<h4 class="name"><?php echo html_entity_decode($infobox['title'][$lng], ENT_QUOTES, 'UTF-8') ; ?></h4>
	<?php } ?>
	
	<?php if ($infobox['description_status'] == true) { ?>
	<?php if (isset($infobox['description'][$lng]) && $infobox['description'][$lng] != '') { ?>
	<div class="text">
		<?php echo html_entity_decode($infobox['description'][$lng], ENT_QUOTES, 'UTF-8'); ?>
	</div>
	<?php } ?>
	<?php } ?>

	<?php if ($infobox['btn_status'] == true) { ?>
	<?php if (isset($infobox['button'][$lng]) && $infobox['button'][$lng] != '') { ?>
	<div class="btn-wrp">
		<a href="<?php echo $infobox['url']; ?>"<?php echo $infobox['open'] == true ? " target='_blank'" : null; ?>class="btn-mini default-btn"><?php echo html_entity_decode($infobox['button'][$lng], ENT_QUOTES, 'UTF-8'); ?></a>	
	</div>
	<?php } ?>
	<?php } ?>
</div>