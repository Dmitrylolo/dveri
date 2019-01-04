<?php echo $header; ?>
<?php foreach ($this->rgen('assets')->admin_cssFiles as $css) { ?>
<link href="<?php echo $css; ?>" rel="stylesheet" type='text/css'>
<?php } ?>

<?php echo $column_left; ?>
<div id="content" class="rgen-wrp" data-ng-app="rgen">
	<div class="page-header">
		<div class="container-fluid">
		  	<div class="pull-right">
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1>R.Gen - OpenCart</h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>

	<div class="container-fluid">