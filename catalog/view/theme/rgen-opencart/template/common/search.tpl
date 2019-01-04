<?php $rgen = $this->rgen('settings'); ?>
<div id="search">
	<span class="input-wrp">
		<input type="text" name="search" id="autosearch" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
	</span>
	<span class="btn-wrp">
		<button type="button" class="search-btn"><i class="fa fa-search"></i></button>
	</span>
</div>

<?php if ($rgen['topbar_autosearch']) { ?>
<script>ajaxSearch('#autosearch');</script>	
<?php } ?>
