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
		
		<div class="gridmanager-mod-rw rw <?php echo $modules['config']['gt']; ?>">
			<?php if ($l) { ?>
			<div class="l-cl cl<?php echo $col_l; ?> t-xl12">
				<?php if (isset($modules['config']['left']['html'][$lng]) && $modules['config']['left']['html'][$lng] != '') { ?>
				<section class="mod-customhtml l-html"><?php echo html_entity_decode($modules['config']['left']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
				<?php } ?>
			</div>	
			<?php } ?>
			
			<div class="m-cl cl<?php echo $col_m; ?> t-xl12">
				<div class="mod-content gridmanager-mod-content">
					
					<?php foreach ($modules['data'] as $row) { ?>
						<div class="rw <?php echo $row['row']['gutter'].' '.$row['row']['margin_b']; ?>">
							<?php foreach ($row['columns'] as $column) { ?>
							<div class="cl <?php echo $column['col_size'].$column['col_class']; ?>" style="<?php echo $column['col_style'].$column['col_bg']; ?>">
								<?php 
								foreach ($column['content_items'] as $mod_item) {
									if ($mod_item['node_type'] == 'mod') {
										echo isset($mod_item['cssclass']) && $mod_item['cssclass'] != '' ? '<div class="'.$mod_item['cssclass'].'">' : null;
										echo $mod_item['mod_data'];
										echo isset($mod_item['cssclass']) && $mod_item['cssclass'] != '' ? '</div>' : null;
									} else {
										echo isset($mod_item['cssclass']) && $mod_item['cssclass'] != '' ? '<div class="'.$mod_item['cssclass'].'">' : null;
										echo html_entity_decode($mod_item['html'][$lng], ENT_QUOTES, 'UTF-8');
										echo isset($mod_item['cssclass']) && $mod_item['cssclass'] != '' ? '</div>' : null;
									}
								} ?>
							</div>
							<?php } ?>
						</div>
					<?php } ?>
					<script>
					$("#<?php echo $modid; ?>").css({opacity: 0});
					jQuery(document).ready(function($) {
						$("#<?php echo $modid; ?>").animate({opacity: 1}, 1000, function () {
							equalH('#<?php echo $modid; ?> .gridmanager-mod-content > .rw', '#<?php echo $modid; ?> .gridmanager-mod-content > .rw > .cl');
						});
					});
					jQuery(window).resize(function($) {
						equalH('#<?php echo $modid; ?> .gridmanager-mod-content > .rw', '#<?php echo $modid; ?> .gridmanager-mod-content > .rw > .cl');
					});
					</script>
					
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