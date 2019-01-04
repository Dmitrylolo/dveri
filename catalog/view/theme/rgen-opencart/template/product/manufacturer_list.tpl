<?php include $this->rgen('layout_top'); ?>

<?php if ($categories) { ?>
	<section class="brands-a2z">
		<h4 class="h4"><?php echo $text_index; ?></h4>
		<?php foreach ($categories as $category) { ?>
		<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
		<?php } ?>
	</section>

	<?php foreach ($categories as $category) { ?>
	<section class="manufacturer-list">
		<a id="<?php echo $category['name']; ?>" class="manufacturer-heading"><?php echo $category['name']; ?></a>
		<?php if ($category['manufacturer']) { ?>
			<div class="manufacturer-content">
			<?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
				<ul>
				<?php foreach ($manufacturers as $manufacturer) { ?>
					<li><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
				<?php } ?>
				</ul>
			<?php } ?>
			</div>
		<?php } ?>
	</section>
	<?php } ?>
<?php } else { ?>
	<p><?php echo $text_empty; ?></p>
	<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
	</div>
<?php } ?>

<?php 
	include $this->rgen('layout_bottom');
	echo $footer;
?>