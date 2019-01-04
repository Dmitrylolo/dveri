-- ------------------------------------
-- 
-- Module - basicslideshow
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgFjK', '{"common":{"effect":"slide","speed":1500,"auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo02_images\\/slideshow\\/home-slideshow\\/slide1.jpg","url":"","win":false}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo02_images\\/slideshow\\/home-slideshow\\/slide2.jpg","url":"","win":false}}],"name":"Home - Slide show"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgY5s', '{"data":[{"module_id":"rgFjK","layout_id":"1","position":"pos_ss","status":false,"sort_order":0,"w":"1320","h":"650","sizetype":"pfs","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Basic slideshow 01"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgz7j', '{"data":[{"module_id":"rgqZd","layout_id":"1","position":"rg_t_r","status":true,"sort_order":"1","w":"262","h":"500","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Column - Slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgqZd', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"pushInLeft","speed":1500,"pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo02_images\\/banners\\/other-banners\\/262x500_1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo02_images\\/banners\\/other-banners\\/262x500_2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Column - Slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgVAv', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"random","speed":1500,"pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo02_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo02_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Inner page slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgqzW', '{"data":[{"module_id":"rgVAv","layout_id":"3","position":"content_top","status":true,"sort_order":0,"w":"940","h":"350","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Inner page slideshow"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rgFjK', '{"status":true,"main_wrp":[],"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":[]}');


DELETE FROM `layout_module` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_basicslideshow.set_rgY5s.rgFjK', 'pos_ss', '0');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_basicslideshow.set_rgz7j.rgqZd', 'rg_t_r', '1');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rgqzW.rgVAv', 'content_top', '0');


DELETE FROM `setting` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgY5s.rgFjK', '', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgz7j.rgqZd', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgqzW.rgVAv', '1', '0');
