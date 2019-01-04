<?php echo $header; ?><?php if( ! empty( $mfilter_json ) ) { echo '<div id="mfilter-json" style="display:none">' . base64_encode( $mfilter_json ) . '</div>'; } ?>
<?php
$route    = isset($this->registry->get('request')->get['route']) ? $this->registry->get('request')->get['route'] : 'common/home';
$lng_data = $this->rgen('settings'); 
$lng_data = $lng_data['language_data'];
$rgen     = $this->rgen('settings'); 

if ($route != 'common/home' && $rgen['page_hd_pos'] == 'out') { ?>
<div class="page-head page-head-<?php echo $rgen['page_hd_style']; ?>" id="pg-hd-out">
	<div class="container">
		<h1><strong><?php echo $heading_title; ?></strong></h1>
		<div class="breadcrumb">
			<?php
			if ($rgen['breadcrumb_home'] == 'lnk') {
				$breadcrumbs[0]['text'] = 'Главная';
			}else{
				$breadcrumbs[0]['text'] = 'Главная';
			}


			foreach ($breadcrumbs as $i=> $breadcrumb){ ?>
			<?php if ($i+1<count($breadcrumbs)) { ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> 
			<?php } else { ?>
			<?php echo $breadcrumb['text']; ?>
			<?php } ?>

			<b>&raquo;</b>
			<?php } ?>
		</div>
	</div>	
</div>
<?php } ?>

<div class="out-wrapper content-area<?php echo $rgen['wide_class']; ?>">
<div class="container">
	
	<?php if ($route != 'common/home' && $rgen['page_hd_pos'] == 'in') { ?>
	<div class="page-head page-head-<?php echo $rgen['page_hd_style']; ?>">
		<h1><strong><?php echo $heading_title; ?></strong></h1>
		<div class="breadcrumb">
			<?php
			if ($rgen['breadcrumb_home'] == 'lnk') {
				$breadcrumbs[0]['text'] = $lng_data['text_home'];
			}else{
				$breadcrumbs[0]['text'] = 'Главная';
			}
			foreach ($breadcrumbs as $breadcrumb) { ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<b>&raquo;</b>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	
	<!-- Page layout -->
	<section class="layout-wrp ly-gt">
		<?php 
		$set = $this->rgen('rgenSettings');
		$column_left ? $set->setSettings('col_left_status', true) : $set->setSettings('col_left_status', false);
		$column_right ? $set->setSettings('col_right_status', true) : $set->setSettings('col_right_status', false);
		
		if ($column_left && $column_right) { ?>
		<?php $class = 'ly-body-3'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'ly-body-2'; ?>
		<?php } else { ?>
		<?php $class = 'ly-body-1'; ?>
		<?php } ?>

		<?php echo $column_left; ?>
        
		<div id="content" class="<?php echo $class; ?>">
			<?php echo $content_top; ?><div id="mfilter-content-container">

			<div id="mfilter-content-container" class="page-content">