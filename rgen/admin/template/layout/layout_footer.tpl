	</div><!-- container-fluid end -->
</div><!-- content end -->
<?php 
//echo "<pre>".print_r($rgen_config,true)."</pre>";
?>
<script>
var rgen_config = JSON.parse('<?php echo addslashes(json_encode($rgen_config)); ?>');

var tpl = function (file, type) {
	typeof type == "undefined" ? type = 'tpl' : type;
	if (type == 'tpl') {
		return '<?php echo $origin; ?>'+file;
	};
	if (type == 'dir') {
		return '<?php echo DIR_ADMIN_DIRECTIVE; ?>'+file+'.html?v=<?php echo RGEN_VER; ?>';	
	};
}
//console.log(rgen_config);
</script>
<?php foreach ($this->rgen('assets')->admin_jsFiles as $js) { ?>
<script type="text/javascript" src="<?php echo $js; ?>"></script>	
<?php } ?>

<?php echo $footer; ?>