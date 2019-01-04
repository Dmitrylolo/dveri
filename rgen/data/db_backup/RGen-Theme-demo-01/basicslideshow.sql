-- ------------------------------------
-- 
-- Module - basicslideshow
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rg8fP', '{"data":[{"module_id":"rg2Bo","layout_id":"1","position":"pos_ss","status":false,"sort_order":0,"w":"1330","h":"800","sizetype":"pfs","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Home Slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rguFt', '{"common":{"effect":"random","speed":1500,"auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo01_images\\/slideshow\\/940x350-1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo01_images\\/slideshow\\/940x350-2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Inner page slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgqO8', '{"data":[{"module_id":"rguFt","layout_id":"3","position":"content_top","status":true,"sort_order":0,"w":"940","h":"350","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Category page slideshow"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rg2Bo', '{"common":{"effect":"random","speed":1500,"auto":false,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo01_images\\/slideshow\\/slide01.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo01_images\\/slideshow\\/slide02.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo01_images\\/slideshow\\/slide03.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Home - Slideshow"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%basicslideshow%';

INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rg2Bo', '{"status":true,"main_wrp":[],"container":[],"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":[]}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rguFt', '{"status":true,"main_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"container":[],"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":[]}');


DELETE FROM `layout_module` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rgqO8.rguFt', 'content_top', '0');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_basicslideshow.set_rg8fP.rg2Bo', 'pos_ss', '0');


DELETE FROM `setting` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgqO8.rguFt', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rg8fP.rg2Bo', '', '0');
