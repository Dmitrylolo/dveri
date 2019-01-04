<?php 
$p                 = isset($mod["prd_style"]) ? $mod["prd_style"] : 1;
$clp               = isset($mod["col_prd_style"]) ? $mod["col_prd_style"] : 1;
$modview           = isset($mod['prd_view']) ? $mod['prd_view'] : 'grid';
$carousel_resitems = isset($mod['carousel']['item_display']) ? $mod['carousel']['item_display'] : 5;
$carousel_margin   = isset($mod['carousel']['item_margin']) ? $mod['carousel']['item_margin'] : 15;

$colpos = false;
if (isset($this->rgen('rgenSettings')->st_data['current_pos'])) {
	if ($this->rgen('rgenSettings')->st_data['current_pos'] == 'column_left' || 
		$this->rgen('rgenSettings')->st_data['current_pos'] == 'column_right') {
		$colpos = true;
	}
} ?>
<h3 class="mod-hd"><?php echo $heading_title; ?></h3>
<div class="mod-content">
	
	<?php 
	/* Grid view
	------------------------*/
	if ($modview == 'grid') { ?>
	<?php if (!$colpos) { ?>
		<div class="rw <?php echo isset($mod['grids']) ? $mod['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20' ; ?>">
			<?php foreach ($products as $product) { ?>
			<div class="cl">
				<?php include $this->rgen('prd'.$p); ?>
			</div>
			<?php } ?>
		</div>
		<script>
		jQuery(document).ready(function($) {
			equalH('#<?php echo $modid; ?> .rw', '#<?php echo $modid; ?> .cl');
		});
		</script>	
	<?php } else { 
	
	/* Carousel view
	------------------------*/
	foreach ($products as $product) { include $this->rgen('smallprd'.$clp); }

	} } ?>

	<?php
	/* Carousel view
	------------------------*/
	if ($modview == 'carousel') { ?> 
	<div data-widget="autoCarousel" class="widget-carousel ctrl-b" data-stpd="1" data-nav="false" data-dots="true" data-resitems="<?php echo $carousel_resitems; ?>" data-res="true" data-margin="<?php echo $carousel_margin; ?>">
		<?php foreach ($products as $product) { ?>
		<div class="item">
			<?php include $this->rgen('prd'.$p); ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>

</div>

