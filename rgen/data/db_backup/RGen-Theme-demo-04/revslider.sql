-- ------------------------------------
-- 
-- Module - revslider
-- 
-- ------------------------------------

DELETE FROM `rgen_modules` WHERE `section` LIKE '%revslider%';

INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_revslider', 'rg8ZZ', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":["No node"],"name":"Home - Full screen slider"}');
INSERT INTO `rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_revslider_set', 'set_rgnEu', '{"data":[{"module_id":"rg8ZZ","layout_id":"1","position":"pos_ss","status":true,"sort_order":0,"container":"bx","slider_size":"pfs","slider_id":"1","slider_data":{"title":"demo-04-home-slideshow-fullscreen","alias":"demo-04-home-slideshow-fullscreen","id":"1","params":{"0":"\\u0000xecute settings on all slides","title":"demo-04-home-slideshow-fullscreen","alias":"demo-04-home-slideshow-fullscreen","source_type":"gallery","post_types":"product","post_category":"category_20","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullscreen","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"600","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1170","height":"600","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"2","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"round","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"jquery_noconflict":"off","js_to_body":"false","output_type":"none","load_googlefont":"false","google_font":[""],"template":"false"}}}],"name":"Home - Full screen slider"}');


DELETE FROM `rgen_modules_customize` WHERE `key` LIKE '%revslider%';



DELETE FROM `layout_module` WHERE `code` LIKE '%revslider%';

INSERT INTO `layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_revslider.set_rgnEu.rg8ZZ', 'pos_ss', '0');


DELETE FROM `setting` WHERE `code` LIKE '%revslider%';

INSERT INTO `setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_revslider', 'rgen_revslider_R.set_rgnEu.rg8ZZ', '1', '0');
