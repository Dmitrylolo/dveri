-- ------------------------------------
-- 
-- Module - basicslideshow
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgN0A', '{"common":{"effect":"slide","speed":1500,"auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo03_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo03_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Inner page slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgL2e', '{"data":[{"module_id":"rgN0A","layout_id":"3","position":"content_top","status":true,"sort_order":0,"w":"940","h":"350","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Inner page slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgtlY', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"random","speed":1500,"pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo03_images\\/banners\\/other-banners\\/200x380_1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo03_images\\/banners\\/other-banners\\/200x380_2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Column slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgvR8', '{"data":[{"module_id":"rgtlY","layout_id":"3","position":"column_left","status":true,"sort_order":"4","w":"200","h":"380","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Column slideshow"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%basicslideshow%';



DELETE FROM `layout_module` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rgL2e.rgN0A', 'content_top', '0');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rgvR8.rgtlY', 'column_left', '4');


DELETE FROM `setting` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgL2e.rgN0A', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgvR8.rgtlY', '1', '0');
