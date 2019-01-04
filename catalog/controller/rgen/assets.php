<?php 
class ControllerRgenAssets extends Controller {

	public function index() {
		$data             = array();
		$factory          = $this->rgen->factory;
		$storage          = $this->rgen->storage;
		$assets           = $this->rgen->assets;
		//$data['route']  = $this->rgen->route;
		$data['route']    = isset($this->registry->get('request')->get['route']) ? $this->registry->get('request')->get['route'] : 'common/home';
		$data['settings'] = $this->rgen->rgenSettings->st_data;

		// Google fonts url
		$theme_data = array();
		if (sizeof($storage->get('theme_data', 'fonts')) > 0) {
			$theme_data = $storage->get('theme_data', 'fonts');
		}
		$modtheme_data = array();
		if (sizeof($storage->get('modtheme_data', 'fonts')) > 0) {
			$modtheme_data = $storage->get('modtheme_data', 'fonts');
		}
		$fonts             = array_merge($theme_data, $modtheme_data);
		$data['gfont_url'] = $assets->gfonts($fonts);

		/* General CSS 
		------------------------*/
		$general = $storage->get('theme_data', 'rgen_general');
		
		if ($this->chk($general)) {
			if (isset($general['theme_general']['status']) && $general['theme_general']['status']) {
				
				// Theme body CSS config
				if ($factory->has($general['theme_general'], 'body')) {
					$body = $general['theme_general']['body'];
					$data['body_css']  = $factory->getnode($body, 'block');
					$data['body_css'] .= $this->cssimgpath($factory->getnode($body, 'image'));
				}

				if ($factory->has($general['theme_general'], 'page_container')) {
					$page_container = $general['theme_general']['page_container'];
					$data['page_container']  = $factory->getnode($page_container, 'block');
					$data['page_container'] .= $this->cssimgpath($factory->getnode($page_container, 'image'));
					$data['page_container'] .= $this->cssprop($page_container['margin_t'], 'margin_t');
					$data['page_container'] .= $this->cssprop($page_container['margin_b'], 'margin_b');
				}

				if ($factory->has($general['theme_general'], 'contentarea')) {
					$contentarea = $general['theme_general']['contentarea'];
					$data['contentarea_css']  = $factory->getnode($contentarea, 'block');
					$data['contentarea_css'] .= $this->cssimgpath($factory->getnode($contentarea, 'image'));
				}

				if ($factory->has($general['theme_general'], 'contentbox')) {
					$contentbox = $general['theme_general']['contentbox'];
					$data['contentbox_css']  = $factory->getnode($contentbox, 'block');
					$data['contentbox_css'] .= $this->cssimgpath($factory->getnode($contentbox, 'image'));
				}
			}
		}

		/* General CSS 
		------------------------*/
		$ocmenu = $storage->get('theme_data', 'rgen_ocmenu');
		if ($this->chk($ocmenu)) {
			$ocmenu = $ocmenu['ocmenu'];
			if (isset($ocmenu['status']) && $ocmenu['status']) {
				$data['ocmenu']['menu_wrp']       = $factory->getnode($ocmenu, 'menu_wrp');
				$data['ocmenu']['container']      = $factory->getnode($ocmenu, 'container');
				$data['ocmenu']['mainitem']       = $factory->getnode($ocmenu, 'mainitem', 'css_normal');
				$data['ocmenu']['mainitem_hover'] = $factory->getnode($ocmenu, 'mainitem', 'css_hover');
				$data['ocmenu']['subwrp']         = $factory->getnode($ocmenu, 'subwrp');
				$data['ocmenu']['subitem']        = $factory->getnode($ocmenu, 'subitem', 'css_normal');
				$data['ocmenu']['subitem_hover']  = $factory->getnode($ocmenu, 'subitem', 'css_hover');
				
				$data['ocmenu']['m_handle']       = $factory->getnode($ocmenu, 'm_handle');
				$data['ocmenu']['m_subhandle']    = $factory->getnode($ocmenu, 'm_subhandle');
				$data['ocmenu']['m_nav']          = $factory->getnode($ocmenu, 'm_nav');
				$data['ocmenu']['m_subwrp']       = $factory->getnode($ocmenu, 'm_subwrp');
				$data['ocmenu']['m_mainitem']     = $factory->getnode($ocmenu, 'm_mainitem');
				$data['ocmenu']['m_subitem']      = $factory->getnode($ocmenu, 'm_subitem');
				$data['ocmenu']['m_seeall']       = $factory->getnode($ocmenu, 'm_seeall');
			}
		}

		/* Topbar CSS 
		------------------------*/
		$data['css_fn_autosearch'] = $this->rgen->css_fn_autosearch;
		$topbarData = $this->rgen->storage->get('theme_data', 'rgen_topbar');
		if ($factory->has($topbarData, 'topbar1') && $this->chk($topbarData['topbar1'])) {
			$topbar1 = $topbarData['topbar1'];
			
			if (isset($topbar1['status']) && $topbar1['status']) {

				// Header css
				$data['topbar1']['header']                       = $factory->getnode($topbar1['header'], 'block');
				$data['topbar1']['header']                       .= $this->cssimgpath($factory->getnode($topbar1['header'], 'image'));
				
				$data['topbar1']['innerblock']                   = $factory->getnode($topbar1['header'], 'innerblock');
				$data['topbar1']['innerblock']                   .= $this->cssimgpath($factory->getnode($topbar1['header'], 'innerimage'));
				
				// Logo
				$data['topbar1']['logo']                         = $factory->getnode($topbar1, 'logo');

				// Mobile Header css
				$data['topbar1']['m_header']                     = $factory->node($topbar1, 'mob/header', 1);
				$data['topbar1']['m_logo']                       = $factory->node($topbar1, 'mob/logo', 1);
				$data['topbar1']['m_cart']                       = $factory->node($topbar1, 'mob/cart_block', 1);
				$data['topbar1']['m_search']                     = $factory->node($topbar1, 'mob/search_block', 1);

				// Top links left
				$data['topbar1']['toplinks_wrp']                 = $factory->getnode($topbar1['toplink'], 'block');
				$data['topbar1']['toplinks_normal']              = $factory->getnode($topbar1['toplink'], 'link_normal');
				$data['topbar1']['toplinks_hover']               = $factory->getnode($topbar1['toplink'], 'link_hover');
				
				// Top drop down
				$data['topbar1']['tdd']                          = $factory->getnode($topbar1['tdd'], 'dd', 'css_normal');
				$data['topbar1']['tdd_hover']                    = $factory->getnode($topbar1['tdd'], 'dd', 'css_hover');
				$data['topbar1']['tdd_sub']                      = $factory->getnode($topbar1['tdd'], 'dd_sub');
				$data['topbar1']['tdd_item']                     = $factory->getnode($topbar1['tdd'], 'dd_item_normal');
				$data['topbar1']['tdd_item_hover']               = $factory->getnode($topbar1['tdd'], 'dd_item_hover');
				
				// Cart
				$data['topbar1']['cart']                         = $factory->getnode($topbar1['cart'], 'block');
				$data['topbar1']['cart_icon']                    = $factory->getnode($topbar1['cart'], 'icon');
				$data['topbar1']['cart_popup']                   = $factory->getnode($topbar1['cart'], 'popup_block');
				$data['topbar1']['cart_popup_text']              = $this->cssprop($topbar1['cart']['popup_block_text'], 'color');
				$data['topbar1']['cart_popup_link']              = $this->cssprop($topbar1['cart']['popup_links']['normal'], 'color');
				$data['topbar1']['cart_popup_link_hover']        = $this->cssprop($topbar1['cart']['popup_links']['hover'], 'color');
				$data['topbar1']['cart_popup_border_color']      = $this->cssprop($topbar1['cart']['popup_border_color'], 'bdrcolor');
				$data['topbar1']['cart_popup_remove_color']      = $this->cssprop($topbar1['cart']['popup_remove_color'], 'color');
				
				$data['topbar1']['cart_popup_total_block']       = $factory->getnode($topbar1['cart'], 'popup_total_block');
				$data['topbar1']['cart_popup_total_text']        = $this->cssprop($topbar1['cart']['popup_total_text'], 'color');
				
				$data['topbar1']['cart_total_cartbtn']           = $factory->getnode($topbar1['cart'], 'popup_total_cartbtn', 'css_normal');
				$data['topbar1']['cart_total_cartbtn_hover']     = $factory->getnode($topbar1['cart'], 'popup_total_cartbtn', 'css_hover');
				
				$data['topbar1']['cart_total_checkoutbtn']       = $factory->getnode($topbar1['cart'], 'popup_total_checkoutbtn', 'css_normal');
				$data['topbar1']['cart_total_checkoutbtn_hover'] = $factory->getnode($topbar1['cart'], 'popup_total_checkoutbtn', 'css_hover');
				
				$data['topbar1']['top_search_wrp']               = $factory->getnode($topbar1['search'], 'block');
				$data['topbar1']['top_search_wrp_h']             = $factory->node($topbar1, 'search/block_h', 1);
				$data['topbar1']['top_search_input']             = $factory->getnode($topbar1['search'], 'input');
				$data['topbar1']['top_search_btn']               = $factory->getnode($topbar1['search'], 'button','css_normal');
				$data['topbar1']['top_search_btn_hover']         = $factory->getnode($topbar1['search'], 'button','css_hover');

				$data['topbar1']['autosearch']['wrp']            = $factory->node($topbar1, 'search/autosearch/wrp', 1);
				$data['topbar1']['autosearch']['prd']            = $factory->node($topbar1, 'search/autosearch/prd', 1, 0, 'css_normal');
				$data['topbar1']['autosearch']['prd_h']          = $factory->node($topbar1, 'search/autosearch/prd', 1, 0, 'css_hover');
				$data['topbar1']['autosearch']['links']          = $factory->node($topbar1, 'search/autosearch/links', 0, 'color');
				$data['topbar1']['autosearch']['links_h']        = $factory->node($topbar1, 'search/autosearch/links_h', 0, 'color');
				$data['topbar1']['autosearch']['spl_price']      = $factory->node($topbar1, 'search/autosearch/spl_price', 0, 'color');
				$data['topbar1']['autosearch']['spl_price_h']    = $factory->node($topbar1, 'search/autosearch/spl_price_h', 0, 'color');
				$data['topbar1']['autosearch']['normal_price']   = $factory->node($topbar1, 'search/autosearch/normal_price', 0, 'color');
				$data['topbar1']['autosearch']['normal_price_h'] = $factory->node($topbar1, 'search/autosearch/normal_price_h', 0, 'color');
				$data['topbar1']['autosearch']['old_price']      = $factory->node($topbar1, 'search/autosearch/old_price', 0, 'color');
				$data['topbar1']['autosearch']['old_price_h']    = $factory->node($topbar1, 'search/autosearch/old_price_h', 0, 'color');
			}
		}
		
		if ($factory->has($topbarData, 'topbar2') && $this->chk($topbarData['topbar2'])) {
			$topbar2 = $topbarData['topbar2'];
			
			if (isset($topbar2['status']) && $topbar2['status']) {
				// Header css
				$data['topbar2']['header']                       = $factory->getnode($topbar2['header'], 'block');
				$data['topbar2']['header']                       .= $this->cssimgpath($factory->getnode($topbar2['header'], 'image'));
				
				$data['topbar2']['innerblock']                   = $factory->getnode($topbar2['header'], 'innerblock');
				$data['topbar2']['innerblock']                   .= $this->cssimgpath($factory->getnode($topbar2['header'], 'innerimage'));
				
				$data['topbar2']['uppertop']                     = $factory->getnode($topbar2['header'], 'uppertop');
				$data['topbar2']['bottomtop']                    = $factory->getnode($topbar2['header'], 'bottomtop');
				
				// Logo
				$data['topbar2']['logo']                         = $factory->getnode($topbar2, 'logo');

				// Mobile Header css
				$data['topbar2']['m_header']                     = $factory->node($topbar2, 'mob/header', 1);
				$data['topbar2']['m_logo']                       = $factory->node($topbar2, 'mob/logo', 1);
				$data['topbar2']['m_cart']                       = $factory->node($topbar2, 'mob/cart_block', 1);
				$data['topbar2']['m_search']                     = $factory->node($topbar2, 'mob/search_block', 1);

				// Top links left
				$data['topbar2']['toplinks_wrp']                 = $factory->getnode($topbar2['toplink'], 'block');
				$data['topbar2']['toplinks_normal']              = $factory->getnode($topbar2['toplink'], 'link_normal');
				$data['topbar2']['toplinks_hover']               = $factory->getnode($topbar2['toplink'], 'link_hover');
				
				// Top drop down
				$data['topbar2']['tdd']                          = $factory->getnode($topbar2['tdd'], 'dd', 'css_normal');
				$data['topbar2']['tdd_hover']                    = $factory->getnode($topbar2['tdd'], 'dd', 'css_hover');
				$data['topbar2']['tdd_sub']                      = $factory->getnode($topbar2['tdd'], 'dd_sub');
				$data['topbar2']['tdd_item']                     = $factory->getnode($topbar2['tdd'], 'dd_item_normal');
				$data['topbar2']['tdd_item_hover']               = $factory->getnode($topbar2['tdd'], 'dd_item_hover');
				
				// Cart
				$data['topbar2']['cart']                         = $factory->getnode($topbar2['cart'], 'block');
				$data['topbar2']['cart_h']                       = $factory->getnode($topbar2['cart'], 'block_h');
				$data['topbar2']['cart_icon']                    = $factory->getnode($topbar2['cart'], 'icon');
				$data['topbar2']['cart_popup']                   = $factory->getnode($topbar2['cart'], 'popup_block');
				$data['topbar2']['cart_popup_text']              = $this->cssprop($topbar2['cart']['popup_block_text'], 'color');
				$data['topbar2']['cart_popup_link']              = $this->cssprop($topbar2['cart']['popup_links']['normal'], 'color');
				$data['topbar2']['cart_popup_link_hover']        = $this->cssprop($topbar2['cart']['popup_links']['hover'], 'color');
				$data['topbar2']['cart_popup_border_color']      = $this->cssprop($topbar2['cart']['popup_border_color'], 'bdrcolor');
				$data['topbar2']['cart_popup_remove_color']      = $this->cssprop($topbar2['cart']['popup_remove_color'], 'color');
				
				$data['topbar2']['cart_popup_total_block']       = $factory->getnode($topbar2['cart'], 'popup_total_block');
				$data['topbar2']['cart_popup_total_text']        = $this->cssprop($topbar2['cart']['popup_total_text'], 'color');
				
				$data['topbar2']['cart_total_cartbtn']           = $factory->getnode($topbar2['cart'], 'popup_total_cartbtn', 'css_normal');
				$data['topbar2']['cart_total_cartbtn_hover']     = $factory->getnode($topbar2['cart'], 'popup_total_cartbtn', 'css_hover');
				
				$data['topbar2']['cart_total_checkoutbtn']       = $factory->getnode($topbar2['cart'], 'popup_total_checkoutbtn', 'css_normal');
				$data['topbar2']['cart_total_checkoutbtn_hover'] = $factory->getnode($topbar2['cart'], 'popup_total_checkoutbtn', 'css_hover');
				
				$data['topbar2']['top_search_wrp']               = $factory->getnode($topbar2['search'], 'block');
				$data['topbar2']['top_search_wrp_h']             = $factory->getnode($topbar2['search'], 'block_h');
				$data['topbar2']['top_search_input']             = $factory->getnode($topbar2['search'], 'input');
				$data['topbar2']['top_search_btn']               = $factory->getnode($topbar2['search'], 'button','css_normal');
				$data['topbar2']['top_search_btn_hover']         = $factory->getnode($topbar2['search'], 'button','css_hover');

				$data['topbar2']['autosearch']['wrp']            = $factory->node($topbar2, 'search/autosearch/wrp', 1);
				$data['topbar2']['autosearch']['prd']            = $factory->node($topbar2, 'search/autosearch/prd', 1, 0, 'css_normal');
				$data['topbar2']['autosearch']['prd_h']          = $factory->node($topbar2, 'search/autosearch/prd', 1, 0, 'css_hover');
				$data['topbar2']['autosearch']['links']          = $factory->node($topbar2, 'search/autosearch/links', 0, 'color');
				$data['topbar2']['autosearch']['links_h']        = $factory->node($topbar2, 'search/autosearch/links_h', 0, 'color');
				$data['topbar2']['autosearch']['spl_price']      = $factory->node($topbar2, 'search/autosearch/spl_price', 0, 'color');
				$data['topbar2']['autosearch']['spl_price_h']    = $factory->node($topbar2, 'search/autosearch/spl_price_h', 0, 'color');
				$data['topbar2']['autosearch']['normal_price']   = $factory->node($topbar2, 'search/autosearch/normal_price', 0, 'color');
				$data['topbar2']['autosearch']['normal_price_h'] = $factory->node($topbar2, 'search/autosearch/normal_price_h', 0, 'color');
				$data['topbar2']['autosearch']['old_price']      = $factory->node($topbar2, 'search/autosearch/old_price', 0, 'color');
				$data['topbar2']['autosearch']['old_price_h']    = $factory->node($topbar2, 'search/autosearch/old_price_h', 0, 'color');
			}
		}

		if ($factory->has($topbarData, 'topbar1_inner') && $this->chk($topbarData['topbar1_inner'])) {
			$topbar1_inner = $topbarData['topbar1_inner'];
			
			if (isset($topbar1_inner['status']) && $topbar1_inner['status']) {

				$data['topbar1_inner_status'] = $topbar1_inner['topbar_inner_status'];

				// Header css
				$data['topbar1_inner']['header']                       = $factory->getnode($topbar1_inner['header'], 'block');
				$data['topbar1_inner']['header']                      .= $this->cssimgpath($factory->getnode($topbar1_inner['header'], 'image'));
				
				$data['topbar1_inner']['innerblock']                   = $factory->getnode($topbar1_inner['header'], 'innerblock');
				$data['topbar1_inner']['innerblock']                  .= $this->cssimgpath($factory->getnode($topbar1_inner['header'], 'innerimage'));
				
				// Logo
				$data['topbar1_inner']['logo']                         = $factory->getnode($topbar1_inner, 'logo');

				// Mobile Header css
				$data['topbar1_inner']['m_header']                     = $factory->node($topbar1_inner, 'mob/header', 1);
				$data['topbar1_inner']['m_logo']                       = $factory->node($topbar1_inner, 'mob/logo', 1);
				$data['topbar1_inner']['m_cart']                       = $factory->node($topbar1_inner, 'mob/cart_block', 1);
				$data['topbar1_inner']['m_search']                     = $factory->node($topbar1_inner, 'mob/search_block', 1);
				
				// Breadcrumb
				$data['topbar1_inner']['breadcrumb_mainwrp']           = $factory->getnode($topbar1_inner['breadcrumb'], 'block_wrp');
				$data['topbar1_inner']['breadcrumb_wrp']               = $factory->getnode($topbar1_inner['breadcrumb'], 'block');
				$data['topbar1_inner']['breadcrumb_sep']               = $this->cssprop($topbar1_inner['breadcrumb']['sep'], 'color');
				$data['topbar1_inner']['breadcrumb_a']                 = $this->cssprop($topbar1_inner['breadcrumb']['link_normal'], 'color');
				$data['topbar1_inner']['breadcrumb_a_hover']           = $this->cssprop($topbar1_inner['breadcrumb']['link_hover'], 'color');
				
				// Top links left
				$data['topbar1_inner']['toplinks_wrp']                 = $factory->getnode($topbar1_inner['toplink'], 'block');
				$data['topbar1_inner']['toplinks_normal']              = $factory->getnode($topbar1_inner['toplink'], 'link_normal');
				$data['topbar1_inner']['toplinks_hover']               = $factory->getnode($topbar1_inner['toplink'], 'link_hover');
				
				// Top drop down
				$data['topbar1_inner']['tdd']                          = $factory->getnode($topbar1_inner['tdd'], 'dd', 'css_normal');
				$data['topbar1_inner']['tdd_hover']                    = $factory->getnode($topbar1_inner['tdd'], 'dd', 'css_hover');
				$data['topbar1_inner']['tdd_sub']                      = $factory->getnode($topbar1_inner['tdd'], 'dd_sub');
				$data['topbar1_inner']['tdd_item']                     = $factory->getnode($topbar1_inner['tdd'], 'dd_item_normal');
				$data['topbar1_inner']['tdd_item_hover']               = $factory->getnode($topbar1_inner['tdd'], 'dd_item_hover');
				
				// Cart
				$data['topbar1_inner']['cart']                         = $factory->getnode($topbar1_inner['cart'], 'block');
				$data['topbar1_inner']['cart_icon']                    = $factory->getnode($topbar1_inner['cart'], 'icon');
				$data['topbar1_inner']['cart_popup']                   = $factory->getnode($topbar1_inner['cart'], 'popup_block');
				$data['topbar1_inner']['cart_popup_text']              = $this->cssprop($topbar1_inner['cart']['popup_block_text'], 'color');
				$data['topbar1_inner']['cart_popup_link']              = $this->cssprop($topbar1_inner['cart']['popup_links']['normal'], 'color');
				$data['topbar1_inner']['cart_popup_link_hover']        = $this->cssprop($topbar1_inner['cart']['popup_links']['hover'], 'color');
				$data['topbar1_inner']['cart_popup_border_color']      = $this->cssprop($topbar1_inner['cart']['popup_border_color'], 'bdrcolor');
				$data['topbar1_inner']['cart_popup_remove_color']      = $this->cssprop($topbar1_inner['cart']['popup_remove_color'], 'color');
				
				$data['topbar1_inner']['cart_popup_total_block']       = $factory->getnode($topbar1_inner['cart'], 'popup_total_block');
				$data['topbar1_inner']['cart_popup_total_text']        = $this->cssprop($topbar1_inner['cart']['popup_total_text'], 'color');
				
				$data['topbar1_inner']['cart_total_cartbtn']           = $factory->getnode($topbar1_inner['cart'], 'popup_total_cartbtn', 'css_normal');
				$data['topbar1_inner']['cart_total_cartbtn_hover']     = $factory->getnode($topbar1_inner['cart'], 'popup_total_cartbtn', 'css_hover');
				
				$data['topbar1_inner']['cart_total_checkoutbtn']       = $factory->getnode($topbar1_inner['cart'], 'popup_total_checkoutbtn', 'css_normal');
				$data['topbar1_inner']['cart_total_checkoutbtn_hover'] = $factory->getnode($topbar1_inner['cart'], 'popup_total_checkoutbtn', 'css_hover');
				
				$data['topbar1_inner']['top_search_wrp']               = $factory->getnode($topbar1_inner['search'], 'block');
				$data['topbar1_inner']['top_search_wrp_h']             = $factory->node($topbar1_inner, 'search/block_h', 1);
				$data['topbar1_inner']['top_search_input']             = $factory->getnode($topbar1_inner['search'], 'input');
				$data['topbar1_inner']['top_search_btn']               = $factory->getnode($topbar1_inner['search'], 'button','css_normal');
				$data['topbar1_inner']['top_search_btn_hover']         = $factory->getnode($topbar1_inner['search'], 'button','css_hover');
			}

		} else { $data['topbar1_inner_status'] = 'y'; }

		if ($factory->has($topbarData, 'topbar2_inner') && $this->chk($topbarData['topbar2_inner'])) {
			$topbar2_inner = $topbarData['topbar2_inner'];
			
			if (isset($topbar2_inner['status']) && $topbar2_inner['status']) {
				$data['topbar2_inner_status'] = $topbar2_inner['topbar_inner_status'];

				// Header css
				$data['topbar2_inner']['header']                       = $factory->getnode($topbar2_inner['header'], 'block');
				$data['topbar2_inner']['header']                       .= $this->cssimgpath($factory->getnode($topbar2_inner['header'], 'image'));
				
				$data['topbar2_inner']['innerblock']                   = $factory->getnode($topbar2_inner['header'], 'innerblock');
				$data['topbar2_inner']['innerblock']                   .= $this->cssimgpath($factory->getnode($topbar2_inner['header'], 'innerimage'));
				
				$data['topbar2_inner']['uppertop']                     = $factory->getnode($topbar2_inner['header'], 'uppertop');
				$data['topbar2_inner']['bottomtop']                    = $factory->getnode($topbar2_inner['header'], 'bottomtop');

				// Mobile Header css
				$data['topbar2_inner']['m_header']                     = $factory->node($topbar2_inner, 'mob/header', 1);
				$data['topbar2_inner']['m_logo']                       = $factory->node($topbar2_inner, 'mob/logo', 1);
				$data['topbar2_inner']['m_cart']                       = $factory->node($topbar2_inner, 'mob/cart_block', 1);
				$data['topbar2_inner']['m_search']                     = $factory->node($topbar2_inner, 'mob/search_block', 1);
				
				// Logo
				$data['topbar2_inner']['logo']                         = $factory->getnode($topbar2_inner, 'logo');
				
				// Breadcrumb
				$data['topbar2_inner']['breadcrumb_mainwrp']           = $factory->getnode($topbar2_inner['breadcrumb'], 'block_wrp');
				$data['topbar2_inner']['breadcrumb_wrp']               = $factory->getnode($topbar2_inner['breadcrumb'], 'block');
				$data['topbar2_inner']['breadcrumb_sep']               = $this->cssprop($topbar2_inner['breadcrumb']['sep'], 'color');
				$data['topbar2_inner']['breadcrumb_a']                 = $this->cssprop($topbar2_inner['breadcrumb']['link_normal'], 'color');
				$data['topbar2_inner']['breadcrumb_a_hover']           = $this->cssprop($topbar2_inner['breadcrumb']['link_hover'], 'color');
				
				// Top links left
				$data['topbar2_inner']['toplinks_wrp']                 = $factory->getnode($topbar2_inner['toplink'], 'block');
				$data['topbar2_inner']['toplinks_normal']              = $factory->getnode($topbar2_inner['toplink'], 'link_normal');
				$data['topbar2_inner']['toplinks_hover']               = $factory->getnode($topbar2_inner['toplink'], 'link_hover');
				
				// Top drop down
				$data['topbar2_inner']['tdd']                          = $factory->getnode($topbar2_inner['tdd'], 'dd', 'css_normal');
				$data['topbar2_inner']['tdd_hover']                    = $factory->getnode($topbar2_inner['tdd'], 'dd', 'css_hover');
				$data['topbar2_inner']['tdd_sub']                      = $factory->getnode($topbar2_inner['tdd'], 'dd_sub');
				$data['topbar2_inner']['tdd_item']                     = $factory->getnode($topbar2_inner['tdd'], 'dd_item_normal');
				$data['topbar2_inner']['tdd_item_hover']               = $factory->getnode($topbar2_inner['tdd'], 'dd_item_hover');
				
				// Cart
				$data['topbar2_inner']['cart']                         = $factory->getnode($topbar2_inner['cart'], 'block');
				$data['topbar2_inner']['cart_h']                       = $factory->getnode($topbar2_inner['cart'], 'block_h');
				$data['topbar2_inner']['cart_icon']                    = $factory->getnode($topbar2_inner['cart'], 'icon');
				$data['topbar2_inner']['cart_popup']                   = $factory->getnode($topbar2_inner['cart'], 'popup_block');
				$data['topbar2_inner']['cart_popup_text']              = $this->cssprop($topbar2_inner['cart']['popup_block_text'], 'color');
				$data['topbar2_inner']['cart_popup_link']              = $this->cssprop($topbar2_inner['cart']['popup_links']['normal'], 'color');
				$data['topbar2_inner']['cart_popup_link_hover']        = $this->cssprop($topbar2_inner['cart']['popup_links']['hover'], 'color');
				$data['topbar2_inner']['cart_popup_border_color']      = $this->cssprop($topbar2_inner['cart']['popup_border_color'], 'bdrcolor');
				$data['topbar2_inner']['cart_popup_remove_color']      = $this->cssprop($topbar2_inner['cart']['popup_remove_color'], 'color');
				
				$data['topbar2_inner']['cart_popup_total_block']       = $factory->getnode($topbar2_inner['cart'], 'popup_total_block');
				$data['topbar2_inner']['cart_popup_total_text']        = $this->cssprop($topbar2_inner['cart']['popup_total_text'], 'color');
				
				$data['topbar2_inner']['cart_total_cartbtn']           = $factory->getnode($topbar2_inner['cart'], 'popup_total_cartbtn', 'css_normal');
				$data['topbar2_inner']['cart_total_cartbtn_hover']     = $factory->getnode($topbar2_inner['cart'], 'popup_total_cartbtn', 'css_hover');
				
				$data['topbar2_inner']['cart_total_checkoutbtn']       = $factory->getnode($topbar2_inner['cart'], 'popup_total_checkoutbtn', 'css_normal');
				$data['topbar2_inner']['cart_total_checkoutbtn_hover'] = $factory->getnode($topbar2_inner['cart'], 'popup_total_checkoutbtn', 'css_hover');
				
				$data['topbar2_inner']['top_search_wrp']               = $factory->getnode($topbar2_inner['search'], 'block');
				$data['topbar2_inner']['top_search_wrp_h']             = $factory->getnode($topbar2_inner['search'], 'block_h');
				$data['topbar2_inner']['top_search_input']             = $factory->getnode($topbar2_inner['search'], 'input');
				$data['topbar2_inner']['top_search_btn']               = $factory->getnode($topbar2_inner['search'], 'button','css_normal');
				$data['topbar2_inner']['top_search_btn_hover']         = $factory->getnode($topbar2_inner['search'], 'button','css_hover');
			}
			
		} else { $data['topbar2_inner_status'] = 'y'; }

		/* Footer CSS 
		------------------------*/
		$footer = $this->rgen->storage->get('theme_data', 'rgen_footer');
		if ($factory->has($footer, 'default_ft_general') && $this->chk($footer['default_ft_general'])) {
			$df_ft_general = $footer['default_ft_general'];
			if (isset($df_ft_general['status']) && $df_ft_general['status']) {
				$data['df_ft_general']['main_wrp']         = $factory->getnode($df_ft_general, 'main_wrp');
				$data['df_ft_general']['main_wrp']        .= $this->cssimgpath($factory->getnode($df_ft_general, 'main_wrp_bgimg'));
				
				$data['df_ft_general']['top_wrp']          = $factory->getnode($df_ft_general, 'top_wrp');
				$data['df_ft_general']['top_wrp']         .= $this->cssimgpath($factory->getnode($df_ft_general, 'top_wrp_bgimg'));
				$data['df_ft_general']['top_a']            = $this->cssprop($df_ft_general['top_a'], 'color');
				$data['df_ft_general']['top_a_hover']      = $this->cssprop($df_ft_general['top_a_hover'], 'color');
				
				$data['df_ft_general']['bottom_wrp']       = $factory->getnode($df_ft_general, 'bottom_wrp');
				$data['df_ft_general']['bottom_wrp']      .= $this->cssimgpath($factory->getnode($df_ft_general, 'bottom_wrp_bgimg'));
				$data['df_ft_general']['bottom_a']         = $this->cssprop($df_ft_general['bottom_a'], 'color');
				$data['df_ft_general']['bottom_a_hover']   = $this->cssprop($df_ft_general['bottom_a_hover'], 'color');

				$data['df_ft_general']['cp_block']['wrp']       = $factory->node($df_ft_general, 'cp_block/wrp', 1);
				$data['df_ft_general']['cp_block']['container'] = $factory->node($df_ft_general, 'cp_block/container', 1);
			}
		}
		if ($factory->has($footer, 'default_ft_contactinfo') && $this->chk($footer['default_ft_contactinfo'])) {
			$df_ft_contactinfo = $footer['default_ft_contactinfo'];
			if (isset($df_ft_contactinfo['status']) && $df_ft_contactinfo['status']) {
				$data['df_ft_contactinfo']['block']       = $factory->getnode($df_ft_contactinfo, 'block');
				$data['df_ft_contactinfo']['block']      .= $this->cssprop($df_ft_contactinfo['text_color'], 'color');
				$data['df_ft_contactinfo']['icon_blocks'] = $this->cssimgpath($factory->getnode($df_ft_contactinfo, 'icon_blocks'));
				
				$data['df_ft_contactinfo']['a']           = $this->cssprop($df_ft_contactinfo['a'], 'color');
				$data['df_ft_contactinfo']['a_hover']     = $this->cssprop($df_ft_contactinfo['a_hover'], 'color');
				
				$data['df_ft_contactinfo']['phone_icon']  = $this->cssimgpath($factory->getnode($df_ft_contactinfo, 'phone_icon'));
				$data['df_ft_contactinfo']['fax_icon']    = $this->cssimgpath($factory->getnode($df_ft_contactinfo, 'fax_icon'));
				$data['df_ft_contactinfo']['mail_icon']   = $this->cssimgpath($factory->getnode($df_ft_contactinfo, 'mail_icon'));
			}
		}
		if ($factory->has($footer, 'default_ft_social') && $this->chk($footer['default_ft_social'])) {
			$df_ft_social = $footer['default_ft_social'];

			if (isset($df_ft_social['status']) && $df_ft_social['status']) {
				$data['df_ft_social']['icon_blocks']       = $factory->getnode($df_ft_social, 'icon_blocks', 'css_normal');
				$data['df_ft_social']['icon_blocks_hover']       = $factory->getnode($df_ft_social, 'icon_blocks', 'css_hover');

				if (isset($df_ft_social['network']) && sizeof($df_ft_social['network']) > 0) {
					foreach ($df_ft_social['network'] as $key => $value) {
						$data['df_ft_social_icons'][] = $this->cssimgpath($factory->getnode($value, 'icon'));
					}
				}
			}
			
		}

		/* Product boxes
		------------------------*/
		include_once($this->rgen->customize_prdblocks);
		$data['css_fn_prdblocks'] = $this->rgen->css_fn_prdblocks;
		$data['css_prdblocks']    = $this->rgen->css_prdblocks;

		/* Quick view
		------------------------*/
		include_once($this->rgen->customize_quickview);
		$data['css_quickview']    = $this->rgen->css_quickview;
		
		/* Pages - Category
		------------------------*/
		$pages = $storage->get('theme_data', 'rgen_page');
		if ($factory->has($pages, 'category') && $this->chk($pages['category'])) {
			$pg_category = $pages['category'];
			
			if (isset($pg_category['status']) && $pg_category['status']) {
				$data['pg_category']['catinfo']             = $factory->getnode($pg_category['cat_info'], 'block');
				
				$data['pg_category']['refine1_block']       = $factory->getnode($pg_category['refine_search']['refine1'], 'block');
				$data['pg_category']['refine1_title']       = $factory->getnode($pg_category['refine_search']['refine1'], 'title');
				$data['pg_category']['refine1_links']       = $factory->getnode($pg_category['refine_search']['refine1'], 'catlink_normal');
				$data['pg_category']['refine1_links_hover'] = $factory->getnode($pg_category['refine_search']['refine1'], 'catlink_hover');

				$data['pg_category']['refine2_block']       = $factory->node($pg_category, 'refine_search/refine2/block', 1);
				$data['pg_category']['refine2_title']       = $factory->node($pg_category, 'refine_search/refine2/title', 1);
				$data['pg_category']['refine2_links']       = $factory->node($pg_category, 'refine_search/refine2/catlink_normal', 1);
				$data['pg_category']['refine2_links_hover'] = $factory->node($pg_category, 'refine_search/refine2/catlink_hover', 1);
			}
		}

		/* Pages - Product
		------------------------*/
		if ($factory->has($pages, 'prdpg_general') && $this->chk($pages['prdpg_general'])) {
			$prdpg_general = $pages['prdpg_general'];
			if (isset($prdpg_general['status']) && $prdpg_general['status']) {
				
				$data['prdpg_general']['main_wrp']       = $factory->node($prdpg_general, 'structure/wrp', 1);
				$data['prdpg_general']['main_rw']        = $factory->node($prdpg_general, 'structure/rw', 1);
				$data['prdpg_general']['l_wrp']          = $factory->node($prdpg_general, 'structure/l_wrp', 1);
				$data['prdpg_general']['r_wrp']          = $factory->node($prdpg_general, 'structure/r_wrp', 1);
				$data['prdpg_general']['l_in']           = $factory->node($prdpg_general, 'structure/l_in', 1);
				$data['prdpg_general']['r_in']           = $factory->node($prdpg_general, 'structure/r_in', 1);

				$data['prdpg_general']['pg_heading_wrp']      = $factory->node($prdpg_general, 'pg_heading/block', 1);
				$data['prdpg_general']['pg_heading_wrp']     .= $this->cssimgpath($factory->node($prdpg_general, 'pg_heading/block_img', 1));
				$data['prdpg_general']['breadcrumb_wrp']      = $factory->node($prdpg_general, 'pg_heading/breadcrumb/block', 1);
				$data['prdpg_general']['breadcrumb_sep']      = $factory->node($prdpg_general, 'pg_heading/breadcrumb/sep', 0, 'color');
				$data['prdpg_general']['breadcrumb_a']        = $factory->node($prdpg_general, 'pg_heading/breadcrumb/link_normal', 0,'color');
				$data['prdpg_general']['breadcrumb_a_hover']  = $factory->node($prdpg_general, 'pg_heading/breadcrumb/link_hover', 0,'color');
				
				$data['prdpg_general']['iteminfo_block'] = $factory->getnode($prdpg_general['item_info'], 'block');
				
				$data['prdpg_general']['title']          = $factory->getnode($prdpg_general, 'title');
				$data['prdpg_general']['hr']             = $factory->getnode($prdpg_general, 'hr');
				$data['prdpg_general']['hr']            .= $this->cssimgpath($factory->getnode($prdpg_general, 'hr_img'));
				
				$data['prdpg_general']['iteminfo_item']  = $factory->getnode($prdpg_general['item_info'], 'item');
				$data['prdpg_general']['iteminfo_lbl']   = $factory->getnode($prdpg_general['item_info'], 'item_lbl');
				
				$data['prdpg_general']['tags_a']         = $factory->getnode($prdpg_general, 'tags', 'css_normal');
				$data['prdpg_general']['tags_a_hover']   = $factory->getnode($prdpg_general, 'tags', 'css_hover');
				
				$data['prdpg_general']['rating_block']   = $factory->getnode($prdpg_general['rating'], 'block');
				$data['prdpg_general']['rating_normal']  = $factory->getnode($prdpg_general['rating'], 'stars_normal');
				$data['prdpg_general']['rating_active']  = $factory->getnode($prdpg_general['rating'], 'stars_active');
				$data['prdpg_general']['rating_a']       = $this->cssprop($prdpg_general['rating']['a'], 'color');
				$data['prdpg_general']['rating_a_hover'] = $this->cssprop($prdpg_general['rating']['a_hover'], 'color');
			}
		}
		// Main image
		if ($factory->has($pages, 'prdpg_main_img') && $this->chk($pages['prdpg_main_img'])) {
			$prdpg_main_img = $pages['prdpg_main_img'];
			if (isset($prdpg_main_img['status']) && $prdpg_main_img['status']) {
				$data['prdpg_main_img']['outer_block']   = $factory->getnode($prdpg_main_img, 'outer_block');
				$data['prdpg_main_img']['main_img_wrp']  = $factory->getnode($prdpg_main_img, 'main_img_wrp');
				$data['prdpg_main_img']['main_img']      = $factory->getnode($prdpg_main_img, 'main_img');
				$data['prdpg_main_img']['th_wrp']        = $factory->getnode($prdpg_main_img, 'th_wrp');
				$data['prdpg_main_img']['th_img']        = $factory->getnode($prdpg_main_img, 'th_img');
				$data['prdpg_main_img']['th_active']     = $factory->getnode($prdpg_main_img, 'th_active');
				$data['prdpg_main_img']['th_active_img'] = $factory->node($prdpg_main_img, 'th_img_active', 0,'bdrcolor');
				$data['prdpg_main_img']['arrow_wrp']     = $factory->getnode($prdpg_main_img, 'arrow_wrp');
				$data['prdpg_main_img']['arrow_line']    = $this->cssprop($prdpg_main_img['arrow_line'], 'bdrcolor');
				$data['prdpg_main_img']['arrows']        = $factory->getnode($prdpg_main_img, 'arrows', 'css_normal');
				$data['prdpg_main_img']['arrows_hover']  = $factory->getnode($prdpg_main_img, 'arrows', 'css_hover');

			}
		}
		// Tabs
		if ($factory->has($pages, 'prdpg_tabs') && $this->chk($pages['prdpg_tabs'])) {
			$prdpg_tabs = $pages['prdpg_tabs'];
			if (isset($prdpg_tabs['status']) && $prdpg_tabs['status']) {
				
				$data['prdpg_tabs']['tabs']['bar']       = $factory->getnode($prdpg_tabs['tabs'], 'bar');
				$data['prdpg_tabs']['tabs']['item']      = $factory->getnode($prdpg_tabs['tabs'], 'item');
				$data['prdpg_tabs']['tabs']['active']    = $factory->getnode($prdpg_tabs['tabs'], 'active');

				$data['prdpg_tabs']['tabs']['item_wrp']      = $factory->node($prdpg_tabs, 'tabs/item_wrp', 1);
				$data['prdpg_tabs']['tabs']['active_wrp']    = $factory->node($prdpg_tabs, 'tabs/active_wrp', 1);

				$data['prdpg_tabs']['tabs']['container'] = $factory->getnode($prdpg_tabs['tabs'], 'container');
				$data['prdpg_tabs']['tabs']['pane']      = $factory->getnode($prdpg_tabs['tabs'], 'pane');

				if ($factory->has($prdpg_tabs['table_style'], 'table')) {
					$table = $prdpg_tabs['table_style']['table'];
					$data['prdpg_tabs']['table_style']['table']  = $this->cssprop($table['background'], 'bgcolor');
					$data['prdpg_tabs']['table_style']['table'] .= $factory->getnode($table, 'border');
				}
				if ($factory->has($prdpg_tabs['table_style'], 'th')) {
					$thead = $prdpg_tabs['table_style']['th'];
					$data['prdpg_tabs']['table_style']['thead']       = $factory->getnode($thead, 'block');
					$data['prdpg_tabs']['table_style']['thead_first'] = $factory->getnode($thead, 'first');
					$data['prdpg_tabs']['table_style']['thead_last']  = $factory->getnode($thead, 'last');
				}
				if ($factory->has($prdpg_tabs['table_style'], 'td')) {
					$tbody = $prdpg_tabs['table_style']['td'];
					$data['prdpg_tabs']['table_style']['tbody']       = $factory->getnode($tbody, 'block');
					$data['prdpg_tabs']['table_style']['tbody_first'] = $factory->getnode($tbody, 'first');
					$data['prdpg_tabs']['table_style']['tbody_last']  = $factory->getnode($tbody, 'last');
				}

				$data['prdpg_tabs']['review_tab']['block']                = $factory->getnode($prdpg_tabs['review_tab'], 'block');
				$data['prdpg_tabs']['review_tab']['comment_block']        = $factory->getnode($prdpg_tabs['review_tab']['comment'], 'block');
				$data['prdpg_tabs']['review_tab']['comment_title']        = $factory->getnode($prdpg_tabs['review_tab']['comment'], 'title');
				$data['prdpg_tabs']['review_tab']['comment_txt']          = $factory->getnode($prdpg_tabs['review_tab']['comment'], 'comment');
				$data['prdpg_tabs']['review_tab']['comment_stars_normal'] = $this->cssprop($prdpg_tabs['review_tab']['comment']['stars_normal'], 'color');
				$data['prdpg_tabs']['review_tab']['comment_stars_active'] = $this->cssprop($prdpg_tabs['review_tab']['comment']['stars_active'], 'color');
				
				$data['prdpg_tabs']['review_tab']['pagination_wrp']       = $factory->getnode($prdpg_tabs['review_tab']['pagination'], 'wrapper');
				$data['prdpg_tabs']['review_tab']['pagination_block']     = $factory->getnode($prdpg_tabs['review_tab']['pagination'], 'block');
				$data['prdpg_tabs']['review_tab']['pagination_active']    = $factory->getnode($prdpg_tabs['review_tab']['pagination'], 'active');
				$data['prdpg_tabs']['review_tab']['pagination_normal']    = $factory->getnode($prdpg_tabs['review_tab']['pagination'], 'normal');
				
				$data['prdpg_tabs']['review_tab']['frm_block']            = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'block');
				$data['prdpg_tabs']['review_tab']['frm_hd']               = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'hd');
				$data['prdpg_tabs']['review_tab']['frm_fields']           = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'fields');
				$data['prdpg_tabs']['review_tab']['frm_label']            = $this->cssprop($prdpg_tabs['review_tab']['frm']['label'], 'color');
				$data['prdpg_tabs']['review_tab']['frm_rating']           = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'rating');
				$data['prdpg_tabs']['review_tab']['frm_rating_lbl']       = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'rating_lbl');
				$data['prdpg_tabs']['review_tab']['frm_rating_count']     = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'rating_count');
				$data['prdpg_tabs']['review_tab']['frm_btn']              = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'btn', 'css_normal');
				$data['prdpg_tabs']['review_tab']['frm_btn_hover']        = $factory->getnode($prdpg_tabs['review_tab']['frm'], 'btn', 'css_hover');
			}
		}
		// Product options
		if ($factory->has($pages, 'prdpg_options') && $this->chk($pages['prdpg_options'])) {
			$prdpg_options = $pages['prdpg_options'];
			if (isset($prdpg_options['status']) && $prdpg_options['status']) {
				$data['prdpg_options']['block']         = $factory->getnode($prdpg_options, 'block');
				$data['prdpg_options']['hd']            = $factory->getnode($prdpg_options, 'hd');
				$data['prdpg_options']['frm_group']     = $factory->getnode($prdpg_options, 'frm_group');
				$data['prdpg_options']['frm_lbl']       = $factory->getnode($prdpg_options, 'frm_lbl');
				$data['prdpg_options']['frm_fields']    = $factory->getnode($prdpg_options, 'frm_fields');
				$data['prdpg_options']['frm_ctrls']     = $factory->getnode($prdpg_options, 'frm_ctrls');
				$data['prdpg_options']['frm_btn']       = $factory->getnode($prdpg_options, 'frm_btn', 'css_normal');
				$data['prdpg_options']['frm_btn_hover'] = $factory->getnode($prdpg_options, 'frm_btn', 'css_hover');
			}
		}
		// Product quantity block
		if ($factory->has($pages, 'prdpg_qty') && $this->chk($pages['prdpg_qty'])) {
			$prdpg_qty = $pages['prdpg_qty'];
			if (isset($prdpg_qty['status']) && $prdpg_qty['status']) {
				$data['prdpg_qty']['block']          = $factory->getnode($prdpg_qty, 'block');
				$data['prdpg_qty']['qty_lbl']        = $factory->getnode($prdpg_qty, 'qty_lbl');
				$data['prdpg_qty']['qty_block']      = $factory->getnode($prdpg_qty, 'qty_block');
				$data['prdpg_qty']['qty_input']      = $factory->getnode($prdpg_qty, 'qty_input');
				
				$data['prdpg_qty']['qty_btn']        = $factory->getnode($prdpg_qty, 'qty_btn', 'css_normal');
				$data['prdpg_qty']['qty_btn_hover']  = $factory->getnode($prdpg_qty, 'qty_btn', 'css_hover');
				
				$data['prdpg_qty']['cart_btn_ico']   = $this->cssimgpath($factory->getnode($prdpg_qty, 'cart_icon'));
				$data['prdpg_qty']['cart_btn']       = $factory->getnode($prdpg_qty, 'cart_btn', 'css_normal');
				$data['prdpg_qty']['cart_btn_hover'] = $factory->getnode($prdpg_qty, 'cart_btn', 'css_hover');
				
				$data['prdpg_qty']['links']          = $this->cssprop($prdpg_qty['links'], 'color');
				$data['prdpg_qty']['links_h']        = $this->cssprop($prdpg_qty['links_h'], 'color');
				
				/*$data['prdpg_qty']['wish_btn_ico']      = $this->cssimgpath($factory->getnode($prdpg_qty, 'wish_icon'));
				$data['prdpg_qty']['wish_btn']          = $factory->getnode($prdpg_qty, 'wish_btn', 'css_normal');
				$data['prdpg_qty']['wish_btn_hover']    = $factory->getnode($prdpg_qty, 'wish_btn', 'css_hover');
				
				$data['prdpg_qty']['compare_btn_ico']   = $this->cssimgpath($factory->getnode($prdpg_qty, 'compare_icon'));
				$data['prdpg_qty']['compare_btn']       = $factory->getnode($prdpg_qty, 'compare_btn', 'css_normal');
				$data['prdpg_qty']['compare_btn_hover'] = $factory->getnode($prdpg_qty, 'compare_btn', 'css_hover');*/
			}
		}
		// Product layout 1
		if ($factory->has($pages, 'prdpg_ly1') && $this->chk($pages['prdpg_ly1'])) {
			$prdpg_ly1 = $pages['prdpg_ly1'];
			if (isset($prdpg_ly1['status']) && $prdpg_ly1['status']) {
				$data['prdpg_ly1']['price_wrapper'] = $factory->getnode($prdpg_ly1['price'], 'wrapper');
				$data['prdpg_ly1']['price_block']   = $factory->getnode($prdpg_ly1['price'], 'block');
				$data['prdpg_ly1']['price_spl']     = $factory->getnode($prdpg_ly1['price'], 'price_spl');
				$data['prdpg_ly1']['price_new']     = $factory->getnode($prdpg_ly1['price'], 'price_new');
				$data['prdpg_ly1']['price_old']     = $factory->getnode($prdpg_ly1['price'], 'price_old');
				$data['prdpg_ly1']['price_tax']     = $factory->getnode($prdpg_ly1['price'], 'price_tax');
				$data['prdpg_ly1']['reward']        = $this->cssprop($prdpg_ly1['price']['reward'], 'color');
				
				$data['prdpg_ly1']['discount']      = $factory->getnode($prdpg_ly1['price'], 'discount');
				$data['prdpg_ly1']['discount_item']      = $factory->getnode($prdpg_ly1['price'], 'discount_items');


				$data['prdpg_ly1']['info_link_block']  = $factory->getnode($prdpg_ly1['info_links'], 'block');
				$data['prdpg_ly1']['info_links']       = $factory->getnode($prdpg_ly1['info_links'], 'links', 'css_normal');
				$data['prdpg_ly1']['info_links_hover'] = $factory->getnode($prdpg_ly1['info_links'], 'links', 'css_hover');
			}
		}

		// Product layout 2
		if ($factory->has($pages, 'prdpg_ly2') && $this->chk($pages['prdpg_ly2'])) {
			$prdpg_ly2 = $pages['prdpg_ly2'];
			if (isset($prdpg_ly2['status']) && $prdpg_ly2['status']) {
				$data['prdpg_ly2']['price_wrapper'] = $factory->getnode($prdpg_ly2['price'], 'wrapper');
				$data['prdpg_ly2']['price_block']   = $factory->getnode($prdpg_ly2['price'], 'block');
				$data['prdpg_ly2']['price_spl']     = $factory->getnode($prdpg_ly2['price'], 'price_spl');
				$data['prdpg_ly2']['price_new']     = $factory->getnode($prdpg_ly2['price'], 'price_new');
				$data['prdpg_ly2']['price_old']     = $factory->getnode($prdpg_ly2['price'], 'price_old');
				$data['prdpg_ly2']['price_tax']     = $factory->getnode($prdpg_ly2['price'], 'price_tax');
				$data['prdpg_ly2']['reward']        = $this->cssprop($prdpg_ly2['price']['reward'], 'color');

				$data['prdpg_ly2']['discount']      = $factory->getnode($prdpg_ly2['price'], 'discount');
				$data['prdpg_ly2']['discount_item']      = $factory->getnode($prdpg_ly2['price'], 'discount_items');

				$data['prdpg_ly2']['info_link_block']  = $factory->getnode($prdpg_ly2['info_links'], 'block');
				$data['prdpg_ly2']['info_links']       = $factory->getnode($prdpg_ly2['info_links'], 'links', 'css_normal');
				$data['prdpg_ly2']['info_links_hover'] = $factory->getnode($prdpg_ly2['info_links'], 'links', 'css_hover');
			}
		}

		// Product layout 3
		if ($factory->has($pages, 'prdpg_ly3') && $this->chk($pages['prdpg_ly3'])) {
			$prdpg_ly3 = $pages['prdpg_ly3'];
			if (isset($prdpg_ly3['status']) && $prdpg_ly3['status']) {
				$data['prdpg_ly3']['price_wrapper']  = $factory->getnode($prdpg_ly3['price'], 'wrapper');
				$data['prdpg_ly3']['price_block']    = $factory->getnode($prdpg_ly3['price'], 'block');
				$data['prdpg_ly3']['price_spl']      = $factory->getnode($prdpg_ly3['price'], 'price_spl');
				$data['prdpg_ly3']['price_new']      = $factory->getnode($prdpg_ly3['price'], 'price_new');
				$data['prdpg_ly3']['price_old']      = $factory->getnode($prdpg_ly3['price'], 'price_old');
				$data['prdpg_ly3']['price_tax']      = $factory->getnode($prdpg_ly3['price'], 'price_tax');
				$data['prdpg_ly3']['offer_info']     = $factory->getnode($prdpg_ly3, 'offer_info');
				$data['prdpg_ly3']['reward']         = $this->cssprop($prdpg_ly3['reward'], 'color');
				$data['prdpg_ly3']['discount']       = $this->cssprop($prdpg_ly3['discount'], 'color');
				
				$data['prdpg_ly3']['rating_block']   = $factory->getnode($prdpg_ly3['rating'], 'block');
				$data['prdpg_ly3']['rating_normal']  = $factory->getnode($prdpg_ly3['rating'], 'stars_normal');
				$data['prdpg_ly3']['rating_active']  = $factory->getnode($prdpg_ly3['rating'], 'stars_active');
				$data['prdpg_ly3']['rating_a']       = $this->cssprop($prdpg_ly3['rating']['a'], 'color');
				$data['prdpg_ly3']['rating_a_hover'] = $this->cssprop($prdpg_ly3['rating']['a_hover'], 'color');
				
			}
		}

		// Product layout 4
		if ($factory->has($pages, 'prdpg_ly4') && $this->chk($pages['prdpg_ly4'])) {
			$prdpg_ly4 = $pages['prdpg_ly4'];
			if (isset($prdpg_ly4['status']) && $prdpg_ly4['status']) {
				$data['prdpg_ly4']['price_wrapper']  = $factory->getnode($prdpg_ly4['price'], 'wrapper');
				$data['prdpg_ly4']['price_block']    = $factory->getnode($prdpg_ly4['price'], 'block');
				$data['prdpg_ly4']['price_spl']      = $factory->getnode($prdpg_ly4['price'], 'price_spl');
				$data['prdpg_ly4']['price_new']      = $factory->getnode($prdpg_ly4['price'], 'price_new');
				$data['prdpg_ly4']['price_old']      = $factory->getnode($prdpg_ly4['price'], 'price_old');
				$data['prdpg_ly4']['price_tax']      = $factory->getnode($prdpg_ly4['price'], 'price_tax');
				$data['prdpg_ly4']['reward']         = $this->cssprop($prdpg_ly4['price']['reward'], 'color');
				$data['prdpg_ly4']['discount']       = $this->cssprop($prdpg_ly4['price']['discount'], 'color');
				
				$data['prdpg_ly4']['rating_block']   = $factory->getnode($prdpg_ly4['rating'], 'block');
				$data['prdpg_ly4']['rating_normal']  = $factory->getnode($prdpg_ly4['rating'], 'stars_normal');
				$data['prdpg_ly4']['rating_active']  = $factory->getnode($prdpg_ly4['rating'], 'stars_active');
				$data['prdpg_ly4']['rating_a']       = $this->cssprop($prdpg_ly4['rating']['a'], 'color');
				$data['prdpg_ly4']['rating_a_hover'] = $this->cssprop($prdpg_ly4['rating']['a_hover'], 'color');
				
				$data['prdpg_ly4']['iteminfo_block'] = $factory->getnode($prdpg_ly4['item_info'], 'block');
				$data['prdpg_ly4']['iteminfo_item']  = $factory->getnode($prdpg_ly4['item_info'], 'item');
				$data['prdpg_ly4']['iteminfo_lbl']   = $factory->getnode($prdpg_ly4['item_info'], 'item_lbl');
				
			}
		}



		/* Pages - Shopping cart
		------------------------*/
		if ($factory->has($pages, 'shoppingcart') && $this->chk($pages['shoppingcart'])) {
			$pg_shoppingcart = $pages['shoppingcart'];
			
			if (isset($pg_shoppingcart['status']) && $pg_shoppingcart['status']) {
				$data['pg_shoppingcart']['cart_title']    = $factory->getnode($pg_shoppingcart, 'cart_title');
				$data['pg_shoppingcart']['other_title']   = $factory->getnode($pg_shoppingcart, 'other_title');
				$data['pg_shoppingcart']['qty']           = $factory->getnode($pg_shoppingcart, 'qty');
				$data['pg_shoppingcart']['total_block']   = $factory->getnode($pg_shoppingcart, 'total_block');
				$data['pg_shoppingcart']['total_summary'] = $factory->getnode($pg_shoppingcart, 'total_summary');
				$data['pg_shoppingcart']['total']         = $factory->getnode($pg_shoppingcart, 'total');
			}
		}
		
		/* Pages - Checkout
		------------------------*/
		if ($factory->has($pages, 'checkout') && $this->chk($pages['checkout'])) {
			$pg_checkout = $pages['checkout'];
			if (isset($pg_checkout['status']) && $pg_checkout['status']) {
				$data['pg_checkout']['default_btn']       = $factory->getnode($pg_checkout, 'default_btn', 'css_normal');
				$data['pg_checkout']['default_btn_hover'] = $factory->getnode($pg_checkout, 'default_btn', 'css_hover');

				$data['pg_checkout']['panel_wrp']   = $factory->getnode($pg_checkout['panel'], 'panel_wrp');
				$data['pg_checkout']['title_block'] = $factory->getnode($pg_checkout['panel'], 'title_block');
				$data['pg_checkout']['title']       = $factory->getnode($pg_checkout['panel'], 'title');
				$data['pg_checkout']['body_wrp']    = $factory->getnode($pg_checkout['panel'], 'body_wrp');
				$data['pg_checkout']['body']        = $factory->getnode($pg_checkout['panel'], 'body');

				$data['pg_checkout']['frm_wrp']    = $factory->getnode($pg_checkout['forms'], 'block');
				$data['pg_checkout']['frm_title']  = $factory->getnode($pg_checkout['forms'], 'title');
				$data['pg_checkout']['frm_label']  = $factory->getnode($pg_checkout['forms'], 'label');
				$data['pg_checkout']['frm_ctrl']   = $factory->getnode($pg_checkout['forms'], 'form_control');
				$data['pg_checkout']['frm_btnbar'] = $factory->getnode($pg_checkout['forms'], 'button_bar');

				$data['pg_checkout']['table']       = $this->cssprop($pg_checkout['table_style']['table']['background'], 'bgcolor');
				$data['pg_checkout']['table']      .= $factory->getnode($pg_checkout['table_style']['table'], 'border');

				$data['pg_checkout']['thead']       = $factory->getnode($pg_checkout['table_style']['th'], 'block');
				$data['pg_checkout']['thead_first'] = $factory->getnode($pg_checkout['table_style']['th'], 'first');
				$data['pg_checkout']['thead_last']  = $factory->getnode($pg_checkout['table_style']['th'], 'last');

				$data['pg_checkout']['tbody']       = $factory->getnode($pg_checkout['table_style']['td'], 'block');
				$data['pg_checkout']['tbody_first'] = $factory->getnode($pg_checkout['table_style']['td'], 'first');
				$data['pg_checkout']['tbody_last']  = $factory->getnode($pg_checkout['table_style']['td'], 'last');
			}
			
		}

		/* Pages - Contact us
		------------------------*/
		if ($factory->has($pages, 'contactus') && $this->chk($pages['contactus'])) {
			$pg_contactus = $pages['contactus'];
			
			if (isset($pg_contactus['status']) && $pg_contactus['status']) {
				$data['pg_contactus']['info_block']  = $factory->getnode($pg_contactus, 'info_block');
				$data['pg_contactus']['info_hd']     = $factory->getnode($pg_contactus, 'info_hd');
				$data['pg_contactus']['info_sub_hd'] = $factory->getnode($pg_contactus, 'info_sub_hd');
				$data['pg_contactus']['img_block']   = $factory->getnode($pg_contactus, 'img_block');
			}
		}

		/* Pages - Brands
		------------------------*/
		if ($factory->has($pages, 'brands') && $this->chk($pages['brands'])) {
			$pg_brands = $pages['brands'];
			
			if (isset($pg_brands['status']) && $pg_brands['status']) {
				$data['pg_brands']['index']['block']  = $factory->getnode($pg_brands['index'], 'block');
				$data['pg_brands']['index']['hd']     = $factory->getnode($pg_brands['index'], 'hd');
				$data['pg_brands']['index']['atoz']   = $factory->getnode($pg_brands['index'], 'atoz', 'css_normal');
				$data['pg_brands']['index']['atoz_hover']   = $factory->getnode($pg_brands['index'], 'atoz', 'css_hover');
				
				$data['pg_brands']['list']['block']   = $factory->getnode($pg_brands['list'], 'block');
				$data['pg_brands']['list']['hd']      = $factory->getnode($pg_brands['list'], 'hd');
				$data['pg_brands']['list']['body']    = $factory->getnode($pg_brands['list'], 'body');
				$data['pg_brands']['list']['item']    = $factory->getnode($pg_brands['list'], 'item');
				$data['pg_brands']['list']['a']       = $this->cssprop($pg_brands['list']['a'], 'color');
				$data['pg_brands']['list']['a_hover'] = $this->cssprop($pg_brands['list']['a_hover'], 'color');
			}
		}

		/* Pages - Site map
		------------------------*/
		if ($factory->has($pages, 'sitemap') && $this->chk($pages['sitemap'])) {
			$pg_sitemap = $pages['sitemap'];
			
			if (isset($pg_sitemap['status']) && $pg_sitemap['status']) {
				$data['pg_sitemap']['main']       = $factory->getnode($pg_sitemap, 'main');
				$data['pg_sitemap']['left']       = $factory->getnode($pg_sitemap, 'left');
				$data['pg_sitemap']['right']      = $factory->getnode($pg_sitemap, 'right');
				$data['pg_sitemap']['main_links'] = $factory->getnode($pg_sitemap, 'main_links');
				$data['pg_sitemap']['sub_links']  = $factory->getnode($pg_sitemap, 'sub_links');
				$data['pg_sitemap']['a']          = $this->cssprop($pg_sitemap['a'], 'color');
				$data['pg_sitemap']['a_hover']    = $this->cssprop($pg_sitemap['a_hover'], 'color');

			}
		}

		/* Pages - Login
		------------------------*/
		if ($factory->has($pages, 'login') && $this->chk($pages['login'])) {
			$pg_login = $pages['login'];
			
			if (isset($pg_login['status']) && $pg_login['status']) {
				$data['pg_login']['new_block']     = $factory->getnode($pg_login['new_cust'], 'block');
				$data['pg_login']['new_hd']        = $factory->getnode($pg_login['new_cust'], 'hd');
				$data['pg_login']['new_btn']       = $factory->getnode($pg_login['new_cust'], 'btn', 'css_normal');
				$data['pg_login']['new_btn_hover'] = $factory->getnode($pg_login['new_cust'], 'btn', 'css_hover');
				
				$data['pg_login']['old_block']     = $factory->getnode($pg_login['old_cust'], 'block');
				$data['pg_login']['old_hd']        = $factory->getnode($pg_login['old_cust'], 'hd');
				$data['pg_login']['old_btn']       = $factory->getnode($pg_login['old_cust'], 'btn', 'css_normal');
				$data['pg_login']['old_btn_hover'] = $factory->getnode($pg_login['old_cust'], 'btn', 'css_hover');
				$data['pg_login']['old_label']     = $factory->getnode($pg_login['old_cust'], 'label');
				$data['pg_login']['old_fields']    = $factory->getnode($pg_login['old_cust'], 'fields');
			}
		}

		/* Theme - Featured OC module 
		------------------------*/
		$theme_ocmodule = $this->rgen->storage->get('theme_data', 'rgen_ocmodule');

		$ocmd_prdmod = array('featured', 'latest', 'best', 'special');
		$ocmd_prdstyles = array(
			'prd1'      => 'prd1_css', 
			'prd2'      => 'prd2_css', 
			'smallprd1' => 'smallprd1_css', 
			'smallprd2' => 'smallprd2_css'
		);
		foreach ($ocmd_prdmod as $v) {
			if ($factory->has($theme_ocmodule, 'ocmod_'.$v) && $this->chk($theme_ocmodule['ocmod_'.$v])) {
				
				if (isset($theme_ocmodule['ocmod_'.$v]['status']) && $theme_ocmodule['ocmod_'.$v]['status']) {
					$data['ocmd_'.$v]['wrapper'] = $factory->getnode($theme_ocmodule['ocmod_'.$v], 'wrapper');
					$data['ocmd_'.$v]['mod_hd']  = $factory->getnode($theme_ocmodule['ocmod_'.$v], 'mod_hd');
					$data['ocmd_'.$v]['prd_wrp'] = $factory->getnode($theme_ocmodule['ocmod_'.$v], 'prd_wrp');

					foreach ($ocmd_prdstyles as $pk => $pv) {
						if ($factory::has($theme_ocmodule['ocmod_'.$v], $pv)) {
							if (isset($theme_ocmodule['ocmod_'.$v][$pv]['status']) && $theme_ocmodule['ocmod_'.$v][$pv]['status']) {
								foreach ($theme_ocmodule['ocmod_'.$v][$pv]['css_data'] as $key => $value) {
									$data['ocmd_'.$v][$pk][$key] = $value;
								}
							}
						}
					}
				}
			}	
		}
		
		/* Theme - Slide show OC module 
		------------------------*/
		if ($factory->has($theme_ocmodule, 'ocmod_slideshow') && $this->chk($theme_ocmodule['ocmod_slideshow'])) {
			$theme_ocmd_slideshow = $theme_ocmodule['ocmod_slideshow'];
			if (isset($theme_ocmd_slideshow['status']) && $theme_ocmd_slideshow['status']) {
				$data['ocmd_slideshow']['wrapper']    = $factory->getnode($theme_ocmd_slideshow, 'wrapper');
				$data['ocmd_slideshow']['dot_normal'] = $factory->getnode($theme_ocmd_slideshow, 'dot_normal');
				$data['ocmd_slideshow']['dot_active'] = $factory->getnode($theme_ocmd_slideshow, 'dot_active');
				$data['ocmd_slideshow']['dot_line']   = $this->cssprop($theme_ocmd_slideshow['dot_line'], 'bdrcolor');
			}
		}

		/* Theme - Category and My account OC module 
		------------------------*/
		if ($factory->has($theme_ocmodule, 'ocmod_cataccount') && $this->chk($theme_ocmodule['ocmod_cataccount'])) {
			$theme_ocmd_cataccount = $theme_ocmodule['ocmod_cataccount'];
			if (isset($theme_ocmd_cataccount['status']) && $theme_ocmd_cataccount['status']) {
				$data['ocmod_cataccount']['hd']                 = $factory->getnode($theme_ocmd_cataccount, 'hd');
				$data['ocmod_cataccount']['list_wrp']           = $factory->getnode($theme_ocmd_cataccount, 'list_wrp');
				$data['ocmod_cataccount']['list_item']          = $factory->getnode($theme_ocmd_cataccount, 'list_item', 'css_normal');
				$data['ocmod_cataccount']['list_item_hover']          = $factory->getnode($theme_ocmd_cataccount, 'list_item', 'css_hover');
				$data['ocmod_cataccount']['sublink_wrp']        = $factory->getnode($theme_ocmd_cataccount, 'sublink_wrp');
				$data['ocmod_cataccount']['sublink_item']       = $this->cssprop($theme_ocmd_cataccount['sublink_item'], 'color');
				$data['ocmod_cataccount']['sublink_item_hover'] = $this->cssprop($theme_ocmd_cataccount['sublink_item_hover'], 'color');
				$data['ocmod_cataccount']['sublink_bullet']     = $this->cssprop($theme_ocmd_cataccount['sublink_bullet'], 'bgcolor');
			}
		}


		/* Module - Mega menu
		------------------------*/
		$menudata = $this->rgen->storage->get('modtheme_data', 'rgen_menu');
		if ($this->chk($menudata)) {

			foreach ($menudata as $k => $v) {
				if ($this->chk($v)) {
					$menu = $v;
					if ($v['status']) {
						$data['rgen_menu'][$k]['container'] = $factory->getnode($menu, 'container');
						$data['rgen_menu'][$k]['menubar']   = $factory->getnode($menu, 'menubar');

						// Menu item
						$data['rgen_menu'][$k]['menuitem_wrp']         = $factory->getnode($menu['menuitem'], 'wrapper');
						$data['rgen_menu'][$k]['menuitem']             = $factory->getnode($menu['menuitem'], 'link', 'css_normal');
						$data['rgen_menu'][$k]['menuitem_hover']       = $factory->getnode($menu['menuitem'], 'link', 'css_hover');
						$data['rgen_menu'][$k]['menuitem_first']       = $factory->node($menu, 'menuitem/first_link', 1, 0, 'css_normal');
						$data['rgen_menu'][$k]['menuitem_first_hover'] = $factory->node($menu, 'menuitem/first_link', 1, 0, 'css_hover');
						$data['rgen_menu'][$k]['menuitem_last']        = $factory->node($menu, 'menuitem/last_link', 1, 0, 'css_normal');
						$data['rgen_menu'][$k]['menuitem_last_hover']  = $factory->node($menu, 'menuitem/last_link', 1, 0, 'css_hover');

						$data['rgen_menu'][$k]['m_handle']    = $factory->getnode($menu, 'm_handle');
						$data['rgen_menu'][$k]['m_subhandle'] = $factory->getnode($menu, 'm_subhandle');
						$data['rgen_menu'][$k]['m_nav']       = $factory->getnode($menu, 'm_nav');
						$data['rgen_menu'][$k]['m_subwrp']    = $factory->getnode($menu, 'm_subwrp');
						$data['rgen_menu'][$k]['m_sub']       = $factory->node($menu, 'm_sub', 1);
						$data['rgen_menu'][$k]['m_mainitem']  = $factory->getnode($menu, 'm_mainitem');
						$data['rgen_menu'][$k]['m_subitem']   = $factory->getnode($menu, 'm_subitem');

						// Fly out
						$data['rgen_menu'][$k]['flyout_wrp']        = $factory->getnode($menu['flyoutmenu'], 'wrapper');
						$data['rgen_menu'][$k]['flyout_item']       = $factory->getnode($menu['flyoutmenu'], 'link', 'css_normal');
						$data['rgen_menu'][$k]['flyout_item_hover'] = $factory->getnode($menu['flyoutmenu'], 'link', 'css_hover');

						// Mega menu
						$data['rgen_menu'][$k]['megamenu_wrp']  = $factory->getnode($menu['megamenu'], 'wrapper');

						// Normal item
						$data['rgen_menu'][$k]['normal']['block']         = $factory->getnode($menu['megamenu']['normalmenu'], 'block');
						$data['rgen_menu'][$k]['normal']['heading']       = $factory->getnode($menu['megamenu']['normalmenu'], 'heading', 'css_normal');
						$data['rgen_menu'][$k]['normal']['heading_hover'] = $factory->getnode($menu['megamenu']['normalmenu'], 'heading', 'css_hover');
						$data['rgen_menu'][$k]['normal']['link']          = $factory->getnode($menu['megamenu']['normalmenu'], 'links', 'css_normal');
						$data['rgen_menu'][$k]['normal']['link_hover']    = $factory->getnode($menu['megamenu']['normalmenu'], 'links', 'css_hover');

						// Category item 1
						$data['rgen_menu'][$k]['catblock1']['block']         = $factory->getnode($menu['megamenu']['catblock1'], 'block');
						$data['rgen_menu'][$k]['catblock1']['heading']       = $factory->getnode($menu['megamenu']['catblock1'], 'heading', 'css_normal');
						$data['rgen_menu'][$k]['catblock1']['heading_hover'] = $factory->getnode($menu['megamenu']['catblock1'], 'heading', 'css_hover');
						$data['rgen_menu'][$k]['catblock1']['link']          = $factory->getnode($menu['megamenu']['catblock1'], 'links', 'css_normal');
						$data['rgen_menu'][$k]['catblock1']['link_hover']    = $factory->getnode($menu['megamenu']['catblock1'], 'links', 'css_hover');

						// Category item 2
						$data['rgen_menu'][$k]['catblock2']['block']         = $factory->getnode($menu['megamenu']['catblock2'], 'block');
						$data['rgen_menu'][$k]['catblock2']['img']           = $factory->getnode($menu['megamenu']['catblock2'], 'image');
						$data['rgen_menu'][$k]['catblock2']['heading']       = $factory->getnode($menu['megamenu']['catblock2'], 'heading', 'css_normal');
						$data['rgen_menu'][$k]['catblock2']['heading_hover'] = $factory->getnode($menu['megamenu']['catblock2'], 'heading', 'css_hover');
						$data['rgen_menu'][$k]['catblock2']['link']          = $factory->getnode($menu['megamenu']['catblock2'], 'links', 'css_normal');
						$data['rgen_menu'][$k]['catblock2']['link_hover']    = $factory->getnode($menu['megamenu']['catblock2'], 'links', 'css_hover');

						// Product item 1
						$data['rgen_menu'][$k]['prdblock1']['block']          = $factory->getnode($menu['megamenu']['prdblock1'], 'block');
						$data['rgen_menu'][$k]['prdblock1']['linktext']       = $this->cssprop($menu['megamenu']['prdblock1']['linktext']['normal'], 'color');
						$data['rgen_menu'][$k]['prdblock1']['linktext_hover'] = $this->cssprop($menu['megamenu']['prdblock1']['linktext']['hover'], 'color');
						$data['rgen_menu'][$k]['prdblock1']['price']          = $this->cssprop($menu['megamenu']['prdblock1']['price'], 'color');
						$data['rgen_menu'][$k]['prdblock1']['button']         = $factory->getnode($menu['megamenu']['prdblock1'], 'button', 'css_normal');
						$data['rgen_menu'][$k]['prdblock1']['button_hover']   = $factory->getnode($menu['megamenu']['prdblock1'], 'button', 'css_hover');

						// Product item 2
						$data['rgen_menu'][$k]['prdblock2']['block']          = $factory->getnode($menu['megamenu']['prdblock2'], 'block');
						$data['rgen_menu'][$k]['prdblock2']['linktext']       = $this->cssprop($menu['megamenu']['prdblock2']['linktext']['normal'], 'color');
						$data['rgen_menu'][$k]['prdblock2']['linktext_hover'] = $this->cssprop($menu['megamenu']['prdblock2']['linktext']['hover'], 'color');
						$data['rgen_menu'][$k]['prdblock2']['price']          = $this->cssprop($menu['megamenu']['prdblock2']['price'], 'color');
						$data['rgen_menu'][$k]['prdblock2']['button']         = $factory->getnode($menu['megamenu']['prdblock2'], 'button', 'css_normal');
						$data['rgen_menu'][$k]['prdblock2']['button_hover']   = $factory->getnode($menu['megamenu']['prdblock2'], 'button', 'css_hover');

						// Brands 1
						$data['rgen_menu'][$k]['brandblock1']['block']          = $factory->getnode($menu['megamenu']['brandblock1']['block'], 'normal');
						$data['rgen_menu'][$k]['brandblock1']['block_hover']    = $factory->getnode($menu['megamenu']['brandblock1']['block'], 'hover');
						$data['rgen_menu'][$k]['brandblock1']['linktext']       = $factory->getnode($menu['megamenu']['brandblock1']['linktext'], 'normal');
						$data['rgen_menu'][$k]['brandblock1']['linktext_hover'] = $factory->getnode($menu['megamenu']['brandblock1']['linktext'], 'hover');

						// Brands 1
						$data['rgen_menu'][$k]['brandblock2']['block']       = $factory->getnode($menu['megamenu']['brandblock2'], 'block');
						$data['rgen_menu'][$k]['brandblock2']['block_hover'] = $this->cssprop($menu['megamenu']['brandblock2']['hover']['background'], 'bgcolor');
						$data['rgen_menu'][$k]['brandblock2']['text']        = $this->cssprop($menu['megamenu']['brandblock2']['hover']['textcolor'], 'color');
						
						// Mega menu - Item - Image 1
						$data['rgen_menu'][$k]['imageblock1']['block']          = $factory->getnode($menu['megamenu']['imageblock1']['block'], 'normal');
						$data['rgen_menu'][$k]['imageblock1']['block_hover']    = $factory->getnode($menu['megamenu']['imageblock1']['block'], 'hover');
						$data['rgen_menu'][$k]['imageblock1']['linktext']       = $factory->getnode($menu['megamenu']['imageblock1']['linktext'], 'normal');
						$data['rgen_menu'][$k]['imageblock1']['linktext_hover'] = $factory->getnode($menu['megamenu']['imageblock1']['linktext'], 'hover');

						// Mega menu - Item - Image 2
						$data['rgen_menu'][$k]['imageblock2']['block']       = $factory->getnode($menu['megamenu']['imageblock2'], 'block');
						$data['rgen_menu'][$k]['imageblock2']['block_hover'] = $this->cssprop($menu['megamenu']['imageblock2']['hover']['background'], 'bgcolor');
						$data['rgen_menu'][$k]['imageblock2']['text']        = $this->cssprop($menu['megamenu']['imageblock2']['hover']['textcolor'], 'color');

						// Mega menu - Item - Image 3
						$data['rgen_menu'][$k]['imageblock3']['block']          = $factory->getnode($menu['megamenu']['imageblock3']['block'], 'normal');
						$data['rgen_menu'][$k]['imageblock3']['block_hover']    = $factory->getnode($menu['megamenu']['imageblock3']['block'], 'hover');
						$data['rgen_menu'][$k]['imageblock3']['linktext']       = $factory->getnode($menu['megamenu']['imageblock3']['linktext'], 'normal');
						$data['rgen_menu'][$k]['imageblock3']['linktext_hover'] = $factory->getnode($menu['megamenu']['imageblock3']['linktext'], 'hover');

						// Mega menu - Item - Image 4
						$data['rgen_menu'][$k]['imageblock4']['block']       = $factory->getnode($menu['megamenu']['imageblock4'], 'block', 'css_normal');
						$data['rgen_menu'][$k]['imageblock4']['block_hover'] = $factory->getnode($menu['megamenu']['imageblock4'], 'block', 'css_hover');

						// Mega menu - Item - Info box 1
						$data['rgen_menu'][$k]['infoblock1']['block']        = $factory->getnode($menu['megamenu']['infoblock1'], 'block');
						$data['rgen_menu'][$k]['infoblock1']['image']        = $factory->getnode($menu['megamenu']['infoblock1'], 'image');
						$data['rgen_menu'][$k]['infoblock1']['heading']      = $factory->getnode($menu['megamenu']['infoblock1'], 'heading');
						$data['rgen_menu'][$k]['infoblock1']['content']      = $factory->getnode($menu['megamenu']['infoblock1'], 'content');
						$data['rgen_menu'][$k]['infoblock1']['button_wrp']   = $factory->getnode($menu['megamenu']['infoblock1'], 'button_wrp');
						$data['rgen_menu'][$k]['infoblock1']['button']       = $factory->getnode($menu['megamenu']['infoblock1'], 'button', 'css_normal');
						$data['rgen_menu'][$k]['infoblock1']['button_hover'] = $factory->getnode($menu['megamenu']['infoblock1'], 'button', 'css_hover');

						// Mega menu - Item - Info box 2
						$data['rgen_menu'][$k]['infoblock2']['block']        = $factory->getnode($menu['megamenu']['infoblock2'], 'block');
						$data['rgen_menu'][$k]['infoblock2']['image']        = $factory->getnode($menu['megamenu']['infoblock2'], 'image');
						$data['rgen_menu'][$k]['infoblock2']['heading']      = $factory->getnode($menu['megamenu']['infoblock2'], 'heading');
						$data['rgen_menu'][$k]['infoblock2']['content']      = $factory->getnode($menu['megamenu']['infoblock2'], 'content');
						$data['rgen_menu'][$k]['infoblock2']['button_wrp']   = $factory->getnode($menu['megamenu']['infoblock2'], 'button_wrp');
						$data['rgen_menu'][$k]['infoblock2']['button']       = $factory->getnode($menu['megamenu']['infoblock2'], 'button', 'css_normal');
						$data['rgen_menu'][$k]['infoblock2']['button_hover'] = $factory->getnode($menu['megamenu']['infoblock2'], 'button', 'css_hover');

						// Mega menu - Item - Info box 3
						$data['rgen_menu'][$k]['infoblock3']['block']        = $factory->getnode($menu['megamenu']['infoblock3'], 'block');
						$data['rgen_menu'][$k]['infoblock3']['image']        = $factory->getnode($menu['megamenu']['infoblock3'], 'image');
						$data['rgen_menu'][$k]['infoblock3']['heading']      = $factory->getnode($menu['megamenu']['infoblock3'], 'heading');
						$data['rgen_menu'][$k]['infoblock3']['content']      = $factory->getnode($menu['megamenu']['infoblock3'], 'content');
						$data['rgen_menu'][$k]['infoblock3']['button_wrp']   = $factory->getnode($menu['megamenu']['infoblock3'], 'button_wrp');
						$data['rgen_menu'][$k]['infoblock3']['button']       = $factory->getnode($menu['megamenu']['infoblock3'], 'button', 'css_normal');
						$data['rgen_menu'][$k]['infoblock3']['button_hover'] = $factory->getnode($menu['megamenu']['infoblock3'], 'button', 'css_hover');

						// Mega menu - Item - Info box 3
						$data['rgen_menu'][$k]['infoblock4']['block']        = $factory->getnode($menu['megamenu']['infoblock4'], 'block');
						$data['rgen_menu'][$k]['infoblock4']['image']        = $factory->getnode($menu['megamenu']['infoblock4'], 'image');
						$data['rgen_menu'][$k]['infoblock4']['heading']      = $factory->getnode($menu['megamenu']['infoblock4'], 'heading');
						$data['rgen_menu'][$k]['infoblock4']['content']      = $factory->getnode($menu['megamenu']['infoblock4'], 'content');
						$data['rgen_menu'][$k]['infoblock4']['button']       = $factory->getnode($menu['megamenu']['infoblock4'], 'button', 'css_normal');
						$data['rgen_menu'][$k]['infoblock4']['button_hover'] = $factory->getnode($menu['megamenu']['infoblock4'], 'button', 'css_hover');

						// Mega menu - Item - Info box 4
						$data['rgen_menu'][$k]['customhtml']['block']        = $factory->getnode($menu['megamenu']['customhtml'], 'block');
					}
				}
				//$data['rgen_menu'][$k]
			}
			//echo "<pre>".print_r($data['rgen_menu'],true)."</pre>";
			//echo "<pre>".print_r($menu['megamenu']->normalmenu,true)."</pre>";
		}

		/* Module - Basic slide show
		------------------------*/
		$basicslideshow = $this->rgen->storage->get('modtheme_data', 'rgen_basicslideshow');
		if ($this->chk($basicslideshow)) {

			foreach ($basicslideshow as $k => $v) {
				if ($this->chk($v)) {
					$slideshow = $v;
					if ($v['status']) {
						$data['basicslideshow'][$k]['main_wrp']      = $factory->getnode($slideshow, 'main_wrp');
						$data['basicslideshow'][$k]['container']     = $factory->getnode($slideshow, 'container');
						$data['basicslideshow'][$k]['slideshow_wrp'] = $factory->getnode($slideshow, 'slideshow_wrp');
						$data['basicslideshow'][$k]['slideshow']     = $factory->getnode($slideshow, 'slideshow');
					}
				}
			}
		}

		/* Module - Product groups
		------------------------*/
		include_once($this->rgen->customize_productgroups);
		$data['css_fn_productgroups'] = $this->rgen->css_fn_productgroups;
		$data['css_productgroups']    = $this->rgen->css_productgroups;

		/* Module - Basic banners
		------------------------*/
		include_once($this->rgen->customize_basicbanners);
		//$data['css_fn_basicbanners'] = $this->rgen->css_fn_basicbanners;
		$data['css_basicbanners']    = $this->rgen->css_basicbanners;

		/* Module - Content blocks
		------------------------*/
		include_once($this->rgen->customize_contentblocks);
		$data['css_fn_contentblocks'] = $this->rgen->css_fn_contentblocks;
		$data['css_contentblocks']    = $this->rgen->css_contentblocks;

		/* Module - Revo slider
		------------------------*/
		include_once($this->rgen->customize_revslider);
		$data['css_fn_revslider'] = $this->rgen->css_fn_revslider;
		$data['css_revslider']    = $this->rgen->css_revslider;

		/* Module - Grid manager
		------------------------*/
		include_once($this->rgen->customize_gridmanager);
		$data['css_fn_gridmanager'] = $this->rgen->css_fn_gridmanager;
		$data['css_gridmanager']    = $this->rgen->css_gridmanager;

		/* Module - Banner grids
		------------------------*/
		include_once($this->rgen->customize_bannergrids);
		$data['css_fn_bannergrids'] = $this->rgen->css_fn_bannergrids;
		$data['css_bannergrids']    = $this->rgen->css_bannergrids;

		/* Module - Image gallery
		------------------------*/
		include_once($this->rgen->customize_imagegallery);
		$data['css_fn_imagegallery'] = $this->rgen->css_fn_imagegallery;
		$data['css_imagegallery']    = $this->rgen->css_imagegallery;

		/* Module - Product page : html
		------------------------*/
		include_once($this->rgen->customize_prdpghtml);
		$data['css_fn_prdpghtml'] = $this->rgen->css_fn_prdpghtml;
		$data['css_prdpghtml']    = $this->rgen->css_prdpghtml;

		/* Module - Sticky html
		------------------------*/
		include_once($this->rgen->customize_stickyhtml);
		$data['css_fn_stickyhtml'] = $this->rgen->css_fn_stickyhtml;
		$data['css_stickyhtml']    = $this->rgen->css_stickyhtml;

		/* Module - Category showcase
		------------------------*/
		include_once($this->rgen->customize_catshowcase);
		$data['css_fn_catshowcase'] = $this->rgen->css_fn_catshowcase;
		$data['css_catshowcase']    = $this->rgen->css_catshowcase;

		/* Module - Deals showcase
		------------------------*/
		include_once($this->rgen->customize_deals);
		$data['css_fn_deals'] = $this->rgen->css_fn_deals;
		$data['css_deals']    = $this->rgen->css_deals;
		
		/* Module - Custom HTML
		------------------------*/
		$customhtmls = $this->rgen->storage->get('modtheme_data', 'rgen_customhtml');
		if ($this->chk($customhtmls)) {
			foreach ($customhtmls as $k => $v) {
				if ($this->chk($v)) {
					$customhtml = $v;

					if ($v['status']) {
						$screen_k = array('d', 't', 'm');
						foreach ($screen_k as $screen_v) {
							$data['customhtmls'][$k][$screen_v]['main']        = $factory->node($customhtml, $screen_v.'/main', 1);
							$data['customhtmls'][$k][$screen_v]['main_bg']     = $this->cssimgpath($factory->node($customhtml, $screen_v.'/main_bg', 1));
							$data['customhtmls'][$k][$screen_v]['mod_wrp']     = $factory->node($customhtml, $screen_v.'/mod_wrp', 1);
							$data['customhtmls'][$k][$screen_v]['mod_content'] = $factory->node($customhtml, $screen_v.'/mod_content', 1);
							$data['customhtmls'][$k][$screen_v]['mod_hd']      = $factory->node($customhtml, $screen_v.'/mod_hd', 1);
							
							$data['customhtmls'][$k][$screen_v]['t_html']      = $factory->node($customhtml, $screen_v.'/t_html', 1);
							$data['customhtmls'][$k][$screen_v]['b_html']      = $factory->node($customhtml, $screen_v.'/b_html', 1);
							$data['customhtmls'][$k][$screen_v]['l_html']      = $factory->node($customhtml, $screen_v.'/l_html', 1);
							$data['customhtmls'][$k][$screen_v]['m_html']      = $factory->node($customhtml, $screen_v.'/m_html', 1);
							$data['customhtmls'][$k][$screen_v]['r_html']      = $factory->node($customhtml, $screen_v.'/r_html', 1);
							
							$data['customhtmls'][$k][$screen_v]['rw']          = $factory->node($customhtml, $screen_v.'/rw', 1);
							$data['customhtmls'][$k][$screen_v]['l_cl']        = $factory->node($customhtml, $screen_v.'/l_cl', 1);
							$data['customhtmls'][$k][$screen_v]['m_cl']        = $factory->node($customhtml, $screen_v.'/m_cl', 1);
							$data['customhtmls'][$k][$screen_v]['r_cl']        = $factory->node($customhtml, $screen_v.'/r_cl', 1);
						}
					}
				}
			}
		}


		/* Theme - common components
		------------------------*/
		$commoncomponents = $this->rgen->storage->get('theme_data', 'rgen_commoncomponents');
		if ($this->chk($commoncomponents)) {

			// Global
			if ($factory->has($commoncomponents, 'global')) {
				$gb = $commoncomponents['global'];
				if (isset($gb['status']) && $gb['status']) {
					$data['global_link_normal'] = $this->cssprop($gb['links']['normal'], 'color');
					$data['global_link_hover']  = $this->cssprop($gb['links']['hover'], 'color');
					$data['global_border_color']  = $this->cssprop($gb['border_color'], 'bdrcolor');

					$data['scrolltop_css'] = $this->cssprop($gb['scrolltop']['background'], 'bgcolor');
					$data['scrolltop_css'] .= $factory->getnode($gb['scrolltop'], 'border');
				
					if ($factory->has($gb['scrolltop'], 'icon') && $this->chk($gb['scrolltop']['icon'])) {
						$data['scrolltop_css'] .= $factory->getnode($gb['scrolltop'], 'icon');
						$data['scrolltop_ico']  = $this->cssprop($gb['scrolltop']['icon']['size'], 'fsize');
					}

					$data['global_hr']  = $factory->node($gb, 'hr/block', 1);
					$data['global_hr'] .= $this->cssimgpath($factory->node($gb, 'hr/bg', 1));

					$data['global_pagination_wrp'] = $factory->getnode($gb['pagination'], 'wrapper');
					$data['global_pagination_block'] = $factory->getnode($gb['pagination'], 'block');
					$data['global_pagination_active'] = $factory->getnode($gb['pagination'], 'active');
					$data['global_pagination_normal'] = $factory->getnode($gb['pagination'], 'normal');

					$data['global_owl_arrows']['arrow_wrp']    = $factory->getnode($gb, 'arrow_wrp');
					$data['global_owl_arrows']['arrow_line']   = $this->cssprop($gb['arrow_line'], 'bdrcolor');
					$data['global_owl_arrows']['arrows']       = $factory->getnode($gb, 'arrows', 'css_normal');
					$data['global_owl_arrows']['arrows_hover'] = $factory->getnode($gb, 'arrows', 'css_hover');

					$data['global_slideshow_dots']['dot_normal'] = $factory->getnode($gb['dots'], 'dot_normal');
					$data['global_slideshow_dots']['dot_active'] = $factory->getnode($gb['dots'], 'dot_active');
					$data['global_slideshow_dots']['dot_line']   = $this->cssprop($gb['dots']['dot_line'], 'bdrcolor');
				}
			}
		
			// Page heading
			if ($factory->has($commoncomponents, 'pg_heading')) {
				$pg_heading = $commoncomponents['pg_heading'];

				if (isset($pg_heading['status']) && $pg_heading['status']) {
					$data['pg_heading_wrp']      = $factory->getnode($pg_heading, 'block');
					$data['pg_heading_wrp']     .=  $this->cssimgpath($factory->getnode($pg_heading, 'block_img'));
					$data['pg_heading_h1_block'] = $factory->node($pg_heading, 'h1_block', 1);
					$data['pg_heading_h1_text']  = $factory->node($pg_heading, 'h1_text', 1);
					$data['breadcrumb_wrp']      = $factory->getnode($pg_heading['breadcrumb'], 'block');
					$data['breadcrumb_sep']      = $this->cssprop($pg_heading['breadcrumb']['sep'], 'color');
					$data['breadcrumb_a']        = $this->cssprop($pg_heading['breadcrumb']['link_normal'], 'color');
					$data['breadcrumb_a_hover']  = $this->cssprop($pg_heading['breadcrumb']['link_hover'], 'color');
				}
				//echo "<pre> pg_heading => ".print_r($factory->getnode($pg_heading, 'block'),true)."</pre>";
			}

			// Headings
			if ($factory->has($commoncomponents, 'headings')) {
				$headings = $commoncomponents['headings'];
				if (isset($headings['status']) && $headings['status']) {
					$data['module_hd'] = $factory->getnode($headings, 'module_hd');
					$data['column_module_hd'] = $factory->getnode($headings, 'column_module_hd');
					$data['footer_hd'] = $factory->getnode($headings, 'footer_hd');
					$data['other_hd_fonts'] = $factory->getnode($headings['other_hd'], 'fonts');
					$data['other_hd_h1'] = $factory->getnode($headings['other_hd'], 'h1');
					$data['other_hd_h2'] = $factory->getnode($headings['other_hd'], 'h2');
					$data['other_hd_h3'] = $factory->getnode($headings['other_hd'], 'h3');
					$data['other_hd_h4'] = $factory->getnode($headings['other_hd'], 'h4');
					$data['other_hd_h5'] = $factory->getnode($headings['other_hd'], 'h5');
					$data['other_hd_h6'] = $factory->getnode($headings['other_hd'], 'h6');
				}
				
			}

			// Buttons
			if ($factory->has($commoncomponents, 'buttons')) {
				$buttons = $commoncomponents['buttons'];
				if (isset($buttons['status']) && $buttons['status']) {
					$data['default_btn']       = $factory->getnode($buttons, 'default_btn', 'css_normal');
					$data['default_btn_hover'] = $factory->getnode($buttons, 'default_btn', 'css_hover');
					
					$data['primary_btn']       = $factory->getnode($buttons, 'primary_btn', 'css_normal');
					$data['primary_btn_hover'] = $factory->getnode($buttons, 'primary_btn', 'css_hover');
					
					$data['small_btn']         = $factory->getnode($buttons, 'small_btn', 'css_normal');
					$data['small_btn_hover']   = $factory->getnode($buttons, 'small_btn', 'css_hover');
					
					$data['mini_btn']          = $factory->getnode($buttons, 'mini_btn', 'css_normal');
					$data['mini_btn_hover']    = $factory->getnode($buttons, 'mini_btn', 'css_hover');
					
					$data['xs_btn']            = $factory->getnode($buttons, 'xs_btn', 'css_normal');
					$data['xs_btn_hover']      = $factory->getnode($buttons, 'xs_btn', 'css_hover');
				}
			}

			// Product filters
			if ($factory->has($commoncomponents, 'prd_filters')) {
				$prd_filters = $commoncomponents['prd_filters'];
				if (isset($prd_filters['status']) && $prd_filters['status']) {
					$data['filter_wrp'] = $factory->getnode($prd_filters, 'block');
					$data['filter_compare'] = $factory->getnode($prd_filters, 'compare', 'css_normal');
					$data['filter_compare_hover'] = $factory->getnode($prd_filters, 'compare', 'css_hover');
					
					$data['filter_labels'] = $this->cssprop($prd_filters['filter_lbl'], 'color');
					$data['filter_ctrl'] = $factory->getnode($prd_filters, 'filter_ctrl');

					$data['display_btn']  = $this->cssprop($prd_filters['display'], 'color');
					$data['display_btn'] .= $factory->node($prd_filters, 'display_btn', 1);
					$data['display_btn_active']  = $this->cssprop($prd_filters['display_active'], 'color');
					$data['display_btn_active'] .= $factory->node($prd_filters, 'display_btn_active', 1);
				}
			}
			
			// Table style
			if ($factory->has($commoncomponents, 'table_style')) {
				$table_style = $commoncomponents['table_style'];
				if (isset($table_style['status']) && $table_style['status']) {
					if ($factory->has($table_style, 'table')) {
						$table = $table_style['table'];
						$data['table']  = $this->cssprop($table['background'], 'bgcolor');
						$data['table'] .= $factory->getnode($table, 'border');
					}
					if ($factory->has($table_style, 'th')) {
						$thead = $table_style['th'];
						$data['thead']       = $factory->getnode($thead, 'block');
						$data['thead_first'] = $factory->getnode($thead, 'first');
						$data['thead_last']  = $factory->getnode($thead, 'last');
					}
					if ($factory->has($table_style, 'td')) {
						$tbody = $table_style['td'];
						$data['tbody']       = $factory->getnode($tbody, 'block');
						$data['tbody_first'] = $factory->getnode($tbody, 'first');
						$data['tbody_last']  = $factory->getnode($tbody, 'last');
					}
				}
			}

			// Form style
			if ($factory->has($commoncomponents, 'forms')) {
				$forms = $commoncomponents['forms'];
				if (isset($forms['status']) && $forms['status']) {
					$data['frm_wrp']    = $factory->getnode($forms, 'block');
					$data['frm_title']  = $factory->getnode($forms, 'title');
					$data['frm_label']  = $factory->getnode($forms, 'label');
					$data['frm_ctrl']   = $factory->getnode($forms, 'form_control');
					$data['frm_btnbar'] = $factory->getnode($forms, 'button_bar');
				}
			}

			// Popup
			if ($factory->has($commoncomponents, 'popup')) {
				$popup = $commoncomponents['popup'];
				if (isset($popup['status']) && $popup['status']) {
					$data['modal_wrp']          = $factory->getnode($popup, 'modal');
					$data['modal_header']       = $factory->getnode($popup, 'modal_header');
					$data['modal_header_fonts'] = $factory->getnode($popup, 'modal_header_fonts');
					$data['modal_body']         = $factory->getnode($popup, 'modal_body');
					$data['modal_close']        = $this->cssprop($popup['modal_close'], 'color');
				}
			}

			// Popup
			if ($factory->has($commoncomponents, 'panel')) {
				$panel = $commoncomponents['panel'];
				if (isset($panel['status']) && $panel['status']) {
					$data['panel']['panel_wrp']          = $factory->getnode($panel, 'panel_wrp');
					$data['panel']['title_block']          = $factory->getnode($panel, 'title_block');
					$data['panel']['title']       = $factory->getnode($panel, 'title');
					$data['panel']['body_wrp'] = $factory->getnode($panel, 'body_wrp');
					$data['panel']['body']         = $factory->getnode($panel, 'body');
				}
			}
		}

		function array_remove_empty($arr){
			$narr = array();
			while(list($key, $val) = each($arr)){
				if (is_array($val)){
					$val = array_remove_empty($val);
					if (count($val)!=0){
						$narr[$key] = $val;
					}
				}
				else {
					if (trim($val) != ""){
						$narr[$key] = $val;
					}
				}
			}
			unset($arr);
			return $narr;
		}
		$css_processor = FILE_CSS_PROCESSOR;
		$css_output    = FILE_CONFIG_STYLE;
		if (file_exists($css_output)) {
			file_put_contents($css_output, $this->load->view($css_processor, array_remove_empty($data)), LOCK_EX);	
		}
	}
	
	public function cssimgpath($val){
		return str_replace("image/","../../../../../image/",$val);
	}

	public function chk($val){
		return !$this->rgen->factory->isEmpty($val);
	}

	/* CSS helper functions
	------------------------*/
	private function cssprop($value, $key) {
		switch ($key) {
			case 'bgcolor':
				return !empty($value) ? 'background-color: '.$value.';' : '';
				break;
			case 'color':
				return !empty($value) ? 'color: '.$value.';' : '';
				break;
			case 'bdrcolor':
				return !empty($value) ? 'border-color: '.$value.';' : '';
				break;
			case 'margin_t':
				return !empty($value) ? 'margin-top: '.$value.'px; ' : '';
				break;
			case 'margin_b':
				return !empty($value) ? 'margin-bottom: '.$value.'px; ' : '';
				break;
			case 'fsize':
				return !empty($value) ? 'font-size: '.$value.'; ' : '';
				break;
			case 'w':
				return !empty($value) ? 'width: '.$value.'px; ' : '';
				break;
			case 'h':
				return !empty($value) ? 'height: '.$value.'px; ' : '';
				break;
		}
	}

	
	

}