<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
	<a>
		<?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
		<strong><?php echo $currency['symbol_left']; ?></strong>
		<?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
		<strong><?php echo $currency['symbol_right']; ?></strong>
		<?php } ?>
		<?php } ?>
		<i class="caret"></i>
	</a>
	<div class="t-dd-menu">
		<?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['symbol_left']) { ?>
		<a class="currency-select" data-name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a>
		<?php } else { ?>
		<a class="currency-select" data-name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a>
		<?php } ?>
		<?php } ?>
	</div>
	<input type="hidden" name="code" value="" />
	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
