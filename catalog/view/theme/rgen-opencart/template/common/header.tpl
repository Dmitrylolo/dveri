<?php 
if ($this->registry->get('rgen_check') === false) {
	echo $this->registry->get('rgen_error');
	exit();
}
$route  = isset($this->registry->get('request')->get['route']) ? $this->registry->get('request')->get['route'] : 'common/home';
/* Body classes
------------------------*/
switch ($route) {
	case 'product/product':
		$body_class_pg = ' product_pg';
		break;
	case 'product/category':
		$body_class_pg = ' category_pg';
		break;
	case 'information/contact':
		$body_class_pg = ' contact_pg';
		break;
	case 'product/search':
		$body_class_pg = ' search_pg';
		break;
	case 'information/sitemap':
		$body_class_pg = ' sitemap_pg';
		break;
	default:
		$body_class_pg = '';
		break;
}

$rgen   = $this->rgen('settings');
$htmcls = $this->rgen('factory')->device;
$htmcls.= $rgen['responsive_status'] ? ' res_y' : ' res_n';
?>
<!-- <?php echo 'v'.RGEN_VER; ?> -->
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="<?php echo $htmcls; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<?php if ($rgen['responsive_status']) { ?>
<meta name="viewport" content="width=device-width, initial-scale=1">	
<?php } ?>
<title><?php echo $title; ?>. Недорого купить в Киеве. Интернет магазин.</title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?> Двери - Механик Групп - Тел: (044) 332-99-20, (067) 329-59-87. Лучшие цены. Гарантия. Доставка. Описание. Характеристики." />
<?php } else {?>
<meta name="description" content="<?php echo $title; ?>. Двери - Механик Групп - Тел: (044) 332-99-20, (067) 329-59-87. Лучшие цены. Гарантия. Доставка. Описание. Характеристики." />
<?php }?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php 
/* ALL CSS FILES
**************************/ 
// Theme customization CSS
$customizeCSS = FILE_CONFIG_STYLE.'?'.time();
if (!$rgen['cssminify']) {
	$this->rgen('assets')->setCss($customizeCSS);
}

foreach ($styles as $style) {
	$this->rgen('assets')->setCss($style['href']);
}
// Responsive CSS
if ($rgen['responsive_status']) {
	$this->rgen('assets')->setCss("catalog/view/theme/".DIR_THEME."/stylesheet/responsive.css");
}


// Custom CSS files
if ($rgen['cssfile_status']) {
foreach ($rgen['cssfiles'] as $cssfile) {
	$this->rgen('assets')->setCss($cssfile['file']);
} }

// All CSS files
$cssFiles = $this->rgen('assets')->cssFiles;

// Minify CSS files
if ($rgen['cssminify']) {
$cssFileKey                      = md5(implode("", $cssFiles));
$cssminFiles                     = $this->rgen('assets')->cssMinify($cssFiles, '', $cssFileKey);
$cssminFiles[md5($customizeCSS)] = $customizeCSS;
foreach ($cssminFiles as $css) { ?>
<link href="<?php echo $css ?>" rel="stylesheet">
<?php } } else {
foreach ($cssFiles as $css) { ?>
<link href="<?php echo $css ?>" rel="stylesheet">
<?php } }

/* ALL JS FILES
**************************/ 
foreach ($scripts as $script) {
	$this->rgen('assets')->setJs($script);
}
// Responsive JS
if ($rgen['responsive_status']) {
	$this->rgen('assets')->setJs("rgen/lib/responsive/matchMedia.js");
	$this->rgen('assets')->setJs("rgen/lib/responsive/enquire.min.js");
	$this->rgen('assets')->setJs("catalog/view/theme/".DIR_THEME."/js/responsive.js");
}

// Custom JS files
if ($rgen['jsfile_status']) {
foreach ($rgen['jsfiles'] as $jsfile) {
	$this->rgen('assets')->setJs($jsfile['file']);
} }

// All JS files
$jsFiles = $this->rgen('assets')->jsFiles;

// Minify JS files
if ($rgen['jsminify']) {
$jsFileKey  = md5(implode("", $jsFiles));
$jsminFiles = $this->rgen('assets')->jsMinify($jsFiles, $jsFileKey);
foreach ($jsminFiles as $js) { ?>
<script type="text/javascript" src="<?php echo $js; ?>"></script>
<?php } } else {
foreach ($jsFiles as $js) { ?>
<script type="text/javascript" src="<?php echo $js; ?>"></script>
<?php } } ?>

<?php 
// Custom CSS input code
if ($rgen['css_status']) { echo '<style>'.html_entity_decode($rgen['csscode'], ENT_QUOTES, 'UTF-8').'</style>'; } ?>

<?php echo $google_analytics; ?>

</head>
<?php 
$body_class  = isset($class) ? $class : '';
$body_class .= $route == 'common/home' ? ' home_pg' : ' inner_pg';
?>
<body class="<?php echo $body_class . $body_class_pg ; ?>">
<div class="main-wrapper<?php echo $rgen['wide_class']; ?>">

