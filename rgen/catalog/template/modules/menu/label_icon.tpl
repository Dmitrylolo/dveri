<?php if ($menu['item_icon']) { 
$ico_style  = $menu['item_icon_position'] == 't' ? 'display: block; margin-right: 0px;' : null;
$ico_style .= $menu['item_icon_style'];
?>
	<?php if ($menu['item_icon']['type'] == 'ico') { ?>
	<i class="ico <?php echo $menu['item_icon']['icon']; ?>" style="<?php echo $menu['item_icon']['css'] . $ico_style; ?>"></i>	
	<?php } else { ?>
	<i class="img" style="<?php echo $menu['item_icon']['css'] . $ico_style; ?>"></i>
	<?php } ?>
<?php } ?>

<?php
if (isset($menu['label_data'])) { 
	if ($menu['label_data']['type'] == 'txt') { ?>
	<span 
		style="<?php echo $menu['label_data']['css'] . $menu['label_data']['top'] . $menu['label_data']['left']; ?>" 
		class="nav-lbl<?php echo isset($menu['label_data']['css_class']) ? ' '.$menu['label_data']['css_class'] : null; ?>">
		<i style="<?php echo $menu['label_data']['arrowcss']; ?>" class="fa fa-caret-down"></i>
		<?php echo html_entity_decode($menu['label_data']['text'][$lng], ENT_QUOTES, 'UTF-8'); ?>
	</span>
<?php } elseif($menu['label_data']['type'] == 'img' && $menu['label_data']['image'] != '') { ?>
	<span 
		style="<?php echo $menu['label_data']['top'] . $menu['label_data']['left'] . $menu['label_data']['img_w']; ?>"
		class="nav-lbl img-lbl<?php echo isset($menu['label_data']['css_class']) ? ' '.$menu['label_data']['css_class'] : null; ?>">
		<img src="<?php echo $menu['label_data']['image'] ?>" alt="label">
	</span>
<?php } } ?>