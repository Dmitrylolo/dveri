<?php 
include DIR_SYSTEM.$this->rgen('admin_layout_header');//$layout_header;
?>

<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
	<button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<form action="<?php //echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bestseller" class="form-horizontal">
	<div class="rgen-main-container">
		<div class="rgen-main-inner">
			<div class="rgen-header clearfix">
				<div class="rgen-brand">
					<h1>R.Gen theme</h1>
					<span>Version <?php echo RGEN_VER; ?></span>	
				</div>
				<script type="text/ng-template" id="theme_menu.html">
					<ul>
						<li><a ui-sref="general"><span>General</span></a></li>
						<li><a ui-sref="commoncomponents"><span>Common components</span></a></li>
						<li><a ui-sref="header"><span>Top header</span></a></li>
						<li><a ui-sref="ocmenu"><span>OC Menu</span></a></li>
						<li><a ui-sref="footer"><span>Footer</span></a></li>
						<li><a ui-sref="prdblocks"><span>Product blocks</span></a></li>
						<li><a ui-sref="customcode"><span>Custom Code</span></a></li>
					</ul>

					<h3 class="menu-hd">Pages</h3>
					<ul>
						<li><a ui-sref="page-category"><span>Category</span></a></li>
						<li><a ui-sref="page-product"><span>Product</span></a></li>
						<li><a ui-sref="page-shoppingcart"><span>Shopping cart</span></a></li>
						<li><a ui-sref="page-checkout"><span>Checkout</span></a></li>
						<li><a ui-sref="page-other"><span>Other pages</span></a></li>
					</ul>

					<h3 class="menu-hd">OpenCart default modules</h3>
					<ul>
						<li><a ui-sref="oc-module-featured"><span>Featured</span></a></li>
						<li><a ui-sref="oc-module-latest"><span>Latest</span></a></li>
						<li><a ui-sref="oc-module-best"><span>Bestseller</span></a></li>
						<li><a ui-sref="oc-module-special"><span>Special offer</span></a></li>
						<li><a ui-sref="oc-module-slideshow"><span>Slide show</span></a></li>
						<li><a ui-sref="oc-module-banners"><span>Banners</span></a></li>
						<li><a ui-sref="oc-module-cataccount"><span>Category and My account</span></a></li>
					</ul>

					<!-- <h3 class="menu-hd">R.Gen modules</h3>
					<ul>
						<li><a ui-sref="module-menu"><span>Mega menu</span></a></li>
						<li><a ui-sref="module-basicslideshow"><span>Basic slideshow</span></a></li>
						<li><a ui-sref="module-basicbanners"><span>Basic banners</span></a></li>
						<li><a ui-sref="module-productgroups"><span>Product groups</span></a></li>
						<li><a ui-sref="module-customhtml"><span>Custom HTML</span></a></li>
					</ul> -->
				</script>
				<script type="text/ng-template" id="module_menu.html">
					<ul>
						<li><a ui-sref="mod_menu"><span>Mega menu</span></a></li>
						<li><a ui-sref="mod_basicslideshow"><span>Basic slideshow</span></a></li>
						<li><a ui-sref="mod_basicbanners"><span>Basic banners</span></a></li>
						<li><a ui-sref="mod_bannergrids"><span>Banner grids</span></a></li>
						<li><a ui-sref="mod_imagegallery"><span>Image gallery</span></a></li>
						<li><a ui-sref="mod_productgroups"><span>Product groups</span></a></li>
						<li><a ui-sref="mod_customhtml"><span>Custom HTML</span></a></li>
						<li><a ui-sref="mod_stickyhtml"><span>Sticky HTML</span></a></li>
						<li><a ui-sref="mod_contentblocks"><span>Content blocks</span></a></li>
						<li><a ui-sref="mod_revslider"><span>Revo slider</span></a></li>
						<li><a ui-sref="mod_gridmanager"><span>Grid manager</span></a></li>

						<li><a ui-sref="mod_prdpghtml"><span>Product page : HTML</span></a></li>
						<li><a ui-sref="mod_prdpgtabs"><span>Product page : Tabs</span></a></li>

						<li><a ui-sref="mod_catshowcase"><span>Category showcase</span></a></li>
						<li><a ui-sref="mod_deals"><span>Deals / Product showcase</span></a></li>
					</ul>
				</script>
				<script type="text/ng-template" id="system_menu.html">
					<ul>
						<li><a ui-sref="sys-backuprestore"><span>Backup / Restore</span></a></li>
						<li><a ui-sref="sys-optimization"><span>Theme optimization</span></a></li>
					</ul>
				</script>
				<div class="rgen-menu-wrp">
					<ul class="rgen-menu">
						<li class="main-link">
							<!-- <a ui-sref="home" href="{{url_prefix}}#/home"><span><i class="fa fa-sliders"></i><br>Theme</span></a> -->
							<a ui-sref="home"><span><i class="fa fa-sliders"></i><br>Theme</span></a>
							<div class="sub-menu" ng-include="'theme_menu.html'"></div>
						</li><li class="main-link">
							<a ui-sref="home"><span><i class="fa fa-cubes"></i><br>Modules</span></a>
							<div class="sub-menu" ng-include="'module_menu.html'"></div>
						</li><li class="main-link">
							<a ui-sref="home"><span><i class="fa fa-cog"></i><br>System</span></a>
							<div class="sub-menu" ng-include="'system_menu.html'"></div>
						</li><li class="main-link">
							<a ui-sref="mod_gridmanager"><span><i class="fa fa-columns"></i><br>Grid manager</span></a>
						</li>
					</ul>
				</div><!-- / rgen-menu-wrp -->
				
				<table class="rgen-header-btn">
					<tr>
						<td><rgen-themestorage buttonlabel="Theme storage" data-ng-model="theme_storage"></rgen-themestorage></td>
						<td><a href="http://rgenmodernstore.rgenesis.com/help/" target="_blank" class="rgen-btn mediumlight">Help</a></td>
					</tr>
				</table>
				
			</div><!-- / rgen-header -->
			
			<div class="rgen-container">
				<div ui-view></div>
			</div>	
		</div>
	</div>
</form>
	
<?php include DIR_SYSTEM.$this->rgen('admin_layout_footer');//$layout_footer; ?>