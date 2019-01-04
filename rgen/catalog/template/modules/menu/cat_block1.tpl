<?php if (isset($item['item_data']['title'])) { ?>
<ul class="mg-items cat-block1">
	<li class="hd"><a class="sub-item" href="<?php echo isset($item['item_data']['url']) ? $item['item_data']['url'] : null; ?>"><?php echo isset($item['item_data']['title']) ? $item['item_data']['title'] : null; ?></a></li>
	<?php 
	$i = 1;
	if (isset($item['nested_item'])) { 
	foreach ($item['nested_item'] as $k => $v) { 
	if ($i <= $item['item_data']['max_sub']) { ?>
	<li>
		<a class="sub-item" href="<?php echo $v['item_data']['url']; ?>"><?php echo $v['item_data']['title']; ?></a>
		<?php if (isset($v['navfly'])) { echo $v['navfly']; } ?>
	</li>
	<?php } $i++; } } ?>
</ul>
<?php } ?>