<?php 
/* TOPBAR
**************************/
$topbar   = isset($rgen['topbar_style']) ? $rgen['topbar_style'] : '1';
$topbar_w = isset($rgen['topbar_layout']) ? $rgen['topbar_layout'].' ' : 'bx ';
$logo_in  = isset($rgen['topbar'.$topbar.'_general']['logo_in_menu']) ? $rgen['topbar'.$topbar.'_general']['logo_in_menu'] : 'y';
$logo_w   = isset($rgen['topbar'.$topbar.'_general']['logo_w']) ? $rgen['topbar'.$topbar.'_general']['logo_w'] : 190; ?>
<header class="topbar-<?php echo $topbar; ?>">
	<?php include $this->rgen('topbar'.$topbar); ?>

	<?php 
	/* OPENCART DEFAULT MENU
	**************************/
	if ($categories || isset($main_menu)) { ?>
	<div id="menu" class="out-wrapper menu-wrp<?php echo $rgen['wide_class']; ?><?php echo !$main_menu ? ' oc-default' : null;  ?>">
		<div id="menucontainer" class="container">
			<div class="nav-table">
				<?php if ($logo_in == 'y') { ?>
				<section class="logo-wrp" data-w="<?php echo $logo_w; ?>">
					<div id="logo">
						<?php if ($logo) { ?>
						<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
						<?php } else { ?>
						<h1><a href="<?php echo $home; ?>">Интернет магазин дверей Киев.</a></h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a>
						<?php } ?>
                        
					</div>
				</section>
				<?php } ?>
				<section class="nav-wrp">
					<?php if (!$main_menu) { ?>
					<nav id="oc-default-menu" class="rg-nav-wrp menu-left">
						<div class="rg-nav-handle"><i class="fa fa-bars"></i></div>
						<ul class="rg-nav">
							<?php foreach ($categories as $category) { ?>
								<?php if ($category['children']) { ?>
								<li>
									<a class="main-item" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
									<div class="sub<?php echo $category['column'] > 1 ? ' col-menu' : null; ?>">
										<div class="nav-sub-col">
										<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
										<ul class="nav-fly">
											<?php foreach ($children as $child) { ?>
											<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
											<?php } ?>
										</ul>
										<?php } ?>
										</div>
										<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
									</div>
								</li>
								<?php } else { ?>
								<li><a class="main-item" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
								<?php } ?>
							<?php } ?>
						</ul>
					</nav>
					<script>
					jQuery(document).ready(function($) {
						$('#oc-default-menu').rgenmenu();
					});
					</script>
					<?php } else { ?>
					<?php echo $main_menu; ?>
					<?php } ?>
				</section>
			</div>
			

		</div>
	</div>

	<?php } ?>
	
	<?php if ($route != 'common/home' && $rgen['page_hd_style'] == 1) { ?>
	<div class="<?php echo $topbar_w; ?>breadcrumb-wrp out-wrapper">
		<div class="container">
		</div>
	</div>
	<?php } ?>

</header>
<?php 
/* PAGE HEADER OUT SIDE CONTAINER
**************************/ ?>
<?php if ($route != 'common/home' && $rgen['page_hd_pos'] == 'out') { ?>
<div class="page-head-out-wrp"></div>
<?php } ?>

<?php 
/* PLACE - SLIDE SHOW
**************************/ ?>
<div class="place_slideshow"><?php echo isset($pos_ss) ? $pos_ss : null; ?></div>

<?php 
/* PLACE - TOP UPPER
**************************/ ?>
<div class="place_topupper"><?php echo isset($top_upper) ? $top_upper : null; ?></div>

<?php 
/* PLACE - TOP - LEFT, MIDDLE, RIGHT
**************************/ ?>
<div class="out-wrapper<?php echo $rgen['wide_class']; ?>">
	<div class="container">
		<div class="rw gt40">
			<?php 
				if ((isset($top_left) && $top_left != '') && (isset($top_right) && $top_right != '')) {
					$mid_cls = ' cl6 d-xl6 t-xl12 m-xl12 m-sm12 m-xs12 ';
				} elseif ( ($top_left == '' && $top_right != '') || ($top_left != '' && $top_right == '') ){
					$mid_cls = ' cl9 d-xl9 t-xl12 m-xl12 m-sm12 m-xs12 ';
				} else {
					$mid_cls = ' cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12 ';
				}
			?>
			<?php if (isset($top_left) && $top_left != '') { ?>
			<div class="place_topleft cl3 d-xl3 t-xl12 m-xl12 m-sm12 m-xs12"><?php echo $top_left; ?></div>
			<?php } ?>

			<?php if (isset($top_middle) && $top_middle != '') { ?>
			<div class="place_topmiddle<?php echo $mid_cls; ?>"><?php echo $top_middle; ?></div>
			<?php } ?>

			<?php if (isset($top_right) && $top_right != '') { ?>
			<div class="place_topright cl3 d-xl3 t-xl12 m-xl12 m-sm12 m-xs12"><?php echo $top_right; ?></div>
			<?php } ?>
		</div>
	</div>
</div>

<?php 
/* PLACE - TOP LOWER
**************************/ ?>
<div class="place_toplower"><?php echo isset($top_lower) ? $top_lower : null; ?></div>