<?php 
if (isset($modules)) {
if (isset($modules['data'])) {
	
$rgen      = $this->rgen('settings');

$lng = $rgen['lng'];
$lng_data 			= $rgen['language_data'];
$button_cart		= $lng_data['button_cart'];
$button_wishlist	= $lng_data['button_wishlist'];
$button_compare		= $lng_data['button_compare'];
$button_more 		= $lng_data['button_more'];
$text_tax			= $lng_data['text_tax'];

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
------------------------*/ ?>
<div id="<?php echo $modid; ?>" class="<?php echo $module_name . $module_class; ?>">
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
							<div class="cl <?php echo $column['col_size']; ?><?php echo isset($column['content_view']['cssclass']) && $column['content_view']['cssclass'] != '' ? ' '.$column['content_view']['cssclass']:null; ?>">
								
								<?php 
								/* Column titles
								------------------------*/ ?>
								<?php if (isset($column['title_status']) && $column['title_status'] == true) { ?>
								<h3 class="sub-mod-hd" style="<?php echo $column['title_css']; ?>"><?php echo html_entity_decode($column['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
								<?php } ?>

								<?php 
								/* Grid view
								------------------------*/
								if ($column['content_view']['view'] == 'grid' && $column['content_view']['style'] != 2 && $column['content_view']['style'] != 3) { 
									$eq_grids = isset($column['content_view']['grids']['classGroup']) ? $column['content_view']['grids']['classGroup'] : ' eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10'; ?>
									<div class="dealshowcase-grid rw<?php echo $eq_grids; ?>" id="dealshowcase-grid-<?php echo $i; ?>">
										<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
										<?php foreach ($column['content_items'] as $block) { ?>
											<?php $product = $block['product_data']; ?>
											<div class="cl">
												<?php include $this->rgen('deals_block'.$column['content_view']['style']); ?>
											</div>
										<?php } } ?>
									</div>
									<?php if (sizeof($column['content_items']) > 1) { ?>
									<script>
									jQuery(document).ready(function($) {
										equalH('#<?php echo $modid; ?> #dealshowcase-grid-<?php echo $i; ?>', '#<?php echo $modid; ?> #dealshowcase-grid-<?php echo $i; ?> > .cl');
									});
									</script>
									<?php } ?>
								<?php } ?>

								<?php 
								/* Scroll view
								------------------------*/
								if ($column['content_view']['view'] == 'carousel' && $column['content_view']['style'] != 2 && $column['content_view']['style'] != 3) { ?>
								<div 
									class         ="widget-carousel ctrl-b" 
									id            ="dealshowcase-carousel-<?php echo $i; ?>"
									data-stpd     ="1" 
									data-nav      ="<?php echo $column['content_view']['carousel']['arrows'] ? 'true' : 'false'; ?>" 
									data-dots     ="<?php echo $column['content_view']['carousel']['dots'] ? 'true' : 'false'; ?>" 
									data-resitems ="<?php echo $column['content_view']['carousel']['display']; ?>" 
									data-res      ="true" 
									data-margin   ="<?php echo $column['content_view']['carousel']['margin']; ?>">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { ?>
										<?php if (isset($block['product_data'])) { ?>
											<?php $product = $block['product_data']; ?>
											<div class="item">
												<?php include $this->rgen('deals_block'.$column['content_view']['style']); ?>
											</div>
										<?php } ?>
									<?php } } ?>
								</div>
								<script type="text/javascript" ><!--
								$("#<?php echo $modid; ?> #dealshowcase-carousel-<?php echo $i; ?>").css({	opacity: 0 });
								$(document).ready(function() {
									var obj = "#<?php echo $modid; ?> #dealshowcase-carousel-<?php echo $i; ?>";
									var resObj = { <?php echo $this->rgen('factory')->scrollItems($column['content_view']['carousel']['display_items']); ?>	};
									var settings = {
										autoplay           : <?php echo $column['content_view']['carousel']['autoplay'] ? 'true' : 'false'; ?>,
										autoplayTimeout    : <?php echo $column['content_view']['carousel']['timeout']; ?>,
										autoplayHoverPause : <?php echo $column['content_view']['carousel']['stoponhover'] ? 'true' : 'false'; ?>,
										loop               : <?php echo $column['content_view']['carousel']['loop'] && sizeof($column['content_items']) > 1 ? 'true' : 'false'; ?>,
										autoHeight         : false
									}
									setTimeout(function () { widgetCarousel(obj, resObj, settings); }, 500);
								});
								//--></script>
								<?php } ?>

								<?php 
								/* Slider view
								------------------------*/
								if($column['content_view']['style'] == 2){ 
								$slideshow = $column['content_view']['slider'];
								
								?><div 
									class         ="widget-carousel ctrl-b owl-slideshow dots-typ1" 
									id            ="dealshowcase-<?php echo $i; ?>" 
									data-items    ="1"
									data-stpd     ="0" 
									data-nav      ="<?php echo $slideshow['arrows'] ? 'true' : 'false'; ?>" 
									data-dots     ="<?php echo $slideshow['dots'] ? 'true' : 'false'; ?>" 
									data-res      ="false" 
									data-margin   ="0">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { ?>
										<?php if (isset($block['product_data'])) { ?>
											<?php $product = $block['product_data']; ?>
											<div class="item">
												<?php include $this->rgen('deals_block'.$column['content_view']['style']); ?>
											</div>
										<?php } ?>
									<?php } } ?>
								</div>
								<script type="text/javascript" ><!--
								$("#<?php echo $modid; ?> #dealshowcase-<?php echo $i; ?>").css({ opacity: 0 });
								$(document).ready(function() {
									var obj = "#<?php echo $modid; ?> #dealshowcase-<?php echo $i; ?>";
									var resObj = {};
									var settings = {
										animOut            : '<?php echo $slideshow["animOut"]; ?>',
										animIn             : '<?php echo $slideshow["animIn"]; ?>',
										autoplay           : <?php echo $slideshow['autoplay'] ? 'true' : 'false'; ?>,
										autoplayTimeout    : <?php echo $slideshow['timeout']; ?>,
										autoplayHoverPause : <?php echo $slideshow['stoponhover'] ? 'true' : 'false'; ?>,
										loop               : <?php echo $slideshow['loop'] && sizeof($column['content_items']) > 1 ? 'true' : 'false'; ?>,
										autoHeight         : true,
										center             : false
									}
									setTimeout(function () { widgetCarousel(obj, resObj, settings); }, 100);
								});
								//--></script>
								<?php } ?>


								<?php 
								/* Slide view
								------------------------*/
								if ($column['content_view']['style'] == 3) { ?>
								<div 
									class         ="center-zoom widget-carousel ctrl-b owl-slideshow dots-typ1" 
									id            ="dealshowcase-carousel-<?php echo $i; ?>"
									data-items    ="2" 
									data-stpd     ="0" 
									data-nav      ="<?php echo $column['content_view']['carousel']['arrows'] ? 'true' : 'false'; ?>" 
									data-dots     ="<?php echo $column['content_view']['carousel']['dots'] ? 'true' : 'false'; ?>" 
									data-resitems ="<?php echo $column['content_view']['carousel']['display']; ?>" 
									data-res      ="true" 
									data-margin   ="<?php echo $column['content_view']['carousel']['margin']; ?>">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { ?>
										<?php if (isset($block['product_data'])) { ?>
											<?php $product = $block['product_data']; ?>
											<div class="item">
												<?php include $this->rgen('deals_block'.$column['content_view']['style']); ?>
											</div>
										<?php } ?>
									<?php } } ?>
								</div>
								<script type="text/javascript" ><!--
								$("#<?php echo $modid; ?> #dealshowcase-carousel-<?php echo $i; ?>").css({	opacity: 0 });
								$(document).ready(function() {
									var obj = "#<?php echo $modid; ?> #dealshowcase-carousel-<?php echo $i; ?>";
									var resObj = { <?php echo $this->rgen('factory')->scrollItems($column['content_view']['carousel']['display_items']); ?>	};
									var settings = {
										autoplay           : <?php echo $column['content_view']['carousel']['autoplay'] ? 'true' : 'false'; ?>,
										autoplayTimeout    : <?php echo $column['content_view']['carousel']['timeout']; ?>,
										autoplayHoverPause : <?php echo $column['content_view']['carousel']['stoponhover'] ? 'true' : 'false'; ?>,
										loop               : <?php echo $column['content_view']['carousel']['loop'] && sizeof($column['content_items']) > 1 ? 'true' : 'false'; ?>,
										autoHeight         : true,
										center             : true
									}
									setTimeout(function () { widgetCarousel(obj, resObj, settings); }, 100);
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

<?php } } ?>