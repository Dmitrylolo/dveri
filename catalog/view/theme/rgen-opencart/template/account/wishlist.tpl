<?php include $this->rgen('layout_top'); ?>
<h3 class="h3"><?php echo $heading_title; ?></h3>
<?php if ($products) { ?>
<table class="table table-bordered wishlist-tbl">
	<thead>
		<tr>
			<td class="text-center img"><?php echo $column_image; ?></td>
			<td class="text-left name"><?php echo $column_name; ?></td>
			<td class="text-left model"><?php echo $column_model; ?></td>
			<td class="text-right stock"><?php echo $column_stock; ?></td>
			<td class="text-right price"><?php echo $column_price; ?></td>
			<td class="text-right action"><?php echo $column_action; ?></td>
		</tr>
	</thead>
	<?php foreach ($products as $product) { ?>
	<tbody id="wishlist-row<?php echo $product['product_id']; ?>">
		<tr>
			<td class="text-center img"><?php if ($product['thumb']) { ?>
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
				<?php } ?></td>
			<td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
			<td class="text-left model"><?php echo $product['model']; ?></td>
			<td class="text-right stock"><?php echo $product['stock']; ?></td>
			<td class="text-right price"><?php if ($product['price']) { ?>
				<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
				<?php } ?>
				</div>
				<?php } ?></td>
			<td class="text-right action"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" title="<?php echo $button_cart; ?>" class="btn-xs default-btn"><?php echo $button_cart; ?></button>
				<a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>" class="btn-xs primary-btn"><?php echo $button_remove; ?></a></td>
		</tr>
	</tbody>
	<?php } ?>
</table>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<?php } ?>
<div class="buttons clearfix">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>

<?php 
	include $this->rgen('layout_bottom');
	include $this->rgen('msg_success');
	echo $footer;
?>