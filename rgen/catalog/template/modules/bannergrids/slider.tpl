<div class="banner-grid-item" id="<?php echo 'banner_grid_block_'.$g; ?>" data-colspan="<?php echo $block['setting']['w']; ?>" data-rowspan="<?php echo $block['setting']['h']; ?>">
	<div class="slideshow-wrp dots-typ1">
		<div class="slideshow">
			<?php foreach ($block['images'] as $key => $slide) { ?>
			<div class="slide">
				<?php if (isset($slide['url']) && $slide['url'] != '') { ?>
				<a href="<?php echo $slide['url']; ?>"<?php echo $slide['win']; ?>><img src="<?php echo $slide['img']; ?>" alt="<?php echo $slide['img_alt'][$lng]; ?>"/></a>
				<?php } else { ?>
				<img src="<?php echo $slide['img']; ?>" alt="<?php echo $slide['img_alt'][$lng]; ?>"/>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
	<script>
	<?php $slider_config = $block['setting']['slider']; ?>
	jQuery(document).ready(function($) {
		var obj = "#<?php echo $modid . ' #banner_grid_block_'.$g; ?> .slideshow";
		var settings = {
			effect      : "<?php echo $slider_config['effect']; ?>",
			speed       : <?php echo $slider_config['speed']; ?>,
			pause       : <?php echo $slider_config['pause']; ?>,
			auto        : <?php echo $slider_config['auto'] ? "true" : "false"; ?>,
			prevNext    : <?php echo $slider_config['arrows'] ? "true" : "false"; ?>,
			pager       : <?php echo $slider_config['pager'] ? "true" : "false"; ?>,
			continuous  : <?php echo $slider_config['continuous'] ? "true" : "false"; ?>,
			stoponhover : <?php echo $slider_config['stoponhover'] ? "true" : "false"; ?>
		};
		sudoSliderfn(obj, settings);
	});
	</script>
</div>