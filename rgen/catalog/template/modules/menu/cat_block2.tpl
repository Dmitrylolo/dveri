<?php if (isset($item['item_data']['title'])) { ?>
<ul class="mg-items cat-block2">
	
	<li class="hd"><a class="sub-item" href="<?php echo isset($item['item_data']['url']) ? $item['item_data']['url'] : null; ?>" data-image="<?php echo isset($item['item_data']['image']) ? $item['item_data']['image'] : null; ?>"><div class="cat-img"><img src="<?php echo isset($item['item_data']['image']) ? $item['item_data']['image'] : null; ?>" alt="<?php echo isset($item['item_data']['title']) ? $item['item_data']['title'] : null; ?>"></div><?php echo isset($item['item_data']['title']) ? $item['item_data']['title'] : null; ?></a></li>
	<?php 
	$i = 1;
	if (isset($item['nested_item'])) { 
	foreach ($item['nested_item'] as $k => $v) {
	if ($i <= $item['item_data']['max_sub']) { ?>
	<li class="cat-link">
		<a class="sub-item" href="<?php echo $v['item_data']['url']; ?>" data-image="<?php echo $v['item_data']['image']; ?>"><?php echo $v['item_data']['title']; ?></a>
		<?php if (isset($v['navfly'])) { echo $v['navfly']; } ?>
	</li>
	<?php } $i++; } } ?>
</ul>
<?php } ?>