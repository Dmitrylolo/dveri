<?php if ($tags) { ?>
	<div class="tags">
		<h5 class="h5"><?php echo $text_tags; ?></h5>
		<?php for ($i = 0; $i < count($tags); $i++) { ?>
		<?php if ($i < (count($tags) - 1)) { ?>
		<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
		<?php } else { ?>
		<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
		<?php } ?>
		<?php } ?>
	</div>
<?php } ?>