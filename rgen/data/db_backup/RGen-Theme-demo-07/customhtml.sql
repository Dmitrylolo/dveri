-- ------------------------------------
-- 
-- Module - customhtml
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%customhtml%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_customhtml', 'rgOrI', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":true,"html":{"1":"FREE USA standard delivery order over $50*\\n<span style=\\"margin:0 10px;\\">|<\\/span>\\nFREE delivery to Australia & Canada*\\n<span style=\\"margin:0 10px;\\">|<\\/span>\\nSome promotion text"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Home - Below menu"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_customhtml_set', 'set_rgm0T', '{"data":[{"module_id":"rgOrI","layout_id":"1","position":"pos_ss","status":false,"sort_order":0,"container":"bx"}],"name":"Home - Below menu"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%customhtml%';

INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_menu.rgehL.customhtml', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.customhtml', '{"family":"","subset":""}');


DELETE FROM `layout_module` WHERE `code` LIKE '%customhtml%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_customhtml.set_rgm0T.rgOrI', 'pos_ss', '0');


DELETE FROM `setting` WHERE `code` LIKE '%customhtml%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_customhtml', 'rgen_customhtml_R.set_rgm0T.rgOrI', '', '0');
