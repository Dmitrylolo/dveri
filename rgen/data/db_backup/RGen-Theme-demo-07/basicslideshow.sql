-- ------------------------------------
-- 
-- Module - basicslideshow
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgBRc', '{"data":[{"module_id":"rgvME","layout_id":"1","position":"content_top","status":true,"sort_order":0,"w":"930","h":"400","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Home - Main slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgvME', '{"common":{"effect":"random","speed":1500,"auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo07_images\\/slideshow\\/home-slideshow\\/slide01.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo07_images\\/slideshow\\/home-slideshow\\/slide02.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Home - slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgo9B', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"random","speed":1500,"pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo07_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo07_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Inner page - slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rggJX', '{"data":[{"module_id":"rgo9B","layout_id":"3","position":"content_top","status":true,"sort_order":0,"w":"940","h":"350","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Inner page - slideshow"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rgvME', '{"status":true,"main_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: auto; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"margin-top: auto; margin-right: auto; margin-bottom: auto; margin-left: auto; "},"slideshow":[]}');


DELETE FROM `layout_module` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_basicslideshow.set_rgBRc.rgvME', 'content_top', '0');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rggJX.rgo9B', 'content_top', '0');


DELETE FROM `setting` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgBRc.rgvME', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rggJX.rgo9B', '1', '0');
