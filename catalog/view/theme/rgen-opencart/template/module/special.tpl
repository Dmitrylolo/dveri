<?php 
$rgen   = $this->rgen('settings');
$mod    = $rgen['ocmd_special'];
$modid  = 'oc-special-'.$this->rgen('factory')->uid();

?><div class="mod-wrp oc-special" id="<?php echo $modid; ?>">
	<?php include $this->rgen('oc_bfsl'); ?>
</div>
