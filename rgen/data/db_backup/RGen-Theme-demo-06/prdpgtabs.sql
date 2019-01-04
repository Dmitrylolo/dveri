-- ------------------------------------
-- 
-- Module - prdpgtabs
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%prdpgtabs%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpgtabs', 'rgMSC', '{"data":[{"depth":1,"status":true,"node_type":"block","node_title":"Custom Tab 1","item_data":{"node_type":"block","content":{"title":{"1":"Custom Tab 1"},"description":{"1":"<h3 class=\\"h3\\">This is product specific custom tab which display only on selected product<\\/h3>\\n\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec sem lobortis, porta orci eget, tempus elit. In hac habitasse platea dictumst. Aenean hendrerit neque euismod leo commodo tempor. Integer laoreet leo diam, et congue dui aliquet ac. Phasellus id aliquet velit, et vehicula magna. Maecenas elementum metus velit, vel congue tortor tristique et. Phasellus in turpis rutrum, pretium augue nec, venenatis nibh. Praesent congue, arcu vitae euismod ornare, felis nulla malesuada magna, non tristique libero mi in lectus. Praesent maximus lorem et elit bibendum, sed convallis lorem ultrices. In at nunc vitae diam varius interdum ut nec lorem. Nullam tempus diam et nibh condimentum, eu varius nunc finibus. Donec blandit ornare enim sed egestas. Donec lacus nisl, pretium at arcu ut, commodo ultrices ipsum. Ut sit amet mattis arcu.<\\/p>\\n\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec sem lobortis, porta orci eget, tempus elit. In hac habitasse platea dictumst. Aenean hendrerit neque euismod leo commodo tempor. Integer laoreet leo diam, et congue dui aliquet ac. Phasellus id aliquet velit, et vehicula magna. Maecenas elementum metus velit, vel congue tortor tristique et. Phasellus in turpis rutrum, pretium augue nec, venenatis nibh. Praesent congue, arcu vitae euismod ornare, felis nulla malesuada magna, non tristique libero mi in lectus. Praesent maximus lorem et elit bibendum, sed convallis lorem ultrices. In at nunc vitae diam varius interdum ut nec lorem. Nullam tempus diam et nibh condimentum, eu varius nunc finibus. Donec blandit ornare enim sed egestas. Donec lacus nisl, pretium at arcu ut, commodo ultrices ipsum. Ut sit amet mattis arcu.<\\/p>"}}},"items":[]}],"name":"Custom Tab 1"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpgtabs_set', 'set_rgNzB', '{"data":[{"module_id":"rgMSC","layout_id":"2","position":"pdpg_tabs","status":true,"sort_order":0,"prd_page":"selected","products":[{"id":"42","name":"Apple Cinema 30\\""},{"id":"30","name":"Canon EOS 5D"},{"id":"40","name":"iPhone"}]}],"name":"Custom Tab 1"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpgtabs', 'rgViY', '{"data":[{"depth":1,"status":true,"node_type":"block","node_title":"Custom tab 2","item_data":{"node_type":"block","content":{"title":{"1":"Custom tab 2"},"description":{"1":"<h3 class=\\"h3\\">THIS IS COMMON TAB ON ALL PRODUCT<\\/h3>\\n\\n<p>\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec sem lobortis, porta orci eget, tempus elit. In hac habitasse platea dictumst. Aenean hendrerit neque euismod leo commodo tempor. Integer laoreet leo diam, et congue dui aliquet ac. Phasellus id aliquet velit, et vehicula magna. Maecenas elementum metus velit, vel congue tortor tristique et. Phasellus in turpis rutrum, pretium augue nec, venenatis nibh. Praesent congue, arcu vitae euismod ornare, felis nulla malesuada magna, non tristique libero mi in lectus. Praesent maximus lorem et elit bibendum, sed convallis lorem ultrices. In at nunc vitae diam varius interdum ut nec lorem. Nullam tempus diam et nibh condimentum, eu varius nunc finibus. Donec blandit ornare enim sed egestas. Donec lacus nisl, pretium at arcu ut, commodo ultrices ipsum. Ut sit amet mattis arcu.\\n<\\/p>"}}},"items":[]}],"name":"Custom Tab 2"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpgtabs_set', 'set_rgtLL', '{"data":[{"module_id":"rgViY","layout_id":"2","position":"pdpg_tabs","status":true,"sort_order":0,"prd_page":"all","products":[]}],"name":"Custom Tab 2"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%prdpgtabs%';



DELETE FROM `layout_module` WHERE `code` LIKE '%prdpgtabs%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_prdpgtabs.set_rgNzB.rgMSC', 'pdpg_tabs', '0');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_prdpgtabs.set_rgtLL.rgViY', 'pdpg_tabs', '0');


DELETE FROM `setting` WHERE `code` LIKE '%prdpgtabs%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_prdpgtabs', 'rgen_prdpgtabs_R.set_rgNzB.rgMSC', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_prdpgtabs', 'rgen_prdpgtabs_R.set_rgtLL.rgViY', '1', '0');
