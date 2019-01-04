<?php if (isset($block['category_data']['title']) && sizeof($block['category_data']) > 0) { ?>
<div class="catshowcase-box catshowcase-box4">
	<div class="main-ct">
		<a href="<?php echo $block['category_data']['url']; ?>" class="img"><img src="<?php echo $block['category_data']['image'] ?>" class="img-responsive" alt="<?php echo $block['category_data']['title']; ?>"></a>
		<div class="info">
			<?php if ($block['title_status']) { ?>
			<h3 class="name"><a href="<?php echo $block['category_data']['url']; ?>"><?php echo $block['category_data']['title']; ?></a></h3>
			<?php } ?>

			<?php if ($block['description_status']) { ?>
			<div class="text"><?php echo $block['category_data']['description']; ?></div>
			<?php } ?>
		</div>
	</div>

	<?php if ($block['sub_status']) { ?>
	<?php if (isset($block['category_data']['sub_categories']) && sizeof($block['category_data']['sub_categories']) > 0) { ?>
	<ul class="sub-ct">
		<?php foreach ($block['category_data']['sub_categories'] as $key => $value) { ?>
		<li><a href="<?php echo $value['url']; ?>"><?php echo $value['title']; ?></a></li>
		<?php } ?>
	</ul>
	<?php } ?>
	<?php } ?>

	<?php if ($block['button_status']) { ?>
	<div class="btn-wrp">
		<?php if ($block['btn_style'] == 'lnk') { ?>
		<a href="<?php echo $block['category_data']['url']; ?>" class="button-link"><?php echo $block['category_data']['button']; ?></a>
		<?php } else { ?>
		<a href="<?php echo $block['category_data']['url']; ?>" class="default-btn"><?php echo $block['category_data']['button']; ?></a>
		<?php } ?>
	</div>
	<?php } ?>
</div>
<?php } ?>