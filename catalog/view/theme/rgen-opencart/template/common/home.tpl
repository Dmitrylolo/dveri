<?php 
if ($this->registry->get('rgen_check')) {
	include $this->rgen('layout_top');
	include $this->rgen('layout_bottom');
	echo $footer;
}else{
	echo $this->registry->get('rgen_error');
}
	
?>