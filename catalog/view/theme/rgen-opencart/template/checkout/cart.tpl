<?php include $this->rgen('layout_top'); ?>

<div class="cart-pg">
	<h3 class="h3"><?php echo $heading_title; ?> - <?php if ($weight) { ?>(<?php echo $weight; ?>)<?php } ?></h3>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="text-center img"><?php echo $column_image; ?></td>
						<td class="text-left name"><?php echo $column_name; ?></td>
						<td class="text-left model"><?php echo $column_model; ?></td>
						<td class="text-center quantity"><?php echo $column_quantity; ?></td>
						<td class="text-right price"><?php echo $column_price; ?></td>
						<td class="text-right total"><?php echo $column_total; ?></td>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($products as $product) { ?>
					<tr>
						<td class="text-center img"><?php if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
							<?php } ?></td>
						<td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<?php if (!$product['stock']) { ?>
							<span class="text-danger">***</span>
							<?php } ?>
							<?php if ($product['option']) { ?>
							<?php foreach ($product['option'] as $option) { ?>
							<br />
							<small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
							<?php } ?>
							<?php } ?>
							<?php if ($product['reward']) { ?>
							<br />
							<small><?php echo $product['reward']; ?></small>
							<?php } ?>
							<?php if ($product['recurring']) { ?>
							<br />
							<span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
							<?php } ?></td>
						<td class="text-left model"><?php echo $product['model']; ?></td>
						<td class="text-center cart-qty">
							<div class="btn-block">
								<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
								<button type="submit" class="btn btn-xs primary-btn"><?php echo $button_update; ?></button>
								<a onclick="cart.remove('<?php echo $product['key']; ?>');"><?php echo $button_remove; ?></a>
							</div>
						</td>
						<td class="text-right price"><?php echo $product['price']; ?></td>
						<td class="text-right total"><?php echo $product['total']; ?></td>
					</tr>
					<?php } ?>
					<?php foreach ($vouchers as $vouchers) { ?>
					<tr>
						<td></td>
						<td class="text-left"><?php echo $vouchers['description']; ?></td>
						<td class="text-left"></td>
						<td class="text-center cart-qty">
							<div class="input-group btn-block">
								<input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
								<a onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><?php echo $button_remove; ?></a>
							</div>
						</td>
						<td class="text-right"><?php echo $vouchers['amount']; ?></td>
						<td class="text-right"><?php echo $vouchers['amount']; ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</form>
	<br />
	<div class="row gut-50">
		<div class="col-sm-8 shipping-wrp">
			<?php if ($coupon || $voucher || $reward || $shipping) { ?>
			<h4 class="h3"><?php echo $text_next; ?></h4>
			<p><?php echo $text_next_choice; ?></p>
			<div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php /* echo $shipping;*/ ?></div>
			<?php } ?>
		</div>
		<div class="col-sm-4 cart-total-wrp">
			<div class="cart-total">
				<table class="table">
					<?php foreach ($totals as $total) { ?>
					<tr>
						<td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
						<td class="text-right"><?php echo $total['text']; ?></td>
					</tr>
					<?php } ?>
				</table>	
			</div>
		</div>
	</div>
	<div class="buttons">
		<div class="pull-left"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_shopping; ?></a></div>
		<div class="pull-right"><a href="<?php echo $checkout; ?>" class="primary-btn"><?php echo $button_checkout; ?></a></div>
	</div>
</div>

<?php 
	include $this->rgen('layout_bottom');
	include $this->rgen('msg_attention');
	include $this->rgen('msg_success');
	include $this->rgen('msg_error');
	echo $footer;
?>
