<div id="rgen-basicslideshow-rgenhMuYDU" class="rgen-basicslideshow basicslideshow-rger0">
	<div>
		<div class="slideshow-wrp dots-typ1 normal">
			<div class="slideshow">
								<div class="slide">
										<a href="http://themeforest.net/item/rgen-opencart-modern-store-design/2699592?ref=R_GENESIS" target="_blank"><img src="http://newdveri/image/cache/catalog/rgen/demo09_images/slideshow/Innerpage-slideshow-withcol/withcol-940x350-1-940x350.jpg" alt="ru - No data"/></a>
									</div>
								<div class="slide">
										<a href="http://themeforest.net/item/rgen-opencart-modern-store-design/2699592?ref=R_GENESIS" target="_blank"><img src="http://newdveri/image/cache/catalog/rgen/demo09_images/slideshow/Innerpage-slideshow-withcol/withcol-940x350-2-940x350.jpg" alt="ru - No data"/></a>
									</div>
							</div>
		</div>
	</div>
</div>


<script type="text/javascript" ><!--
$(document).ready(function(){

		if ($('.ly-column').length == 0) {
		$("#rgen-basicslideshow-rgenhMuYDU > div").addClass('container');
	};
	
	var win         = $(window);
	var auto        = true;
	var autostopped = false;
	var container   = $("#rgen-basicslideshow-rgenhMuYDU .slideshow-wrp");

	/* Default slide script
	------------------------*/
	var sudoSlider = $("#rgen-basicslideshow-rgenhMuYDU .slideshow").sudoSlider({
		responsive: true,
		controlsAttr: 'class="owl-controls"',
		effect: "random",
		speed: 1500,
				auto: true,
				pause: 2000,
				prevNext: true,
		nextHtml: '<a class="next"><i class="fa fa-chevron-right"></i></a>',
		prevHtml: '<a class="prev"><i class="fa fa-chevron-left"></i></a>',
						numeric: true,
		numericAttr: 'class="dots ul-reset"',
		
				continuous: true,
				updateBefore: true,
		mouseTouch: false,
		touch: true,
		slideCount: 1
	})

		.mouseenter(function() {
		auto = sudoSlider.getValue('autoAnimation');
		if (auto) { sudoSlider.stopAuto(); } else { autostopped = true; }
	})
	.mouseleave(function() {
		if (!autostopped) { sudoSlider.startAuto(); }
	})
	;

	
	
	});
//--></script>
