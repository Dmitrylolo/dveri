<?php 

require_once(DIR_SYSTEM . '../rgen/system/rgen_config.php');
require_once(DIR_SYSTEM . '../rgen/system/rgen_settings.php');
require_once(DIR_SYSTEM . '../rgen/system/rgen_storage.php');
require_once(DIR_SYSTEM . '../rgen/system/rgen_assets.php');
require_once(DIR_SYSTEM . '../rgen/system/rgen_factory.php');
require_once(DIR_SYSTEM . '../rgen/system/rgen_processor.php');
include_once(DIR_SYSTEM . '../rgen/lib/Underscore-php/underscore.php');

class rgen {
	public $rgen_config;
	public $settings;
	public $storage;
	public $assets;
	public $factory;
	public $processor;
}?>