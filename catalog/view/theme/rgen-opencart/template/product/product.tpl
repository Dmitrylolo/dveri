<?php 
$quickview      = isset($_REQUEST['urltype']) && $_REQUEST['urltype'] == 'quickview' ? true : false;

if (!$quickview) { include $this->rgen('layout_top'); }

$rgen           = $this->rgen('settings');
$lng_data       = $rgen['language_data'];
$prd_option_tab = $lng_data['prd_option_tab'];
$prdpg          = $rgen['prdpg_layout'];
$carttxt        = $rgen['prdpg_cartbtn_txt'] ? ' txt-y' : '';
$cart_ico       = $rgen['prdpg_cartbtn_ico_type'] == 'ico' ? $rgen['prdpg_cartbtn_ico'] : '';
$wish_ico       = $rgen['prdpg_wishbtn_ico_type'] == 'ico' ? $rgen['prdpg_wishbtn_ico'] : '';
$compare_ico    = $rgen['prdpg_comparebtn_ico_type'] == 'ico' ? $rgen['prdpg_comparebtn_ico'] : '';

$ly1_l          = $rgen['prdpgly1_l_size'] ? $rgen['prdpgly1_l_size'] : 6;
$ly1_r          = $rgen['prdpgly1_l_size'] ? 12-$rgen['prdpgly1_l_size'] : 6;
$ly1_gt         = $rgen['prdpgly1_gt'] ? $rgen['prdpgly1_gt'] : 'gt40';

$ly2_l          = $rgen['prdpgly2_l_size'] ? $rgen['prdpgly2_l_size'] : 6;
$ly2_r          = $rgen['prdpgly2_l_size'] ? 12-$rgen['prdpgly2_l_size'] : 6;
$ly2_gt         = $rgen['prdpgly2_gt'] ? $rgen['prdpgly2_gt'] : 'gt40';

$ly3_l          = $rgen['prdpgly3_l_size'] ? $rgen['prdpgly3_l_size'] : 5;
$ly3_r          = $rgen['prdpgly3_l_size'] ? 12-$rgen['prdpgly3_l_size'] : 7;
$ly3_gt         = $rgen['prdpgly3_gt'] ? $rgen['prdpgly3_gt'] : 'gt30';

$ly4_l          = $rgen['prdpgly4_l_size'] ? $rgen['prdpgly4_l_size'] : 8;
$ly4_r          = $rgen['prdpgly4_l_size'] ? 12-$rgen['prdpgly4_l_size'] : 4;
$ly4_gt         = $rgen['prdpgly4_gt'] ? $rgen['prdpgly4_gt'] : 'gt30';

// R.Gen positions
$pdpg_timg    = $this->controller('common/rgen-positions/pdpg_timg');
$pdpg_bimg    = $this->controller('common/rgen-positions/pdpg_bimg');
$pdpg_toption = $this->controller('common/rgen-positions/pdpg_toption');
$pdpg_boption = $this->controller('common/rgen-positions/pdpg_boption');
$pdpg_bqty    = $this->controller('common/rgen-positions/pdpg_bqty');
$pdpg_ttab    = $this->controller('common/rgen-positions/pdpg_ttab');
$pdpg_btab    = $this->controller('common/rgen-positions/pdpg_btab');
$pdpg_thd     = $this->controller('common/rgen-positions/pdpg_thd');
$pdpg_bhd     = $this->controller('common/rgen-positions/pdpg_bhd');
$pdpg_binfo   = $this->controller('common/rgen-positions/pdpg_binfo');
$pdpg_tabs    = $this->controller('common/rgen-positions/pdpg_tabs');

