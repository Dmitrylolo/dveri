<?php 
if (isset($module)) {
$rgen        = $this->rgen('settings');
$modid       = 'rgen-basicslideshow-'.$this->rgen('factory')->uid();
$beside      = isset($settings['beside']) && $settings['beside'] ? $settings['beside'] : false;
$beside_size = isset($settings['beside_size']) && $settings['beside_size'] ? $settings['beside_size'] : 4;
$beside_gt   = isset($settings['beside_gt']) && $settings['beside_gt'] ? $settings['beside_gt'] : 'gt10';

if ($settings['sizetype'] == 'normal') { $slideshow_cls = ' normal'; }
if ($settings['sizetype'] == 'wfw') { $slideshow_cls = ' win-full-width-ss'; }
if ($settings['sizetype'] == 'wfs') { $slideshow_cls = ' win-full-screen-ss'; }
if ($settings['sizetype'] == 'pfs') { $slideshow_cls = ' page-full-size'; }
if ($settings['sizetype'] == 'pfw') { $slideshow_cls = ' page-full-width'; }

/* Normal
------------------------*/
if ($settings['sizetype'] == 'normal' && $beside) { ?>
<div id="<?php echo $modid; ?>" class="rgen-basicslideshow<?php echo $module_class; ?>">
	<div>
		<div class="rw <?php echo $beside_gt; ?>">
			<div class="cl<?php echo 12-$beside_size; ?> t-xl12 m-xl12 m-sm12 m-xs12">
				<div class="slideshow-wrp dots-typ1<?php echo $slideshow_cls; ?>">
					<div class="slideshow">
						<?php foreach ($module['data'] as $key => $slide) { ?>
						<div class="slide">
							<?php if (isset($slide['url']) && $slide['url'] != '') { ?>
							<a href="<?php echo $slide['url']; ?>"<?php echo $slide['win']; ?>><img src="<?php echo $slide['slide']; ?>" alt="<?php echo $slide['title'][$lng]; ?>"/></a>
							<?php } else { ?>
							<img src="<?php echo $slide['slide']; ?>" alt="<?php echo $slide['title'][$lng]; ?>"/>
							<?php } ?>
						</div>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="cl<?php echo $beside_size; ?> t-xl12 m-xl12 m-sm12 m-xs12">
				<?php echo isset($pos_sidess) ? $pos_sidess : null; ?>
			</div>
		</div>
	</div>
</div>
<?php }

/* Normal
------------------------*/
if ($settings['sizetype'] == 'normal' && !$beside) { ?>
<div id="<?php echo $modid; ?>" class="rgen-basicslideshow<?php echo $module_class; ?>">
	<div>
		<div class="slideshow-wrp dots-typ1<?php echo $slideshow_cls; ?>">
			<div class="slideshow">
				<?php foreach ($module['data'] as $key => $slide) { ?>
				<div class="slide">
					<?php if (isset($slide['url']) && $slide['url'] != '') { ?>
					<a href="<?php echo $slide['url']; ?>"<?php echo $slide['win']; ?>><img src="<?php echo $slide['slide']; ?>" alt="<?php echo $slide['title'][$lng]; ?>"/></a>
					<?php } else { ?>
					<img src="<?php echo $slide['slide']; ?>" alt="<?php echo $slide['title'][$lng]; ?>"/>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>
<?php } ?>

<?php 
/* Page full size, Page full width, Window full size, Window full width
------------------------*/
if ($settings['sizetype'] == 'wfw' || $settings['sizetype'] == 'wfs' || $settings['sizetype'] == 'pfs'  || $settings['sizetype'] == 'pfw') { ?>
<div id="<?php echo $modid; ?>" class="rgen-basicslideshow<?php echo $module_class; ?>">
	<div class="slideshow-wrp dots-typ1<?php echo $slideshow_cls; ?>">
		<div class="slideshow">
			<?php foreach ($module['data'] as $key => $slide) { ?>
			<div class="slide" data-background="<?php echo $slide['slide']; ?>">
				<?php if (isset($slide['url']) && $slide['url'] != '') { ?>
				<a class="slide-link" href="<?php echo $slide['url']; ?>"<?php echo $slide['win']; ?>><img src="image/spacer.gif" alt="<?php echo $slide['title'][$lng]; ?>"/></a>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php } ?>

<script type="text/javascript" ><!--
$(document).ready(function(){

	<?php if ($settings['sizetype'] == 'normal') { ?>
	if ($('.ly-column').length == 0) {
		$("#<?php echo $modid; ?> > div").addClass('container');
	};
	<?php } ?>

	var win         = $(window);
	var auto        = true;
	var autostopped = false;
	var container   = $("#<?php echo $modid; ?> .slideshow-wrp");

	/* Default slide script
	------------------------*/
	var sudoSlider = $("#<?php echo $modid; ?> .slideshow").sudoSlider({
		responsive: true,
		controlsAttr: 'class="owl-controls"',
		effect: "<?php echo $module['config']['effect']; ?>",
		speed: <?php echo $module['config']['speed']; ?>,
		<?php if($module['config']['auto']){ ?>
		auto: true,
		<?php } ?>
		pause: <?php echo $module['config']['pause']; ?>,
		<?php if($module['config']['arrows']){ ?>
		prevNext: true,
		nextHtml: '<a class="next"><i class="fa fa-chevron-right"></i></a>',
		prevHtml: '<a class="prev"><i class="fa fa-chevron-left"></i></a>',
		<?php }else { ?>
		prevNext: false,
		<?php } ?>
		<?php if($module['config']['pager']){ ?>
		numeric: true,
		numericAttr: 'class="dots ul-reset"',
		<?php } ?>

		<?php if($module['config']['continuous']){ ?>
		continuous: true,
		<?php } ?>
		updateBefore: true,
		mouseTouch: false,
		touch: true,
		slideCount: 1
	})

	<?php 
	/* Stop on mouse hover
	------------------------*/
	if($module['config']['stoponhover']){ ?>
	.mouseenter(function() {
		auto = sudoSlider.getValue('autoAnimation');
		if (auto) { sudoSlider.stopAuto(); } else { autostopped = true; }
	})
	.mouseleave(function() {
		if (!autostopped) { sudoSlider.startAuto(); }
	})
	<?php } ?>;

	
	<?php 
	/* Full screen or Full width case
	------------------------*/ 
	if ($settings['sizetype'] == 'wfs' || $settings['sizetype'] == 'pfs') { ?>
	$("#<?php echo $modid; ?>").attr({'data-id': "#<?php echo $modid; ?>"});	
	setTimeout(function () {
		var tbar = $("#<?php echo $modid; ?>").offset();
		$("#<?php echo $modid; ?>").attr({'data-top': -tbar.top});
	}, 200);
	<?php }; ?>

	<?php if($settings['sizetype'] == 'wfw' || $settings['sizetype'] == 'wfs' || $settings['sizetype'] == 'pfs'  || $settings['sizetype'] == 'pfw'){ ?>
	bss.onResize("<?php echo $settings['sizetype']; ?>", "<?php echo $settings['h']; ?>", sudoSlider, container);
	bss.fullSlider(sudoSlider);
	<?php } ?>
});
//--></script>
<?php } ?>