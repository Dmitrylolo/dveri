<?php 
include $this->rgen('layout_top'); 
$rgen = $this->rgen('settings');
?>



<?php 
/* REFINE OPTIONS
**************************/
if ($products) { ?>
	
	<?php /* if ($categories) { ?>
		<?php if ($rgen['refine_search'] == 1) { ?>
		<div class="refine-search refine-search1">
			<h5 class="h3"><?php echo $text_refine; ?></h5>
			<?php if ($rgen['refine_view'] == 'grid') { ?>
			<ul class="list-unstyled rw gt1 mb1 eq8 d-eq7 t-eq6 mxl-eq5 msm-eq4 mxs-eq2">
				<?php foreach ($categories as $category) { ?>
				<li class="cl">
					<a href="<?php echo $category['href']; ?>">
						<img src="<?php echo $category['pic']; ?>" alt="<?php echo $category['name']; ?>">
						<strong><?php echo $category['name']; ?></strong>
					</a>
				</li>
				<?php } ?>
			</ul>
			<?php } ?>
		
			<?php if ($rgen['refine_view'] == 'carousel') { ?>
			<div 
				class       ="refine-cat-carousel"
				data-stpd   ="1" 
				data-nav    ="false" 
				data-dots   ="true" 
				data-res    ="true" 
				data-rbase  ='body'
				data-margin ="1">
				<?php foreach ($categories as $category) { ?>
				<div class="item">
					<a href="<?php echo $category['href']; ?>">
						<img src="<?php echo $category['pic']; ?>" alt="<?php echo $category['name']; ?>">
						<strong><?php echo $category['name']; ?></strong>
					</a>
				</div>
				<?php } ?>
			</div>
			<script>
				var items = {
					0    : { items:2 },
					320  : { items:2 },
					400  : { items:3 },
					480  : { items:3 },
					600  : { items:4 },
					700  : { items:5 },
					768  : { items:5 },
					800  : { items:6 },
					900  : { items:7 },
					980  : { items:7 },
					1100 : { items:8 }
				};
				widgetCarousel('.refine-cat-carousel', items);
				//refineSearch('.refine-cat-carousel', items);
			</script>
			<?php } ?>
		</div>
		<?php } ?>

		<?php if ($rgen['refine_search'] == 2) { ?>
		<div class="refine-search refine-search2">
			<h5 class="h3"><?php echo $text_refine; ?></h5>
			
			<?php if ($rgen['refine_view'] == 'grid') { ?>
			<ul class="list-unstyled rw gt1 mb1 eq5 d-eq5 t-eq4 mxl-eq4 msm-eq2 mxs-eq1">
				<?php foreach ($categories as $category) { ?>
				<li class="cl">
					<a href="<?php echo $category['href']; ?>">
						<strong><?php echo $category['name']; ?></strong>
					</a>
				</li>
				<?php } ?>
			</ul>
			<?php } ?>
			<?php if ($rgen['refine_view'] == 'carousel') { ?>
			<div 
				class       ="refine-cat-carousel"
				data-stpd   ="1" 
				data-nav    ="false" 
				data-dots   ="true" 
				data-res    ="true" 
				data-rbase  ='body'
				data-margin ="1">
				<?php foreach ($categories as $category) { ?>
				<div class="item">
					<a href="<?php echo $category['href']; ?>">
						<strong><?php echo $category['name']; ?></strong>
					</a>
				</div>
				<?php } ?>
			</div>
			<script>
				var items = {
					0    : { items:2 },
					320  : { items:2 },
					400  : { items:2 },
					480  : { items:3 },
					600  : { items:3 },
					700  : { items:3 },
					768  : { items:4 },
					800  : { items:4 },
					900  : { items:4 },
					980  : { items:4 },
					1100 : { items:5 }
				};
				widgetCarousel('.refine-cat-carousel', items);
				//refineSearch('.refine-cat-carousel', items);
			</script>
			<?php } ?>

		</div>
		<?php } ?>
	<?php } */?>

	<?php include $this->rgen('refine_tools'); ?>

	<?php 
	/* PRODUCT GRIDS
	**************************/ ?>
    
	<div class="prd-container rw" data-gridview="<?php echo $rgen['category_prd']['gridview']; ?>" data-listview="<?php echo $rgen['category_prd']['listview']; ?>">
		<?php foreach ($products as $product) { ?>
		<div class="product-layout product-list cl">
			<?php include $this->rgen('prd'.$rgen['category_prd']['prd_style']); ?>
		</div>
		<?php } ?>
	</div>
	<div class="pagination-wrp">
		<div class="rw gt0">
			<div class="cl6 text-left"><?php echo $pagination; ?></div>
			<div class="cl6 text-right"><?php echo $results; ?></div>
		</div>	
	</div>
	
<?php } ?>

<?php if (!$categories && !$products) { ?>
	<p><?php echo $text_empty; ?></p>
	<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
	</div>
<?php } ?>
<?php 
/* CATEGORY INFO
**************************/
if ($rgen['cat_info']) {
if ($thumb || $description) { ?>
<article class="category-info clearfix">
	<?php if ($thumb) { ?>
	<div class="img-l">
	<img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
	</div>
	<?php } ?>
	<?php if ($description) {  echo $description;  } ?>
</article>
<?php } } ?>

<?php 
	include $this->rgen('layout_bottom');
	echo $footer;
?>