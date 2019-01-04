<div class="refine-tools">
	<ul class="list-unstyled product-filter">
		<li class="sort">
			<label for="input-sort"><i class="fa fa-sort"> </i> <?php echo $text_sort; ?></label>
			<select id="input-sort" class="form-control" onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</li>
		<li class="limit">
			<label for="input-limit"><i class="fa fa-eye"> </i> <?php echo $text_limit; ?></label>
			<select id="input-limit" class="form-control" onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</li>
		<li class="compare"><a href="<?php echo $compare; ?>" id="compare-total" class="btn-compare"><i class="fa fa-bar-chart icon"> </i> <?php echo $text_compare; ?></a></li>
	<!--	<li class="display">
			<button type="button" class="vm" id="list-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="glyphicon glyphicon-th-list"></i></button>
			<button type="button" class="vm active" id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="glyphicon glyphicon-th-large"></i></button>
		</li>
-->
	</ul>

</div>