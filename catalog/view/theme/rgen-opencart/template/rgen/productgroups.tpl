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
	<?php include $this->rgen('prdgroup_'.$settings['viewtype']); ?>
</div>
<?php } } ?>