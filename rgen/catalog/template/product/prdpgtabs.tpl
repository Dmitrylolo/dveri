<?php  
$tab_list = array();
if (isset($pdpg_tabs['modules']) && sizeof($pdpg_tabs['modules']) > 0) {
	foreach ($pdpg_tabs['modules'] as $key => $value) {
		$mod_tabs = $this->rgen('factory')->node($value, 'modules/data', 0,0);
		if (sizeof($mod_tabs)) {
			foreach ($mod_tabs as $tb) {
				$tab_list[] = $tb;	
			}	
		}
	}
}
?>