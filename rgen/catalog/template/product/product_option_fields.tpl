<?php 
/* PRODUCT OPTIONS
**************************/ ?>
<?php if ($options || $recurrings) { ?>
<div class="options-wrp">
	<?php foreach ($options as $option) { ?>
		
		<?php if ($option['type'] == 'select') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="fields">
				<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<option value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
					<?php if ($option_value['price']) { ?>
					<?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
					<?php } ?>
					</option>
					<?php } ?>
				</select>
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'radio') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<div class="fields">
				<div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<div class="radio">
						
							<input id="opt<?php echo $option_value['product_option_value_id']; ?>" onClick="foo('opt<?php echo $option_value['product_option_value_id']; ?>')" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
							<div class="check"><div class="inside"></div></div>
							<label for="opt<?php echo $option_value['product_option_value_id']; ?>">
				<script>
						function foo(c){
							var o = $('#'+c+':radio')[0];
							console.log(o.isCheked);
							o.attr;
							console.log(o.cheked);
						}
								
								
								</script>
							<?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							<?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
							<?php } ?>
						</label>
						
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
		<?php } ?>


		<?php if ($option['type'] == 'checkbox') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<div class="fields">
				<div id="input-option<?php echo $option['product_option_id']; ?>">
				<?php foreach ($option['product_option_value'] as $option_value) { ?>
				<div class="checkbox">
					<label>
						<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
						<?php echo $option_value['name']; ?>
						<?php if ($option_value['price']) { ?>
						<?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
						<?php } ?>
					</label>
				</div>
				<?php } ?>
				</div>	
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'image') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<div class="fields">
				<div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<div class="radio">
					<label>
					<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
					<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
					<?php if ($option_value['price']) { ?>
					<?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
					<?php } ?>
					</label>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'text') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="fields">
				<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />	
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'textarea') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="fields">
				<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'file') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<div class="fields">
				<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn default-btn btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
				<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />	
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'date') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="fields">
				<div class="input-group date">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn"><button class="btn default-btn" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'datetime') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="fields">
				<div class="input-group datetime">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn"><button type="button" class="btn default-btn"><i class="fa fa-calendar"></i></button></span>
				</div>
			</div>
		</div>
		<?php } ?>

		<?php if ($option['type'] == 'time') { ?>
		<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="fields">
				<div class="input-group time">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn"><button type="button" class="btn default-btn"><i class="fa fa-calendar"></i></button></span>
				</div>
			</div>
		</div>
		<?php } ?>

	<?php } ?>

	<?php if ($recurrings) { ?>
	<h3><?php echo $text_payment_recurring ?></h3>
	<div class="form-group required">
		<select name="recurring_id" class="form-control">
			<option value=""><?php echo $text_select; ?></option>
			<?php foreach ($recurrings as $recurring) { ?>
			<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
			<?php } ?>
		</select>
		<div class="help-block" id="recurring-description"></div>
	</div>
	<?php } ?>
</div>
<?php } ?>