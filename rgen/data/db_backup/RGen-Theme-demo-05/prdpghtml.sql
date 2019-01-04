-- ------------------------------------
-- 
-- Module - prdpghtml
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%prdpghtml%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml', 'rgUvl', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":true,"html":{"1":"<img src=\\"image\\/catalog\\/rgen\\/demo05_images\\/product\\/free-delivery.png\\" class=\\"img-responsive\\" alt=\\"free-delivery\\">"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Free delivery"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml_set', 'set_rg0ko', '{"data":[{"module_id":"rgUvl","layout_id":"2","position":"pdpg_bhd","status":true,"sort_order":0,"container":"bx","prd_page":"selected","products":[{"id":"42","name":"Apple Cinema 30\\""},{"id":"30","name":"Canon EOS 5D"},{"id":"41","name":"iMac"}]}],"name":"Product 1 - Free delivery"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml', 'rguDc', '{"common":{"hoverstyle":"1","title_status":false,"title":[],"gt":"gt40","top":{"status":true,"html":{"1":"<img src=\\"image\\/catalog\\/rgen\\/demo05_images\\/product\\/promo.png\\" class=\\"img-responsive\\" alt=\\"promo\\">"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Promo code banner"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml_set', 'set_rg4Jl', '{"data":[{"module_id":"rguDc","layout_id":"2","position":"pdpg_bimg","status":true,"sort_order":0,"container":"bx","prd_page":"all","products":[]}],"name":"Promo banner"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%prdpghtml%';

INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.d.mod_hd', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.m.mod_hd', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.d.t_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.t.t_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.m.t_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.d.b_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.t.b_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.m.b_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.d.l_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.t.l_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.m.l_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.d.m_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.t.m_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.m.m_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.d.r_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.t.r_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgUvl.m.r_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_prdpghtml', 'rgen_prdpghtml.rgUvl', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0.05)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":"10","pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":"15","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"15","pad_l_type":"int","css":"padding-top: 10px; padding-right: 15px; padding-bottom: 10px; padding-left: 15px; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"15","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 15px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0.05); padding-top: 10px; padding-right: 15px; padding-bottom: 10px; padding-left: 15px; margin-top: auto; margin-right: auto; margin-bottom: 15px; margin-left: auto; "},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;padding: 0px;margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_prdpghtml', 'rgen_prdpghtml.rguDc', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"15","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 15px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"margin-top: auto; margin-right: auto; margin-bottom: 15px; margin-left: auto; "},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.d.mod_hd', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.m.mod_hd', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.d.t_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.t.t_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.m.t_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.d.b_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.t.b_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.m.b_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.d.l_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.t.l_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.m.l_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.d.m_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.t.m_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.m.m_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.d.r_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.t.r_html', '{"family":"","subset":""}');
INSERT INTO `rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rguDc.m.r_html', '{"family":"","subset":""}');


DELETE FROM `layout_module` WHERE `code` LIKE '%prdpghtml%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_prdpghtml.set_rg0ko.rgUvl', 'pdpg_bhd', '0');
INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_prdpghtml.set_rg4Jl.rguDc', 'pdpg_bimg', '0');


DELETE FROM `setting` WHERE `code` LIKE '%prdpghtml%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_prdpghtml', 'rgen_prdpghtml_R.set_rg4Jl.rguDc', '1', '0');
INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_prdpghtml', 'rgen_prdpghtml_R.set_rg0ko.rgUvl', '1', '0');