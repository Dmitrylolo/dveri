-- ------------------------------------
-- 
-- Module - customhtml
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%customhtml%';



DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%customhtml%';

INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_menu.rglsP.customhtml', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.customhtml', '{"family":"","subset":""}');


DELETE FROM `layout_module` WHERE `code` LIKE '%customhtml%';



DELETE FROM `setting` WHERE `code` LIKE '%customhtml%';

