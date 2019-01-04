<?php 
if (isset($modules)) {
$rgen      = $this->rgen('settings');
$modid     = $module_name.'-'.$this->rgen('factory')->uid();
$container = isset($data['settings']['container']) && $data['settings']['container'] == 'bx' || !isset($data['settings']['container']) ? ' container' : null;

$l         = $modules['config']['left']['status'];
$r         = $modules['config']['right']['status'];
$t         = $modules['config']['top']['status'];
$b         = $modules['config']['bottom']['status'];

$col_l     = isset($modules['config']['left']['size']) && $l ? $modules['config']['left']['size'] : 0;
$col_r     = isset($modules['config']['right']['size']) && $r ? $modules['config']['right']['size'] : 0;
$col_m     = 12;
if ($l && !$r) { $col_m = 12-$col_l; }
if ($l && $r) { $col_l+$col_r < 12 ? $col_m = 12-($col_l+$col_r) : $col_m = 12-$col_l; }
if (!$l && $r) { $col_m = 12-$col_r; }

/* Normal view
------------------------*/
if (isset($modules['data'])) {?>
<div id="<?php echo $modid; ?>" class="<?php echo $module_name . $module_class; ?>" data-pswp-uid="1">
	<div class="mod-wrp<?php echo $container; ?>">
		<?php 
		/* Common data
		------------------------*/ ?>
		<?php if (isset($modules['config']['title'][$lng]) && $modules['config']['title'][$lng] != '' && $modules['config']['title_status']) { ?>
		<h3 class="mod-hd"><?php echo html_entity_decode($modules['config']['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php } ?>
		
		<?php if (isset($modules['config']['top']['html'][$lng]) && $modules['config']['top']['html'][$lng] != '' && $t) { ?>
		<section class="mod-customhtml t-html"><?php echo html_entity_decode($modules['config']['top']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
		<?php } ?>
		
		<div class="rw <?php echo $modules['config']['gt']; ?>">
			<?php if ($l) { ?>
			<div class="l-cl cl<?php echo $col_l; ?> t-xl12">
				<?php if (isset($modules['config']['left']['html'][$lng]) && $modules['config']['left']['html'][$lng] != '') { ?>
				<section class="mod-customhtml l-html"><?php echo html_entity_decode($modules['config']['left']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
				<?php } ?>
			</div>	
			<?php } ?>
			
			<div class="m-cl cl<?php echo $col_m; ?> t-xl12">
				<div class="mod-content">
					<?php foreach ($modules['data'] as $row) { ?>
						<div class="rw <?php echo $row['row']['gutter'].' '.$row['row']['margin_b']; ?>">
							<?php $i = 0; foreach ($row['columns'] as $column) { ?>
							<div class="cl <?php echo $column['col_size']; ?>">
								

								<?php 
								/* Masonry grids
								------------------------*/
								if ($column["content_view"]['view'] == 'masonry') { ?>
								<div class="masonry-wrp" id="masonry-<?php echo $modid."_".$i; ?>" itemscope itemtype="http://schema.org/ImageGallery">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php $g = 0; foreach ($column['content_items'] as $block) { ?>
									<div 
										class="masonry-item" 
										data-colspan="<?php echo $block['setting']['w']; ?>" 
										data-rowspan="<?php echo $block['setting']['h']; ?>">
										<?php include $this->rgen('imagegallery_item'); ?>
									</div>
									<?php $g++; } } ?>
								</div>
								<script>
								jQuery(document).ready(function($) {
									var settings = {
										gutter: '<?php echo $column["content_view"]["gt"]; ?>px',
										itemclass: '.masonry-item'
									};
									bnrgrids('#<?php echo $modid; ?> #masonry-<?php echo $modid."_".$i; ?>', settings);
								});
								</script>
								<?php } ?>


								<?php 
								/* Normal grids
								------------------------*/
								if ($column["content_view"]['view'] == 'grid') { ?>
								<?php 
								$eq_grids = isset($column['content_view']['grids']['classGroup']) ? 
											$column['content_view']['grids']['classGroup'] : 
											' eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10'; ?>
								<div class="gallery-normalgrid-<?php echo $i; ?> rw<?php echo $eq_grids; ?>" id="grid-<?php echo $modid."_".$i; ?>" itemscope itemtype="http://schema.org/ImageGallery">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { ?>
									<div class="cl">
										<?php include $this->rgen('imagegallery_item'); ?>
									</div>
									<?php } } ?>
								</div>
								<script>
								jQuery(document).ready(function($) {
									equalH('#<?php echo $modid; ?> #grid-<?php echo $modid."_".$i; ?>', '#<?php echo $modid; ?> #grid-<?php echo $modid."_".$i; ?> > .cl');
								});
								</script>
								<?php } ?>


								<?php 
								/* Carousel
								------------------------*/
								if ($column["content_view"]['view'] == 'carousel') { ?>
								<div 
									id            ="carousel-<?php echo $modid."_".$i; ?>"
									class         ="widget-carousel ctrl-b" 
									data-stpd     ="1" 
									data-nav      ="<?php echo $column['content_view']['carousel']['arrows'] ? 'true' : 'false'; ?>" 
									data-dots     ="<?php echo $column['content_view']['carousel']['dots'] ? 'true' : 'false'; ?>" 
									data-resitems ="<?php echo $column['content_view']['carousel']['display']; ?>" 
									data-res      ="true" 
									data-margin   ="<?php echo $column['content_view']['carousel']['margin']; ?>"
									itemscope itemtype="http://schema.org/ImageGallery">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { ?>
									<div class="item">
										<?php include $this->rgen('imagegallery_item'); ?>
									</div>
									<?php } } ?>
								</div>
								<script type="text/javascript" ><!--
								$("#<?php echo $modid; ?> #carousel-<?php echo $modid.'_'.$i; ?>").css({ opacity: 0 });
								$(document).ready(function() {
									var obj = "#<?php echo $modid; ?> #carousel-<?php echo $modid.'_'.$i; ?>";
									var resObj = { <?php echo $this->rgen('factory')->scrollItems($column['content_view']['carousel']['display_items']); ?>	};
									setTimeout(function () { widgetCarousel(obj, resObj); }, 100);
								});
								//--></script>
								<?php } ?>


							</div>
							<?php  $i++; } ?>
						</div>
					<?php } ?>

				</div>
			</div>
			<?php if ($r) { ?>
			<div class="r-cl cl<?php echo $col_r; ?> t-xl12">
				<?php if (isset($modules['config']['right']['html'][$lng]) && $modules['config']['right']['html'][$lng] != '') { ?>
				<section class="mod-customhtml r-html"><?php echo html_entity_decode($modules['config']['right']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
				<?php } ?>
			</div>
			<?php } ?>
		</div>

		<?php if (isset($modules['config']['bottom']['html'][$lng]) && $modules['config']['bottom']['html'][$lng] != '' && $b) { ?>
		<section class="mod-customhtml b-html"><?php echo html_entity_decode($modules['config']['bottom']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
		<?php } ?>

	</div>
</div>
<script>
$(document).ready(function() {
	photoSwipe_fn('#<?php echo $modid; ?>');
});
</script>
<?php } } ?>