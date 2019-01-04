<?php 
if ($part[1] === 'gridmanager') {
	$module_settings      = $setting;
}else{
	$module_settings      = $this->rgen->storage->get('modules_data', $part[0].'_set');
	$module_settings      = $module_settings[$part[1]]['data'][0];	
}

$module               = $this->rgen->storage->get('modules_data', $part[0]);
$module_common        = $factory->node($module, $part[2].'/common', 0, 0);
$module_data          = $factory->node($module, $part[2].'/data', 0, 0);

$data['lng']          = $this->config->get('config_language_id');
$data['module_name']  = 'rgen-'.$module_key;
$data['module_id']    = $part[1];
$data['module_class'] = ' '.$module_key.'-'.$part[2];
$data['settings']     = $module_settings;