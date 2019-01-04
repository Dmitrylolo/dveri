<?php 
require_once(DIR_SYSTEM . '../rgen/system/config.php');

$theme_check = false;
$err_msg  = '<div style="font-family:arial; font-size:16px; line-height:2; color:#7c4a4a; padding:20px; background:#ffdbdb; border:1px solid #e06b6b; border-radius:5px; width:600px; margin:30px auto;">';
$err_msg .= 'Theme module not installed. <br><ul>';
$err_msg .= '<li>Please install theme module <strong>R.Gen - OpenCart</strong> from<br><strong>Admin > Extensions > Modules</strong>.</li>';
$err_msg .= '<li>Than go to <strong>Extensions > Modifications</strong> and click on the<br><strong>Blue Refresh button (top right corner)</strong> to apply theme changes.';
$err_msg .= 'Theme will not work without Modifications changes.</li>';
$err_msg .= '</ul></div>';
$err_msg .= '</div>';

if ($this->registry->get('config')->get('config_template') == DIR_THEME) {

	/* Check theme database
	**************************/ 
	$db_tbls = array('rgen_theme', 'rgen_modules', 'rgen_settings');
	foreach ($db_tbls as $key => $value) {
		$result = $this->registry->get('db')->query("SHOW TABLES LIKE '".DB_PREFIX.$value."'")->num_rows > 0 ? 1 : 0;
		$checklist[$value] = $result;
	}
	$theme_check = array_sum($checklist) === count($db_tbls) ? true : false;

	if ($theme_check) {
		$this->registry->set('rgen_check', true);
		
		require_once(RGEN_APP);
		
		$rgen = new rgen();
		$this->registry->set('rgen', $rgen);

		// Admin config file
		//$rgen->admin_config = DIR_SYSTEM.'../rgen/system/admin_config.php';

		$rgen->rgenConfig   = new rgen_config($this->registry);
		$rgen->rgenSettings = new settings();
		$rgen->storage      = new storage();
		$rgen->assets       = new assets($this->registry);
		$rgen->factory      = new factory($this->registry);
		$rgen->processor    = new processor();
		$rgen->route        = isset($this->registry->get('request')->get['route']) ? $this->registry->get('request')->get['route'] : 'common/home';
		$rgen->dir          = DIR_THEME;
		$rgen->tpl          = 'catalog/view/theme/'.$rgen->dir.'/';

		// Setup partials for theme layout
		if (defined('HTTP_CATALOG') == false) {
			$p = json_decode(file_get_contents(FILE_FRONT_PARTIALS));
			if(class_exists('VQMod')) {
				foreach ($p as $key => $value) { $rgen->{$key} = VQMod::modCheck(DIR_SYSTEM.'../'.$value); }
			} else { 
				foreach ($p as $key => $value) { $rgen->{$key} = DIR_SYSTEM.'../'.$value; }
			}

			// Pre actions 
			$this->execute(new Action('rgen/factory'));
			$this->execute(new Action('rgen/settings'));
			$this->execute(new Action('rgen/assets'));
		}

		$admin_p = json_decode(file_get_contents(FILE_ADMIN_PARTIALS));
		if(class_exists('VQMod')) {
			foreach ($admin_p as $key => $value) { $rgen->{'admin_'.$key} = VQMod::modCheck($value); }
		} else {
			foreach ($admin_p as $key => $value) { $rgen->{'admin_'.$key} = $value; }
		}

		//$this->execute(new Action('common/rgen-positions/main_menu'));

		// Set settings
		$rgen->settings    = $rgen->rgenSettings->st_data;
		
	}else{

		$this->registry->set('rgen_check', false);
		$this->registry->set('rgen_error', $err_msg);
	}
}

?>