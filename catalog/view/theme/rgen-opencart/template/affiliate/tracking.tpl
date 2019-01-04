<?php include $this->rgen('layout_top'); ?>

<p><?php echo $text_description; ?></p>
<div class="frm-wrp">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?></label>
			<div class="col-sm-10">
			<textarea cols="40" rows="5" placeholder="<?php echo $entry_code; ?>" id="input-code" class="form-control"><?php echo $code; ?></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-generator"><span data-toggle="tooltip" title="<?php echo $help_generator; ?>"><?php echo $entry_generator; ?></span></label>
			<div class="col-sm-10">
			<input type="text" name="product" value="" placeholder="<?php echo $entry_generator; ?>" id="input-generator" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
			<div class="col-sm-10">
			<textarea name="link" cols="40" rows="5" placeholder="<?php echo $entry_link; ?>" id="input-link" class="form-control"></textarea>
			</div>
		</div>
	</form>
</div>
<div class="buttons clearfix">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>

<?php include $this->rgen('layout_bottom'); ?>

<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['link']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val(item['label']);
		$('textarea[name=\'link\']').val(item['value']);	
	}	
});
//--></script> 
<?php echo $footer; ?> 