/* QUICK VIEW
**************************/
if ($quickview) { 
	include $this->rgen('prd_quickview'); 
} else {

/* PRODUCT PAGE LAYOUT - 1
**************************/
if ($prdpg == 1) { ?>
<div class="product-info product-info1">
	<div class="rw-wrp rw <?php echo $ly1_gt; ?>">
		<div class="l-wrp cl<?php echo $ly1_l; ?>">
			<div class="prdinfo-left">
				<?php include $this->rgen('prd_image'); ?>
				
				<? include $this->rgen('prd_related');?>
			</div>
		</div>
		<div class="r-wrp cl<?php echo $ly1_r; ?>">
			<div class="prdinfo-right">
				<?php 
				/* PLACE - ABOVE TITLE
				**************************/ ?>
				<?php echo isset($pdpg_thd) ? $pdpg_thd : null; ?>

				<h1><strong><?php echo $heading_title; ?></strong><b class="hr"></b></h1>

				<?php 
				/* PLACE - BELOW TITLE
				**************************/ ?>
				<?php echo isset($pdpg_bhd) ? $pdpg_bhd : null; ?>

				<div class="product-options-wrp" id="product">
					<section class="l"><div class="m-data buying-info"></div><?php include $this->rgen('prd_options'); ?></section>
					<section class="r">
						<?php include $this->rgen('prd_buyinginfo'); ?>
						<?php 
						/* PLACE - BELOW QUANTITY
						**************************/ ?>
						<?php echo isset($pdpg_bqty) ? $pdpg_bqty : null; ?>
					</section>
				</div>
			</div>
		</div>
	</div>
	<?php 
	include $this->rgen('prd_tabs'); 
	include $this->rgen('prd_tags');
	?>
</div>
<?php } ?>

<?php 
/* PRODUCT PAGE LAYOUT - 2
**************************/
if ($prdpg == 2) { ?>
<div class="product-info product-info2">
	<div class="rw-wrp rw <?php echo $ly2_gt; ?>">
		<div class="l-wrp cl<?php echo $ly2_l; ?>">
			<div class="prdinfo-left">
				<?php include $this->rgen('prd_image'); ?>
			</div>
		</div>
		<div class="r-wrp cl<?php echo $ly2_r; ?>">
			<div class="prdinfo-right">
				<?php 
				/* PLACE - ABOVE TITLE
				**************************/ ?>
				<?php echo isset($pdpg_thd) ? $pdpg_thd : null; ?>

				<h1><strong><?php echo $heading_title; ?></strong><b class="hr"></b></h1>
				
				<?php 
				/* PLACE - BELOW TITLE
				**************************/ ?>
				<?php echo isset($pdpg_bhd) ? $pdpg_bhd : null; ?>
				
				<div class="product-options-wrp" id="product">
					<?php include $this->rgen('prd_buyinginfo1'); ?>
					<?php include $this->rgen('prd_options'); ?>
				</div>
				
			</div>
		</div>
	</div>
	<?php include $this->rgen('prd_tabs'); ?>
	<?php include $this->rgen('prd_tags'); ?>
</div>
<?php } ?>

<?php 
/* PRODUCT PAGE LAYOUT - 3
**************************/
if ($prdpg == 3) { ?>
<div class="product-info product-info3">
	<div class="rw-wrp rw <?php echo $ly3_gt; ?>">
		<div class="l-wrp cl<?php echo $ly3_l; ?>">
			<div class="prdinfo-left">
				<?php include $this->rgen('prd_image'); ?>
			</div>
		</div>
		<div class="r-wrp cl<?php echo $ly3_r; ?>">
			<div class="prdinfo-right">
				<?php 
				/* PLACE - ABOVE TITLE
				**************************/ ?>
				<?php echo isset($pdpg_thd) ? $pdpg_thd : null; ?>

				<h1><strong><?php echo $heading_title; ?></strong><b class="hr"></b></h1>

				<?php 
				/* PLACE - BELOW TITLE
				**************************/ ?>
				<?php echo isset($pdpg_bhd) ? $pdpg_bhd : null; ?>

				<div class="product-options-wrp" id="product">
					<?php include $this->rgen('prd_buyinginfo2'); ?>
					<?php include $this->rgen('prd_tabs1'); ?>
				</div>
			</div>
		</div>
	</div>
	
	<?php 
	/* PLACE - BELOW TABS
	**************************/ ?>
	<?php echo isset($pdpg_btab) ? $pdpg_btab : null; ?>

	<?php include $this->rgen('prd_tags'); ?>
</div>
<?php } ?>

<?php

	include $this->rgen('prd_additional');?>
	
	
	<?php include $this->rgen('layout_bottom');

} // <= Quick view end ?>
<div class="rgen-contentblocks contentblocks-algoritm">
  <div class="mod-wrp">
    <h3 class="mod-hd">Алгоритм покупки:</h3>
    <div class="rw gt40">
      <div class="m-cl cl12 t-xl12">
        <div class="mod-content">
          <div class="rw gt0 mb0">
            <div class="cl cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12 ">
              <div class="contentblock-grid rw eq7 d-eq7 t-eq7 mxl-eq1 msm-eq1 mxs-eq1 gt20 mb10">
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 1 </h3>
                      <figure class="image"><img src="/image/catalog/algoritm/cart.png" alt="Вы добавляете дверь в корзину и оформляете заказ"></figure>
                      <div class="text-wrp">
                        <div class="text">Вы добавляете дверь в корзину и оформляете заказ</div>
                      </div>
                    </div>
                  </section>
                </div>
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 2 </h3>
                      <figure class="image"><img src="/image/catalog/algoritm/callcenter.png" alt="В ближайшее время, с Вами связывается наш менеджер для уточнения заказа."></figure>
                      <div class="text-wrp">
                        <div class="text">В ближайшее время, с Вами связывается наш менеджер для уточнения заказа.</div>
                      </div>
                    </div>
                  </section>
                </div>
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 3 </h3>
                      <figure class="image"><a href="#" class="callme_viewform "><img src="/image/catalog/algoritm/oldopenofficeorgdraw.png" alt="Если Вы не знаете размер дверного проема, наш замерщик приедет и сделает точный замер"></a></figure>
                      <div class="text-wrp">
                        <div class="text">Если Вы не знаете размер дверного проема, наш замерщик приедет и сделает точный <a href="#" class="callme_viewform "> замер</a></div>
                      </div>
                    </div>
                  </section>
                </div>
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 4 </h3>
                     <figure class="image"><a href="index.php?route=information/information/agree&information_id=5" class="agree"> <img src="/image/catalog/algoritm/write.png" alt="С листом замера, посетите удобный для Вас салон"></a></figure>
                      <div class="text-wrp">
                        <div class="text">С листом замера, посетите салон</div>
                      </div>
                    </div>
                  </section>
                </div>
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 5 </h3>
                      <figure class="image"><a href="index.php?route=information/information/agree&information_id=8" class="agree"><img src="/image/catalog/algoritm/invoice.png" alt="Наш менеджер сформирует Вам счет, который можно оплатить в нашем салоне или через банк."></a></figure>
                      <div class="text-wrp">
                        <div class="text">Наш менеджер сформирует Вам счет, который можно оплатить в нашем салоне или через банк.</div>
                      </div>
                    </div>
                  </section>
                </div>
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 6 </h3>
                      <figure class="image"><a href="index.php?route=information/information/agree&information_id=8" class="agree"><img src="/image/catalog/algoritm/truck.png" alt="Наши экспедиторы аккуратно доставляют двери и материалы"></a></figure>
                      <div class="text-wrp">
                        <div class="text">Наши экспедиторы аккуратно доставляют двери и материалы</div>
                      </div>
                    </div>
                  </section>
                </div>
                <div class="cl" style="min-height: 227px;">
                  <section class="ctn-block ctn-block1 ">
                    <div class="ctn-inner-wrp">
                      <h3 class="name"> 7 </h3>
                      <figure class="image"><a href="index.php?route=information/information/agree&information_id=6" class="agree"><img src="/image/catalog/algoritm/preferences.png" alt="Установщики профессионально устанавливают дверь."></a></figure>
                      <div class="text-wrp">
                        <div class="text">Установщики профессионально устанавливают дверь.</div>
                      </div>
                    </div>
                  </section>
                </div>
              </div>
              <script>
								jQuery(document).ready(function($) {
									equalH('#rgen-contentblocks-rgenGeGpTd .contentblock-grid', '#rgen-contentblocks-rgenGeGpTd .contentblock-grid > .cl');
								});
								</script> 
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			console.log(json);
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				if (parent) {
					parent.msg('', json['success'], 'success', parent);

					parent.$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);
				
					parent.$('html, body').animate({ scrollTop: 0 }, 'slow');
					
					parent.$('#cart > ul').load('index.php?route=common/cart/info ul li');
				} else {
					msg('', json['success'], 'success');

					$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);
				
					$('html, body').animate({ scrollTop: 0 }, 'slow');
					
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				};
				
				//$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
	
	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload',
			type: 'post',
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},
			success: function(json) {
				$('.text-danger').remove();
				
				if (json['error']) {
					$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input').attr('value', json['code']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

	$('#review').fadeOut('slow');

	$('#review').load(this.href);

	$('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

//--></script> 

<?php if (!$quickview) { echo $footer; } else { ?>
</body></html>
<?php } ?>

