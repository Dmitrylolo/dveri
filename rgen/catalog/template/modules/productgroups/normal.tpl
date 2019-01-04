<?php $prdgroup_id = 0; foreach ($modules['data'] as $module) { ?>
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
			<?php 
			/* Products data
			------------------------*/ ?>
			<?php if ($module['title_status']) { ?>
			<h3 class="sub-mod-hd"><?php echo html_entity_decode($module['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php } ?>
			
			<div class="mod-content">
				<?php 
				/* Grid view
				------------------------*/
				if ($module['prd_view'] == 'grid') { ?>
				<div class="rw<?php echo $module['grids']; ?>" id="grid-<?php echo $modid."_".$prdgroup_id; ?>">
					<?php if (isset($module['products']) && sizeof($module['products']) > 0) { ?>
					<?php foreach ($module['products'] as $product) { ?>
					<div class="cl<?php echo $module['h_counter'] ? ' h_counter' : null; ?>">
						<?php include $this->rgen($module['prd_style']); ?>
					</div>
					<?php } } ?>
				</div>
				<?php 
				if (strpos($module['grids'],' eq1') === false) { ?>
				<script>
				jQuery(document).ready(function($) {
					equalH('#<?php echo $modid; ?> #grid-<?php echo $modid."_".$prdgroup_id; ?>', '#<?php echo $modid; ?> #grid-<?php echo $modid."_".$prdgroup_id; ?> > .cl');
				});
				</script>
				<?php } ?>
				<?php } ?>

				<?php 
				/* Scroll view // data-widget   ="autoCarousel" 
				------------------------*/
				if ($module['prd_view'] == 'carousel') { ?>
				<div 
					id            ="carousel-<?php echo $modid."_".$prdgroup_id; ?>"
					class         ="widget-carousel ctrl-b" 
					data-stpd     ="1" 
					data-nav      ="<?php echo $module['carousel']['arrows'] ? 'true' : 'false'; ?>" 
					data-dots     ="<?php echo $module['carousel']['dots'] ? 'true' : 'false'; ?>" 
					data-resitems ="<?php echo $module['carousel']['display']; ?>" 
					data-res      ="true"  
					data-margin   ="<?php echo $module['carousel']['margin']; ?>">
					<?php if (isset($module['products']) && sizeof($module['products']) > 0) { ?>
					<?php foreach ($module['products'] as $product) { ?>
					<div class="item<?php echo $module['h_counter'] ? ' h_counter' : null; ?>">
						<?php include $this->rgen($module['prd_style']); ?>
					</div>
					<?php } } ?>
				</div>
				<script type="text/javascript" ><!--
				$("#<?php echo $modid; ?> #carousel-<?php echo $modid.'_'.$prdgroup_id; ?>").css({	opacity: 0 });
				$(document).ready(function() {
					var obj = "#<?php echo $modid; ?> #carousel-<?php echo $modid.'_'.$prdgroup_id; ?>";
					var resObj = { <?php echo $this->rgen('factory')->scrollItems($module['carousel']['display_items']); ?>	};
					var settings = { autoHeight: false }
					setTimeout(function () { widgetCarousel(obj, resObj, settings); }, 500);
				});
				//--></script>
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
<?php $prdgroup_id++; } ?>