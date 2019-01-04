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
if (isset($modules['data'])) {
?>
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
							<?php foreach ($row['columns'] as $column) { ?>
							<div class="cl <?php echo $column['col_size'].' '.$column['cssclass']; ?>">

								<?php 
								/* Column titles
								------------------------*/ ?>
								<?php if (isset($column['title_status']) && $column['title_status'] == true) { ?>
								<h3 class="sub-mod-hd" style="<?php echo $column['title_css']; ?>"><?php echo html_entity_decode($column['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
								<?php } ?>
								
								<?php 
								/* Grid view
								------------------------*/
								if ($column['content_view']['view'] == 'grid') { 
									$eq_grids = isset($column['content_view']['grids']['classGroup']) ? 
												$column['content_view']['grids']['classGroup'] : 
												' eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10'; ?>
								<div class="contentblock-grid rw<?php echo $eq_grids; ?>">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { 
										$title_pos = isset($block['setting']['title_pos']) ? $block['setting']['title_pos'] : 'below';
									?><div class="cl">
										<?php include $this->rgen('ctn_block'.$block['setting']['style']); ?>
									</div>
									<?php } } ?>
								</div>
								<?php if (sizeof($column['content_items']) > 1) { ?>
								<script>
								jQuery(document).ready(function($) {
									equalH('#<?php echo $modid; ?> .contentblock-grid', '#<?php echo $modid; ?> .contentblock-grid > .cl');
								});
								</script>
								<?php } ?>
								<?php } ?>

								<?php 
								/* Scroll view
								------------------------*/
								if ($column['content_view']['view'] == 'carousel') { ?>
								<div 
									class         ="widget-carousel ctrl-b" 
									data-stpd     ="1" 
									data-nav      ="<?php echo $column['content_view']['carousel']['arrows'] ? 'true' : 'false'; ?>" 
									data-dots     ="<?php echo $column['content_view']['carousel']['dots'] ? 'true' : 'false'; ?>" 
									data-resitems ="<?php echo $column['content_view']['carousel']['display']; ?>" 
									data-res      ="true" 
									data-margin   ="<?php echo $column['content_view']['carousel']['margin']; ?>">
									<?php if (isset($column['content_items']) && sizeof($column['content_items']) > 0) { ?>
									<?php foreach ($column['content_items'] as $block) { 
										$title_pos = isset($block['setting']['title_pos']) ? $block['setting']['title_pos'] : 'below';
									?><div class="item">
										<?php include $this->rgen('ctn_block'.$block['setting']['style']); ?>
									</div>
									<?php } } ?>
								</div>
								<script type="text/javascript" ><!--
								$("#<?php echo $modid; ?> .widget-carousel").css({	opacity: 0 });
								$(document).ready(function() {
									var obj = "#<?php echo $modid; ?> .widget-carousel";
									var resObj = { <?php echo $this->rgen('factory')->scrollItems($column['content_view']['carousel']['display_items']); ?>	};
									setTimeout(function () { widgetCarousel(obj, resObj); }, 100);
								});
								//--></script>
								<?php } ?>

							</div>
							<?php } ?>
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