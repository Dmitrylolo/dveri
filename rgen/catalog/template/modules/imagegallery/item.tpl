<?php 
$title_status = isset($block['title_status']) ? $block['title_status'] : true;
$description_status = isset($block['description_status']) ? $block['description_status'] : true; ?>
<figure class="gallery-item" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
	<div class="overlay">
		<span>
			<a class="pop ico" href="<?php echo $block['image']['img']; ?>" itemprop="image" data-size="<?php echo $block['image']['size']; ?>">
				<?php if (isset($block['zoom_icon']['type']) && $block['zoom_icon']['type'] == 'ico') { ?>
				<i class="<?php echo isset($block['zoom_icon']['icon']) ? $block['zoom_icon']['icon'] : 'fa fa-plus'; ?>"></i>
				<?php } else { ?>
				<i style="<?php echo isset($block['zoom_icon']['css']) ? $block['zoom_icon']['css'] : ''; ?>"></i>
				<?php } ?>
			</a>
			<?php if ($block['image']['url'] != '') { ?>
			<a href="<?php echo $block['image']['url']; ?>"<?php echo $block['image']['win']; ?> class="url ico" itemprop="url">
				<?php if (isset($block['url_icon']['type']) && $block['url_icon']['type'] == 'ico') { ?>
				<i class="<?php echo isset($block['url_icon']['icon']) ? $block['url_icon']['icon'] : 'fa fa-link'; ?>"></i>
				<?php } else { ?>
				<i style="<?php echo isset($block['url_icon']['css']) ? $block['url_icon']['css'] : ''; ?>"></i>
				<?php } ?>
			</a>
			<?php } ?>
		</span>
	</div>
	<img src="<?php echo $block['image']['thumb']; ?>" itemprop="thumbnail" alt="<?php echo $block['image']['img_alt'][$lng]; ?>" class="img-responsive" />
	<?php if ($title_status || $description_status) { ?>
	<figcaption>
		<?php if ($title_status) { ?>
		<h3 itemprop="caption"><?php echo html_entity_decode($block['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php } ?>
		<?php if ($description_status) { ?>
		<p itemprop="description"><?php echo html_entity_decode($block['description'][$lng], ENT_QUOTES, 'UTF-8'); ?></p>
		<?php } ?>
	</figcaption>
	<?php } ?>
</figure>