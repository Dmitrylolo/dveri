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
			------------------------*/
			?><div class="mod-content">
				
				<div class="tab-container widget-tab widget-tab-1" data-widget="autoTab">
					<ul class="tab-panel ul-reset">
						<?php foreach ($modules['data'] as $module) { ?>
						<li class="tab-item">
							<a><?php echo html_entity_decode($module['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></a>
						</li>
						<?php } ?>
					</ul>			
					<div class="tab-pane-wrp">
						<?php 
						$id = 0; 
						$view_type = 'grid';
						foreach ($modules['data'] as $module) { ?>
						<div class="tab-pane">
							<?php 
							/* Grid view
							------------------------*/
							if ($module['prd_view'] == 'grid') { 
							$view_type = 'grid'; ?>
							<div class="rw<?php echo $module['grids']; ?>" id="grid-<?php echo $modid."_".$id; ?>">
								<?php if (isset($module['products']) && sizeof($module['products']) > 0) { ?>
								<?php foreach ($module['products'] as $product) { ?>
								<div class="cl<?php echo $module['h_counter'] ? ' h_counter' : null; ?>">
									<?php include $this->rgen($module['prd_style']); ?>
								</div>
								<?php } } ?>
							</div>
							<script>
							jQuery(document).ready(function($) {
								equalH('#<?php echo $modid; ?> #grid-<?php echo $modid."_".$id; ?>', '#<?php echo $modid; ?> #grid-<?php echo $modid."_".$id; ?> > .cl');
							});
							</script>
							<?php } ?>

							<?php 
							/* Scroll view
							------------------------*/
							if ($module['prd_view'] == 'carousel') { 
							$view_type = 'carousel'; ?>
							<div 
								id            ="carousel-<?php echo $modid."_".$id; ?>"
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
							$("#<?php echo $modid; ?> .tab-container").on('click', '.tab-item a', function(event) {
								event.preventDefault();
								var obj = $(this).attr('href') + " .widget-carousel";
								var resObj = { <?php echo $this->rgen('factory')->scrollItems($module['carousel']['display_items']); ?>	};
								if (!$(obj).hasClass('owl-loaded')) { widgetCarousel(obj, resObj); };
							});
							$("#<?php echo $modid; ?> .tab-pane.active .widget-carousel").css({	opacity: 0 });
							$(document).ready(function() {
								var obj = "#<?php echo $modid; ?> .tab-pane.active .widget-carousel";
								var resObj = { <?php echo $this->rgen('factory')->scrollItems($module['carousel']['display_items']); ?>	};
								var settings = { autoHeight: false };
								setTimeout(function () { widgetCarousel(obj, resObj, settings); }, 500);
							});
							//--></script>
							<?php } ?>
						</div>
						<?php $id++; } ?>
					</div>
				</div>
				
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
