<?php 
$rgen   = $this->rgen('settings');
$mod    = $rgen['ocmd_best'];
$modid  = 'oc-best-'.$this->rgen('factory')->uid();

?><div class="mod-wrp oc-best" id="<?php echo $modid; ?>">
	<?php include $this->rgen('oc_bfsl'); ?>
</div>
