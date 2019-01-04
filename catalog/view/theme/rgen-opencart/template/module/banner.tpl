<?php 
$rgen   = $this->rgen('settings');
$mod    = $rgen['ocmod_banners'];
$modid  = 'oc-banners-'.$this->rgen('factory')->uid();

$contentarea_view        = isset($mod['contentarea_view']) ? $mod['contentarea_view'] : 'grid';
$contentarea_girds       = isset($mod['grids']) ? $mod['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20';
$contentarea_scrollitems = isset($mod['carousel']['item_display']) ? $mod['carousel']['item_display'] : 4;
$contentarea_scrollmrg   = isset($mod['carousel']['item_margin']) ? $mod['carousel']['item_margin'] : 10;

$column_view             = isset($mod['column_view']) ? $mod['column_view'] : 'grid';
$column_girds            = isset($mod['column_grids']) ? $mod['column_grids'] : 'eq1 gt0 mb10';
$column_scrollitems      = isset($mod['column_carousel']['item_display']) ? $mod['column_carousel']['item_display'] : 4;
$column_scrollmrg        = isset($mod['column_carousel']['item_margin']) ? $mod['column_carousel']['item_margin'] : 10;

$colpos = false;
if (isset($this->rgen('rgenSettings')->st_data['current_pos'])) {
	if ($this->rgen('rgenSettings')->st_data['current_pos'] == 'column_left' || 
		$this->rgen('rgenSettings')->st_data['current_pos'] == 'column_right') {
		$colpos = true;
	}
}
?>
<div id="<?php echo $modid; ?>" class="oc-banners mod-wrp">
<?php if (!$colpos) { ?>
	<?php 
	/* Grid view
	------------------------*/
	if ($contentarea_view == 'grid') { ?>
	<div class="rw <?php echo $contentarea_girds; ?>">
		<?php foreach ($banners as $banner) { ?>
		<div class="cl">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } else {

	/* Carousel view
	------------------------*/ ?>
	<div class="widget-carousel ctrl-b" data-stpd="1" data-resitems="<?php echo $contentarea_scrollitems; ?>" data-res="true" data-margin="<?php echo $contentarea_scrollmrg; ?>">
		<?php foreach ($banners as $banner) { ?>
		<div class="cl">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>

<?php } else { ?>

	<?php 
	/* Grid view
	------------------------*/
	if ($column_view == 'grid') { ?>
	<div class="rw <?php echo $column_girds; ?>">
		<?php foreach ($banners as $banner) { ?>
		<div class="cl">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } else {

	/* Carousel view
	------------------------*/ ?>
	<div class="widget-carousel ctrl-b" data-stpd="1" data-resitems="<?php echo $column_scrollitems; ?>" data-res="true" data-margin="<?php echo $column_scrollmrg; ?>">
		<?php foreach ($banners as $banner) { ?>
		<div class="cl">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>

<?php } ?>
</div>
