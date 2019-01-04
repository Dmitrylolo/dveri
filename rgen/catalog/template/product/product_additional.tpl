<?php if ($products_add) { ?>
<div class="additional-prd">
	<hr class="hr">
	<h3 class="h3"><?php echo $text_additional; ?></h3>
	<div data-widget="autoCarousel" class="widget-carousel ctrl-b" data-stpd="1" data-resitems="5" data-res="true" data-margin="10">
		<?php foreach ($products_add as $product) { ?>
		<div class="item">
			<?php include $this->rgen('prd'.$rgen['prdpg_rel_prdstyle']); ?>
		</div>
		<?php } ?>
	</div>	
</div>

<?php } ?>