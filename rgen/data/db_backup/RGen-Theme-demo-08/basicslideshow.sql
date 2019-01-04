-- ------------------------------------
-- 
-- Module - basicslideshow
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgmP8', '{"common":{"effect":"random","speed":1500,"auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo08_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo08_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Inner page - slide show"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgIO3', '{"data":[{"module_id":"rgmP8","layout_id":"3","position":"content_top","status":true,"sort_order":0,"w":"940","h":"350","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Inner page - slide show"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%basicslideshow%';



DELETE FROM `layout_module` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rgIO3.rgmP8', 'content_top', '0');


DELETE FROM `setting` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgIO3.rgmP8', '1', '0');
