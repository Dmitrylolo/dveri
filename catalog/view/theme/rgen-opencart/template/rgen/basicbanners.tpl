<?php 
if (isset($modules)) {
$rgen         = $this->rgen('settings');
$modid        = 'rgen-basicbanners-'.$this->rgen('factory')->uid();
$title_status = isset($modules['config']['title_status']) ? $modules['config']['title_status'] : true;
$html_status  = isset($modules['config']['html_status']) ? $modules['config']['html_status'] : true;
$container = isset($data['settings']['container']) && $data['settings']['container'] == 'bx' || !isset($data['settings']['container']) ? ' container' : null;

/* Normal
------------------------*/ ?>
<div id="<?php echo $modid; ?>" class="rgen-basicbanners<?php echo $module_class; ?>">
	<div class="mod-wrp<?php echo $container; ?>">
		<?php if (isset($modules['config']['title'][$lng]) && $modules['config']['title'][$lng] != '' && $title_status) { ?>
		<h3 class="mod-hd"><?php echo html_entity_decode($modules['config']['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>	
		<?php } ?>
		
		<?php if (isset($modules['config']['html'][$lng]) && $modules['config']['html'][$lng] != '' && $html_status) { ?>
		<section class="mod-customhtml"><?php echo html_entity_decode($modules['config']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
		<?php } ?>

		<div class="mod-content">
			<?php 
			/* Grid view
			------------------------*/
			if ($settings['viewtype'] == 'grid') { ?>
			<div class="rw <?php echo $settings['grids']['classGroup']; ?>">
				<?php if (isset($modules['data']) && sizeof($modules['data']) > 0) { 
				foreach ($modules['data'] as $banner) { ?>
				<div class="cl">
					<?php include $this->rgen('basicbanners_data'); ?>
				</div>
				<?php } } ?>
			</div>
			<?php } else {

			/* Carousel view
			------------------------*/ ?>
			<div 
				class="widget-carousel ctrl-b" 
				data-stpd="1" 
				data-resitems="<?php echo $settings['carousel']['item_display']; ?>" 
				data-res="true" 
				data-margin="<?php echo $settings['carousel']['item_margin']; ?>"
				<?php echo $settings['carousel']['arrows'] ? ' data-nav="true"' : ' data-nav="false"' ; ?>
				<?php echo $settings['carousel']['dots'] ? ' data-dots="true"' : ' data-dots="false"' ; ?>>
				<?php if (isset($modules['data']) && sizeof($modules['data']) > 0) { 
				foreach ($modules['data'] as $banner) { ?>
				<div class="cl">
					<?php include $this->rgen('basicbanners_data'); ?>
				</div>
				<?php } } ?>
			</div>

			<script type="text/javascript" ><!--
			$("#<?php echo $modid; ?> .widget-carousel").css({	opacity: 0 });
			$(document).ready(function() {
				var obj = "#<?php echo $modid; ?> .widget-carousel";
				var resObj = { <?php echo $this->rgen('factory')->scrollItems($settings['carousel']['display_items']); ?>	};
				setTimeout(function () { widgetCarousel(obj, resObj); }, 100);
			});
			//--></script>
			<?php } ?>
		</div>

	</div>
</div>
<?php } ?>