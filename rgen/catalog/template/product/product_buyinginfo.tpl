<div class="buying-info">
	<?php if ($rgen['prdpg_price_status']) { ?>
	<div class="price-wrp">
	<h4 class="price-name">Цена</h4>
		<?php 
		/* PRICE DATA
		**************************/
		if ($price) { ?>
		<div class="price vm">
			<b>
				<?php 
				/* Price */
				if (!$special) { ?>
				 <span class="price-new"><label>Полотно: </label><?php echo (float)$price_value; ?> грн</span>
				 <span class="price-new"><label>Комплект: </label><span class="autocalc-option-price">0 </span> </span>
				 <span class="price-new"><label>Общая:</label><?php echo $price; ?></span>
				<?php } else { ?>
				<span class="price-old"><label>Полотно: </label><?php echo (float)$price_value; ?> грн</span>
				<span class="price-new"><label>со скидкой: </label><?php echo (float)$special_value; ?> грн</span>
				<span class="price-new" style="margin-bottom: 2px;"><label>Комплект: </label><span class="autocalc-option-price"></span> </span>
				<span class="price-old"><label>Общая: </label><?php echo $price; ?></span>
				<span class="price-new"><label>со скидкой: </label><?php echo $special; ?></span>
				<?php } ?>

				<?php 
				/* TAX 
                echo $rgen['prdpg_tax_status'];
				if ($rgen['prdpg_tax_status']) {
				if ($tax) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
				<?php } }*/ ?>
			</b>
		</div>
			<?php 
			/* Points 
			if ($points) { ?>
			<span class="reward"><?php echo $text_points; ?> <?php echo $points; ?></span>
			<?php } */?>

			<?php
			/* Discount 
			if ($discounts) { ?>
			<ul class="discount ul-reset">
				<?php foreach ($discounts as $discount) { ?>
				<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
				<?php } ?>
			</ul>
			<?php }*/ ?>
		<?php } ?>
	</div>
	<?php } ?>

	<?php 
	/* PRODUCT QUANTITY BOX
	**************************/ ?>
	<?php if ($rgen['prdpg_cart_status'] || $rgen['prdpg_wishlist_status'] || $rgen['prdpg_compare_status']) { ?>
	<div class="buy-btn-wrp">
		<?php if ($rgen['prdpg_cart_status']) { ?>
		<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
		<div class="control-qty">
			<a class="qty-handle" onclick="qtyMinus();"><i class="fa fa-minus-circle"></i></a>
			<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
			<a class="qty-handle" onclick="qtyPlus();"><i class="fa fa-plus-circle"></i></a>
			<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
		</div>
		<button type="button" class="btn btn-cart<?php echo $carttxt; ?>" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" ><i class="<?php echo $cart_ico; ?>"></i><?php echo $button_cart; ?></button>
		<?php } ?>
		
		<div class="cart-option">
			<?php if ($rgen['prdpg_wishlist_status']) { ?>
			<a onclick="wishlist.add('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
			<?php } ?>
			
			<?php if ($rgen['prdpg_compare_status']) { ?>
			<a onclick="compare.add('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>	
			<?php } ?>
		</div>
	</div>
	<?php } ?>

	<?php if ($minimum > 1) { ?>
	<div class="min-qty"><?php echo $text_minimum; ?></div>
	<?php } ?>
</div>
<script type="text/javascript"><!--
function price_format(n)
{ 
    c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency["decimal_point"]; ?>'; // decimal separator
    t = '<?php echo $currency["thousand_point"]; ?>'; // thousands separator
    s_left = '<?php echo $currency["symbol_left"]; ?>';
    s_right = '<?php echo $currency["symbol_right"]; ?>';
      
    n = n * <?php echo $currency['value']; ?>;

    //sign = (n < 0) ? '-' : '';

    //extracting the absolute value of the integer part of the number and converting to string
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 

    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}

function calculate_tax(price)
{
    <?php // Process Tax Rates
      if (isset($tax_rates) && $tax) {
         foreach ($tax_rates as $tax_rate) {
           if ($tax_rate['type'] == 'F') {
             echo 'price += '.$tax_rate['rate'].';';
           } elseif ($tax_rate['type'] == 'P') {
             echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
           }
         }
      }
    ?>
    return price;
}

function process_discounts(price, quantity)
{
    <?php
      foreach ($dicounts_unf as $discount) {
        echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
      }
    ?>
    return price;
}


animate_delay = 20;

main_price_final = calculate_tax(<?php echo $price_value; ?>);
main_price_start = calculate_tax(<?php echo $price_value; ?>);
main_step = 0;
main_timeout_id = 0;
option_step = 0; 
option_timeout_id = 0;
option_price_start = 0;
option_price_final = 0;

function animateMainPrice_callback() {
	main_price_start += main_step;
    
    if ((main_step > 0) && (main_price_start > main_price_final)){
        main_price_start = main_price_final;
    } else if ((main_step < 0) && (main_price_start < main_price_final)) {
        main_price_start = main_price_final;
    } else if (main_step == 0) {
        main_price_start = main_price_final;
    }
    
    $(".autocalc-product-price").html( price_format(main_price_start) );
    
    if (main_price_start != main_price_final) {
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }
}

