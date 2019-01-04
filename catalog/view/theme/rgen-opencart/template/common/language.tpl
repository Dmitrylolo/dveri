<?php if (count($languages) > 0) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
	<a>
		<?php foreach ($languages as $language) { ?>
		<?php if ($language['code'] == $code) { ?>
		<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
		<?php } ?>
		<?php } ?>
		<i class="caret"></i>
	</a>
	<div class="t-dd-menu">
		<?php foreach ($languages as $language) { ?>
		<a href="<?php echo $language['code']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a>
		<?php } ?>
	</div>
	<input type="hidden" name="code" value="" />
	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
