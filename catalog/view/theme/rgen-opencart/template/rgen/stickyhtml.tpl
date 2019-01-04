<?php 
if (isset($modules)) { 
$rgen  = $this->rgen('settings');
$modid = $module_name.'-'.$this->rgen('factory')->uid(); ?>

<div id="<?php echo $modid; ?>" class="<?php echo $module_name . $module_class . $modules['cssclass'] .' sticky-mod sticky-'.$modules['position']; ?>" style="<?php echo $modules['top'].$modules['w'].$modules['css']; ?>">
	<div class="mod-out-wrp">
		<?php if ($modules['icon']['type'] == 'ico') { ?>
		<span class="sticky-handle vm"><i style="<?php echo $modules['icon']['css']; ?>" class="<?php echo $modules['icon']['icon']; ?>"></i></span>
		<?php } else { ?>
		<span class="sticky-handle vm"><i style="<?php echo $modules['icon']['css']; ?>"></i></span>
		<?php } ?>

		<div class="mod-wrp">
			<?php if ($modules['title_status']) { ?>
			<h3 class="mod-hd"><?php echo html_entity_decode($modules['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php } ?>
			<div class="mod-content">
				<?php if ($modules['html_status']) { ?>
				<section class="mod-customhtml"><?php echo html_entity_decode($modules['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
				<?php } ?>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() { fn_stickyhtml("#<?php echo $modid; ?>"); });
</script>
<?php } ?>