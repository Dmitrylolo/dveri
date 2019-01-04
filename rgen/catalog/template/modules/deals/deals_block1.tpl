<?php 
if (isset($product['name']) && sizeof($product) > 0) { 
$pdid = 'prd-'.$this->rgen('factory')->uid();
$valign = $column['content_view']['v_align'] ? ' '.$column['content_view']['v_align'] : ' align-t';
$blockClass = $block['img_position'] ? ' '.$block['img_position'] : null;
?>
<div class="deals-box deals-box1<?php echo ' '.$block['img_position'].$blockClass; ?>" id="<?php echo $pdid; ?>">
	<?php 

	if ($block['img_position'] == 't') {
		include $this->rgen('deals_block1_img');
		include $this->rgen('deals_block1_info');
	}

	if ($block['img_position'] == 'l' || $block['img_position'] == 'r') { ?>
	<div class="tbl-gr eq2<?php echo $valign; ?>">
		<?php if ($block['img_position'] == 'l') { include $this->rgen('deals_block1_img'); } ?>
		<?php include $this->rgen('deals_block1_info'); ?>
		<?php if ($block['img_position'] == 'r') { include $this->rgen('deals_block1_img'); } ?>
	</div>
	<?php } ?>

</div>
<script>
var obj = { 
	source: "#<?php echo $pdid; ?> .thimg", 
	target: "#<?php echo $pdid; ?> .img-wrp", 
	exit_wrp: "#<?php echo $pdid; ?> .img-wrp ul", 
	exit_data: "li:first .thimg" 
}
thgallery_fn(obj);

<?php if (isset($product['end_date'])) { ?>
<?php if ($product['end_date']) { ?>
var config = {
	counter: "#<?php echo $pdid; ?> .countdown",
	end_date: "<?php echo $product['end_date'];?>",
	ele: "#<?php echo $pdid; ?>",
	d: "<?php echo $lng_data['day']; ?>", 
	h: "<?php echo $lng_data['hour']; ?>",
	m: "<?php echo $lng_data['min']; ?>",
	s: "<?php echo $lng_data['sec']; ?>"
}
countdown_fn(config);
<?php } } ?>
</script>
<?php } ?>