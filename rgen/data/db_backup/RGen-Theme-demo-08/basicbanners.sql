-- ------------------------------------
-- 
-- Module - basicbanners
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%basicbanners%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicbanners', 'rgpTx', '{"common":{"hoverstyle":"n","title":{"1":"en - No data"},"html":{"1":"en - No data"},"title_status":false,"html_status":false},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"banner":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"img":"..\\/image\\/catalog\\/rgen\\/demo08_images\\/banners\\/other-banners\\/col-banner1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true},"hover":{"icon":[],"title":{"1":"R.Gen - OpenCart Modern Store Design"},"html":{"1":"en - No data"}}}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"banner":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"img":"..\\/image\\/catalog\\/rgen\\/demo08_images\\/banners\\/other-banners\\/col-banner2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true},"hover":{"icon":[],"title":[],"html":[]}}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"banner":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"img":"..\\/image\\/catalog\\/rgen\\/demo08_images\\/banners\\/other-banners\\/col-banner3.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true},"hover":{"icon":[],"title":[],"html":[]}}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"banner":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"img":"..\\/image\\/catalog\\/rgen\\/demo08_images\\/banners\\/other-banners\\/col-banner4.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true},"hover":{"icon":[],"title":[],"html":[]}}}],"name":"Column - banners"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicbanners_set', 'set_rgtPO', '{"data":[{"module_id":"rgpTx","layout_id":"3","position":"column_left","status":true,"sort_order":"1","w":"300","h":"136","viewtype":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb10","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb10"},"carousel":{"item_margin":20,"item_display":5,"display_items":[],"arrows":true,"dots":true},"container":"bx"}],"name":"Category - column banners"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicbanners_set', 'set_rgXY1', '{"data":[{"module_id":"rgpTx","layout_id":"2","position":"column_right","status":true,"sort_order":"1","w":"300","h":"136","viewtype":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb10","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb10"},"carousel":{"item_margin":20,"item_display":5,"display_items":[],"arrows":true,"dots":true},"container":"bx"}],"name":"Product - column banners"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%basicbanners%';



DELETE FROM `layout_module` WHERE `code` LIKE '%basicbanners%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicbanners.set_rgtPO.rgpTx', 'column_left', '1');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_basicbanners.set_rgXY1.rgpTx', 'column_right', '1');


DELETE FROM `setting` WHERE `code` LIKE '%basicbanners%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicbanners', 'rgen_basicbanners_R.set_rgtPO.rgpTx', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicbanners', 'rgen_basicbanners_R.set_rgXY1.rgpTx', '1', '0');
