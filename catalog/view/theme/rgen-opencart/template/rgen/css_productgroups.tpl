<?php 
function productgroups($arr, $prefix='') {
	echo isset($arr['main']) ? 
	$prefix.' { '. $arr['main'] . ' }' : '';

	echo isset($arr['main_bg']) ? 
	$prefix.' { '. $arr['main_bg'] . ' }' : '';

	echo isset($arr['mod_wrp']) ? 
	$prefix.' .mod-wrp { '. $arr['mod_wrp'] . ' }' : '';

	echo isset($arr['mod_content']) ? 
	$prefix.' .mod-content { '. $arr['mod_content'] . ' }' : '';

	echo isset($arr['mod_hd']) ? 
	$prefix.' .mod-hd { '. $arr['mod_hd'] . ' }' : '';

	echo isset($arr['mod_sub_hd']) ? 
	$prefix.' .sub-mod-hd { '. $arr['mod_sub_hd'] . ' }' : '';

	/* Custom HTML
	------------------------*/
	echo isset($arr['t_html']) ? 
	$prefix.' .t-html { '. $arr['t_html'] . ' }' : '';

	echo isset($arr['b_html']) ? 
	$prefix.' .b-html { '. $arr['b_html'] . ' }' : '';
	
	echo isset($arr['l_html']) ? 
	$prefix.' .l-html { '. $arr['l_html'] . ' }' : '';
	
	echo isset($arr['r_html']) ? 
	$prefix.' .r-html { '. $arr['r_html'] . ' }' : '';

	/* Custom HTML grids
	------------------------*/
	echo isset($arr['rw']) ? 
	$prefix.' .mod-wrp > .rw { '. $arr['rw'] . ' }' : '';

	echo isset($arr['l_cl']) ? 
	$prefix.' .mod-wrp > .rw > .l-cl { '. $arr['l_cl'] . ' }' : '';

	echo isset($arr['m_cl']) ? 
	$prefix.' .mod-wrp > .rw > .m-cl { '. $arr['m_cl'] . ' }' : '';

	echo isset($arr['r_cl']) ? 
	$prefix.' .mod-wrp > .rw > .r-cl { '. $arr['r_cl'] . ' }' : '';

	/* Tab 1
	------------------------*/
	echo isset($arr['tab1']['container']) ? 
	$prefix.' .widget-tab-1 { '. $arr['tab1']['container'] . ' }' : '';

	echo isset($arr['tab1']['panel']) ? 
	$prefix.' .widget-tab-1 > .tab-panel { '. $arr['tab1']['panel'] . ' }' : '';

	echo isset($arr['tab1']['item']) ? 
	$prefix.' .widget-tab-1 > .tab-panel > .tab-item { '. $arr['tab1']['item'] . ' } '.
	$prefix.' .widget-tab-1 > .tab-panel > .tab-item > a { font-weight: inherit; }' : '';

	echo isset($arr['tab1']['item_a']) ? 
	$prefix.' .widget-tab-1 > .tab-panel > .tab-item > a { font-weight: inherit; '. $arr['tab1']['item_a'] . ' }' : '';

	echo isset($arr['tab1']['item_active']) ? 
	$prefix.' .widget-tab-1 > .tab-panel > .tab-item.active { '. $arr['tab1']['item_active'] . ' }' : '';

	echo isset($arr['tab1']['item_active_a']) ? 
	$prefix.' .widget-tab-1 > .tab-panel > .tab-item.active > a { '. $arr['tab1']['item_active_a'] . ' }' : '';

	echo isset($arr['tab1']['pane_wrp']) ? 
	$prefix.' .widget-tab-1 .tab-pane-wrp { '. $arr['tab1']['pane_wrp'] . ' }' : '';

	echo isset($arr['tab1']['pane']) ? 
	$prefix.' .widget-tab-1 .tab-pane-wrp > .tab-pane { '. $arr['tab1']['pane'] . ' }' : '';

	echo isset($arr['tab1']['pane_active']) ? 
	$prefix.' .widget-tab-1 .tab-pane-wrp > .tab-pane.active { '. $arr['tab1']['pane_active'] . ' }' : '';

	/* Product blocks
	------------------------*/
	if (isset($arr['prd_block1'])) {
		prd1($arr['prd_block1'], $prefix.' ');	
	}
	if (isset($arr['prd_block2'])) {
		prd2($arr['prd_block2'], $prefix.' ');
	}
	if (isset($arr['prd_small1'])) {
		smallprd1($arr['prd_small1'], $prefix.' ');
	}
	if (isset($arr['prd_small2'])) {
		smallprd2($arr['prd_small2'], $prefix.' ');
	}
	
	
	
	
}
?>