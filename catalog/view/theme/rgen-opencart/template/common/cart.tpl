<?php 
$rgen = $this->rgen('settings');
$topbar   = isset($rgen['topbar_style']) ? $rgen['topbar_style'] : '1';

$cart_icon = isset($rgen['topbar_cart_icon']) ? $rgen['topbar_cart_icon'] : 'glyphicon glyphicon-shopping-cart';
$cartbt_icon = isset($rgen['topbar_popup_cart_btn_icon']) ? $rgen['topbar_popup_cart_btn_icon'] : true;
$chkbt_icon = isset($rgen['topbar_popup_checkout_btn_icon']) ? $rgen['topbar_popup_checkout_btn_icon'] : true;
if ($topbar == '1') {
	$text_items_data = explode(' - ', $text_items);
	$text_items = isset($text_items_data[1]) ? $text_items_data[1] : $text_items;
} else {
	$text_items;
}

?>
<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-lg dropdown-toggle"><span id="cart-total"><?php echo $text_items; ?></span> <i class="<?php echo $cart_icon; ?>"></i></button>
  <ul class="dropdown-menu pull-right bdr-color-1">
	<?php if ($products || $vouchers) { ?>
	<li class="mini-cart-prd">
	  <table class="table">
		<?php foreach ($products as $product) { ?>
		<tr>
		  <td class="text-center"><?php if ($product['thumb']) { ?>
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
			<?php } ?></td>
		  <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			<?php if ($product['option']) { ?>
			<?php foreach ($product['option'] as $option) { ?>
			<br />
			- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
			<?php } ?>
			<?php } ?>
			<?php if ($product['recurring']) { ?>
			<br />
			- <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
			<?php } ?></td>
		  <td class="text-right">x <?php echo $product['quantity']; ?></td>
		  <td class="text-right"><?php echo $product['total']; ?></td>
		  <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn-default btn-xs"><i class="fa fa-times"></i></button></td>
		</tr>
		<?php } ?>
		<?php foreach ($vouchers as $voucher) { ?>
		<tr>
		  <td class="text-center"></td>
		  <td class="text-left"><?php echo $voucher['description']; ?></td>
		  <td class="text-right">x&nbsp;1</td>
		  <td class="text-right"><?php echo $voucher['amount']; ?></td>
		  <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="primary-btn btn-xs"><i class="fa fa-times"></i></button></td>
		</tr>
		<?php } ?>
	  </table>
	</li>
	<li class="mini-cart-total clearfix">
		<table class="table">
			<?php foreach ($totals as $total) { ?>
			<tr>
				<td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
				<td class="text-right"><?php echo $total['text']; ?></td>
			</tr>
			<?php } ?>
		</table>
		<div class="btn-box">
			<a href="<?php echo $cart; ?>" class="btn default-btn btn-xs"><?php echo $text_cart; ?><?php if ($cartbt_icon) { ?> <i class="glyphicon glyphicon-shopping-cart"><?php } ?></i></a>
			<a href="<?php echo $checkout; ?>" class="btn primary-btn btn-xs"><?php echo $text_checkout; ?><?php if ($chkbt_icon) { ?> <i class="fa fa-share"></i><?php } ?></a>
		</div>
	</li>
	<?php } else { ?>
	<li>
	  <p class="text-center"><?php echo $text_empty; ?></p>
	</li>
	<?php } ?>
  </ul>
</div>
