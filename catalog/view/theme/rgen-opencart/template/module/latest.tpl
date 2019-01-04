<?php 
$rgen   = $this->rgen('settings');
$mod    = $rgen['ocmd_latest'];
$modid  = 'oc-latest-'.$this->rgen('factory')->uid();

?><div class="mod-wrp oc-latest" id="<?php echo $modid; ?>">
	<?php include $this->rgen('oc_bfsl'); ?>
</div>