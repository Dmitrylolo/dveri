<?php 
if (isset($modules)) {
$rgen      = $this->rgen('settings');
$modid     = $module_name.'-'.$this->rgen('factory')->uid();
$container = isset($data['settings']['container']) && $data['settings']['container'] == 'bx' || !isset($data['settings']['container']) ? ' container' : null;

$l         = $modules['left']['status'];
$m         = $modules['middle']['status'];
$r         = $modules['right']['status'];
$t         = $modules['top']['status'];
$b         = $modules['bottom']['status'];

$col_l     = isset($modules['left']['size']) && $l ? $modules['left']['size'] : 3;
$col_r     = isset($modules['right']['size']) && $r ? $modules['right']['size'] : 3;
$col_m     = isset($modules['middle']['size']) && $m ? $modules['middle']['size'] : 6; ?>

<div id="<?php echo $modid; ?>" class="<?php echo $module_name . $module_class; ?>">
	<div class="mod-wrp<?php echo $container; ?>">
		
		<?php 
		/* Common data
		------------------------*/ ?>
		<?php if (isset($modules['title'][$lng]) && $modules['title'][$lng] != '' && $modules['title_status']) { ?>
		<h3 class="mod-hd"><?php echo html_entity_decode($modules['title'][$lng], ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php } ?>
		
		<div class="mod-content">

			<?php if (isset($modules['top']['html'][$lng]) && $modules['top']['html'][$lng] != '' && $t) { ?>
			<section class="mod-customhtml t-html"><?php echo html_entity_decode($modules['top']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
			<?php } ?>
			
			<?php if ($l || $m || $r) { ?>
			<div class="rw <?php echo $modules['gt']; ?>">
				<?php if ($l) { ?>
				<div class="l-cl cl<?php echo $col_l; ?> t-xl12">
					<?php if (isset($modules['left']['html'][$lng]) && $modules['left']['html'][$lng] != '') { ?>
					<section class="mod-customhtml l-html"><?php echo html_entity_decode($modules['left']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
					<?php } ?>
				</div>	
				<?php } ?>
				
				<?php if ($m) { ?>
				<div class="m-cl cl<?php echo $col_m; ?> t-xl12">
					<?php if (isset($modules['middle']['html'][$lng]) && $modules['middle']['html'][$lng] != '') { ?>
					<section class="mod-customhtml m-html"><?php echo html_entity_decode($modules['middle']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
					<?php } ?>
				</div>
				<?php } ?>

				<?php if ($r) { ?>
				<div class="r-cl cl<?php echo $col_r; ?> t-xl12">
					<?php if (isset($modules['right']['html'][$lng]) && $modules['right']['html'][$lng] != '') { ?>
					<section class="mod-customhtml r-html"><?php echo html_entity_decode($modules['right']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
					<?php } ?>
				</div>
				<?php } ?>
			</div>
			<?php } ?>
			
			<?php if (isset($modules['bottom']['html'][$lng]) && $modules['bottom']['html'][$lng] != '' && $b) { ?>
			<section class="mod-customhtml b-html"><?php echo html_entity_decode($modules['bottom']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?></section>	
			<?php } ?>

		</div>
	</div>
</div>
<?php } ?>