function animateMainPrice(price) {
    main_price_start = main_price_final;
    main_price_final = price;
    main_step = (main_price_final - main_price_start) / 10;
    
    clearTimeout(main_timeout_id);
    main_timeout_id = setTimeout(animateMainPrice_callback(), animate_delay);
}
	
function animateOptionPrice_callback() {
	option_price_start += option_step;
    
    if ((option_step > 0) && (option_price_start > option_price_final)){
        option_price_start = option_price_final;
    } else if ((option_step < 0) && (option_price_start < option_price_final)) {
        option_price_start = option_price_final;
    } else if (option_step == 0) {
        option_price_start = option_price_final;
    }
    
    $(".autocalc-option-price").html( price_format(option_price_start) );
    
    if (option_price_start != option_price_final) {
        option_timeout_id = setTimeout(animateOptionPrice_callback, animate_delay);
    }
}

function animateOptionPrice(price) {
    option_price_start = option_price_final;
    option_price_final = price;
    option_step = (option_price_final - option_price_start) / 10;
    
    clearTimeout(option_timeout_id);
    option_timeout_id = setTimeout(animateOptionPrice_callback(), animate_delay);
}
	

<?php if ($special) { ?>
special_price_final = calculate_tax(<?php echo $special_value; ?>);
special_price_start = calculate_tax(<?php echo $special_value; ?>);
special_step = 0;
special_timeout_id = 0;

function animateSpecialPrice_callback() {
    special_price_start += special_step;
    
    if ((special_step > 0) && (special_price_start > special_price_final)){
        special_price_start = special_price_final;
    } else if ((special_step < 0) && (special_price_start < special_price_final)) {
        special_price_start = special_price_final;
    } else if (special_step == 0) {
        special_price_start = special_price_final;
    }
    
    $('.autocalc-product-special').html( price_format(special_price_start) );
    
    if (special_price_start != special_price_final) {
        special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
    }
}

function animateSpecialPrice(price) {
    special_price_start = special_price_final;
    special_price_final = price;
    special_step = (special_price_final - special_price_start) / 10;
    
    clearTimeout(special_timeout_id);
    special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
}
<?php } ?>


function recalculateprice()
{
    var main_price = <?php echo (float)$price_value; ?>;
    var input_quantity = Number($('input[name="quantity"]').val());
    var special = <?php echo (float)$special_value; ?>;
    var tax = 0;
    
    if (isNaN(input_quantity)) input_quantity = 0;
    
    <?php if ($special) { ?>
        special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
    <?php } ?>
    main_price = process_discounts(main_price, input_quantity);
    tax = process_discounts(tax, input_quantity);
    
    
    var option_price = 0;
    
    <?php if ($points) { ?>
      var points = <?php echo (float)$points_value; ?>;
      $('input:checked,option:selected').each(function() {
          if ($(this).data('points')) points += Number($(this).data('points'));
      });
      $('.autocalc-product-points').html(points);
    <?php } ?>
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '=') {
        option_price += Number($(this).data('price'));
        main_price = 0;
        special = 0;
      }
    });
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '+') {
        option_price += Number($(this).data('price'));
      }
      if ($(this).data('prefix') == '-') {
        option_price -= Number($(this).data('price'));
      }
      if ($(this).data('prefix') == 'u') {
        pcnt = 1.0 + (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price *= pcnt;
        special *= pcnt;
      }
      if ($(this).data('prefix') == 'd') {
        pcnt = 1.0 - (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price *= pcnt;
        special *= pcnt;
      }
      if ($(this).data('prefix') == '*') {
        option_price *= Number($(this).data('price'));
        main_price *= Number($(this).data('price'));
        special *= Number($(this).data('price'));
      }
    });
    
    special += option_price;
    main_price += option_price;

    <?php if ($special) { ?>
      main_price = special * special_coefficient;
      tax = special;
    <?php } else { ?>
      tax = main_price;
    <?php } ?>
    
    // Process TAX.
    main_price = calculate_tax(main_price);
    special = calculate_tax(special);
    
    // Раскомментировать, если нужен вывод цены с умножением на количество
    main_price *= input_quantity;
    special *= input_quantity;
    tax *= input_quantity;
	option_price *= input_quantity;
	
    // Display Main Price
	//mainpriceclass = ".autocalc-product-price";
	//var optionpriceclass =".autocalc-option-price";
    animateMainPrice(main_price); 
	animateOptionPrice(option_price);
    <?php if ($special) { ?>
      animateSpecialPrice(special);
    <?php } ?>
}

$(document).ready(function() {
    $('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
    $('input[type="radio"]').bind('change', function() { recalculateprice(); });
    $('select').bind('change', function() { recalculateprice(); });
    
    $quantity = $('input[name="quantity"]');
    $quantity.data('val', $quantity.val());
    (function() {
        if ($quantity.val() != $quantity.data('val')){
            $quantity.data('val',$quantity.val());
            recalculateprice();
        }
        setTimeout(arguments.callee, 250);
    })();    
    
    recalculateprice();
});

//--></script>