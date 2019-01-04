<?php 
class ControllerModuleRgen extends Controller {

	private $error = array();

	private $modSettings = array(
		'modelPath' 	=> 'rgen/rgen',
		'modKey' 		=> 'rgen',
		'model'			=> 'model_rgen_rgen',
		'main_tpl' 		=> 'module/rgen.tpl'
		);

	/********************************************
	CREATE TABLE FOR RGEN DB */
	public function install() {
		$this->load->model($this->modSettings['modelPath']);
		$this->{$this->modSettings['model']}->install();
		//$this->preAction();
	}

	public function uninstall() {
		$this->load->model($this->modSettings['modelPath']);
		$this->{$this->modSettings['model']}->uninstall();
	}

	public function preAction() {
		$this->load->model($this->modSettings['modelPath']);
		$default = json_decode(file_get_contents(DIR_SYSTEM . '../rgen/data/themes/defaults.json'));
		foreach ($default as $key => $value) {
			$this->{$this->modSettings['model']}->themeEditsection('rgen_theme', $key, $value);
		}
	}
	/*********************************************/

	public function index() {
		
		// Check for modification changes
		if (null === $this->registry->get('rgen_check') || $this->registry->get('rgen_check') === false) {
			$err_msg  = '<div style="font-family:arial; font-size:16px; line-height:2; color:#7c4a4a; padding:20px; background:#ffdbdb; border:1px solid #e06b6b; border-radius:5px; width:600px; margin:30px auto;">';
			$err_msg .= 'Theme modifications changes not applied. <br><ul>';
			$err_msg .= '<li>Please go to <strong>Extensions > Modifications</strong> and click on the<br><strong>Blue Refresh button (top right corner)</strong> to apply theme changes.';
			$err_msg .= 'Theme will not work without Modifications changes.</li>';
			$err_msg .= '</ul></div>';
			echo $err_msg;
			exit();
		}

		$this->load->language('module/rgen');
		$this->document->setTitle($this->language->get('heading_title'));

		// New module customize table added
		$this->load->model($this->modSettings['modelPath']);
		$this->{$this->modSettings['model']}->modCustomizeTbl();

		// Model files
		$this->load->model($this->modSettings['modelPath']);
		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		}

		// Common data
		$activetheme 			= $this->{$this->modSettings['model']}->settingsGetkey('config', 'active_theme');
		$data['placeholder'] 	= $this->model_tool_image->resize('no_image.png', 100, 100);

		$this->load->model('localisation/language');
		$data['lang'] = array();
		$results = $this->model_localisation_language->getLanguages();
		foreach ($results as $result) {
			if ($result['status']) {
				$data['lang'][] = array(
					'language'  => $result['name'],
					'id'  		=> $result['language_id'],
					'code'  	=> $result['code'],
					'image' 	=> $result['image']
				);
			}
		}
		
		// Common values
		$data['rgen_config'] = array(
			'token'             => $this->session->data['token'],
			'url_prefix'        => 'index.php?route=module/rgen&token='.$this->session->data['token'],
			'activetheme'       => isset($activetheme->id) ? $activetheme->id : 'theme_id_01',
			'no_image'          => $data['placeholder'],
			'text_success'      => $this->language->get('text_success'),
			'error_permission'  => $this->language->get('error_permission'),
			'permission'        => $this->user->hasPermission('modify', 'module/'.$this->modSettings['modKey']),
			'language'          => $data['lang'],
			'config_lng'        => $this->config->get('config_language_id'),
			'revo_href'         => $this->url->link('module/revslideropencart', 'token=' . $this->session->data['token'], 'SSL'),
			'DIR_THEME_TPL'     => '../rgen/admin/template/theme',
			'DIR_ADMIN_IMG'     => '../rgen/admin/images/',
			'DIR_MOD_TPL'       => '../rgen/admin/template/module',
			'DIR_LAYOUT_TPL'    => '../rgen/admin/template/layout',
			'DIR_DIRECTIVE_TPL' => '../rgen/admin/template/directive'
		);

		// Origin URL to access all module files
		$data['origin'] = 'index.php?route=module/rgen/render&token='.$this->session->data['token'].'&path=';
		
		// Language variables
		$text_strings = array(
				'heading_title',
				'heading_title',
				'text_edit',
				'text_enabled',
				'text_disabled',
				'entry_limit',
				'entry_image',
				'entry_width',
				'entry_height',
				'entry_status',
				'button_save',
				'button_cancel',
				'button_module_add',
				'button_remove'
		);
		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['image'])) {
			$data['error_image'] = $this->error['image'];
		} else {
			$data['error_image'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/rgen', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->modSettings['main_tpl'], $data));
	}
	
	public function rest() {
		$response = array();
		$this->load->model($this->modSettings['modelPath']);
		$this->load->model('design/layout');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/manufacturer');
		
		//echo "<pre>".print_r($this->request->get['parts'],true)."</pre>";
		$urlparts = explode('/', $this->request->get['parts']);

		/* :t/:f/:g/:s/:k/:i/:e
		----------------------*/
		$t = isset($urlparts[0]) ? $urlparts[0] : null;
		$f = isset($urlparts[1]) ? $urlparts[1] : null;
		$g = isset($urlparts[2]) ? $urlparts[2] : null;
		/*$s = isset($urlparts[2]) ? $urlparts[2] : null;
		$k = isset($urlparts[3]) ? $urlparts[3] : null;
		$i = isset($urlparts[4]) ? $urlparts[4] : null;
		$e = isset($urlparts[5]) ? $urlparts[5] : null;*/
		$v = json_decode(file_get_contents('php://input'), true);
		$check_g = $g != null || $g != '';
		$check_v = $v != null || $v != '';


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			try {
				if (count($urlparts) < 2) {
					throw new Exception('Invalid URL');
				}
				if ($t == 'removeTheme') { 
					$theme_id = isset($urlparts[1]) ? $urlparts[1] : null;
					$response['data'] = $this->{$this->modSettings['model']}->{$t}($theme_id);
					$response['status'] = 'success';
				}

				/* PSOT - SETTINGS
				------------------------*/
				if ($t == 'settings') {
					if ($f == 'Add' && $check_g && $check_v) { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						if ($k != '' || $k != null) {
							$response['data'] = $this->{$this->modSettings['model']}->{'settings'.$f}($g, $k, $v);
							$response['status'] = 'success';
						}
					}
					if ($f == 'Edit' && $check_g && $check_v) { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						if ($k != '' || $k != null) {
							$response['data'] = $this->{$this->modSettings['model']}->{'settings'.$f}($g, $k, $v);
							$response['status'] = 'success';
						}
					}
					if ($f == 'Save') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'settings'.$f}($g, $s, $v);
						$response['status'] = 'success';
					}


				/* PSOT - THEME STORAGE
				------------------------*/
				} elseif ($t == 'themestorage') {
					// Theme storage functions
					if ($f == 'Editlist' && $check_v) { 
						$response['status'] = 'success';
						file_put_contents(FILE_THEME_STORAGE_LIST, json_encode($v), LOCK_EX);
					}
					if ($f == 'Newtheme' && $check_g) { 
						$response['data'] = $this->{$this->modSettings['model']}->{'storage'.$f}($g, 'rgen_theme', 'rgen_settings');
						$response['status'] = 'success';
						file_put_contents(DIR_THEME_STORAGE.'rgen_'.$g.'.json', json_encode($response['data']), LOCK_EX);
					}
					if ($f == 'Removetheme' && $check_g) { 
						$file = DIR_THEME_STORAGE.'rgen_'.$g.'.json';
						if (file_exists($file)) {
							unlink($file);
						}
						$response['data'] = '';
						$response['status'] = 'success';
					}
					

				/* PSOT - THEME
				------------------------*/
				} elseif ($t == 'theme') {
					if ($f == 'Editsection') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'theme'.$f}($g, $s, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Editkey') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$k = isset($urlparts[4]) ? $urlparts[4] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'theme'.$f}($g, $s, $k, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Savefonts') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'theme'.$f}($g, $s, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Removekey') { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'theme'.$f}($g, $k);
						$response['status'] = 'success';
					}

					$response['status'] = 'success';

				/* PSOT - MOD CUSTOMIZE
				------------------------*/
				} elseif ($t == 'modtheme') {
					if ($f == 'Editsection') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'modtheme'.$f}($g, $s, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Editkey') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$k = isset($urlparts[4]) ? $urlparts[4] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'modtheme'.$f}($g, $s, $k, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Savefonts') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'modtheme'.$f}($g, $s, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Removekey') { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'modtheme'.$f}($g, $k);
						$response['status'] = 'success';
					}

					$response['status'] = 'success';

				/* PSOT - MODULES
				------------------------*/
				} elseif ($t == 'module') {
					if ($f == 'Editsection' && $check_g && $check_v) { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g, $s, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Editkey' && $check_g && $check_v) { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$k = isset($urlparts[4]) ? $urlparts[4] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g, $s, $k, $v);
						$response['status'] = 'success';
					}
					if ($f == 'Removekey' && $check_g) { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$k = isset($urlparts[4]) ? $urlparts[4] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g, $s, $k);
						$response['status'] = 'success';
					}
					if ($f == 'Assign' && $check_g && $check_v) { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$k = isset($urlparts[4]) ? $urlparts[4] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g, $s, $k, $v);
						$response['status'] = 'success';
					}

				/* PSOT - SYSTEM
				------------------------*/
				} elseif ($t == 'system') {

					// Backup
					if ($f == 'backup' && $check_v) { 
						if ($this->user->hasPermission('modify', 'tool/backup')) {
							$this->load->model('tool/backup');

							$dateinfo = date('Y-M-d_H-i-s', time());

							// Directory name
							$dir_name = isset($v['name']) && $v['name'] != '' ? $v['name'].'-'.$dateinfo : 'RGen-Theme-'.$dateinfo;

							if (!is_dir(DIR_DB_BACKUP.$dir_name)) {
								mkdir(DIR_DB_BACKUP.$dir_name, 0700, true);	
							}

							if (isset($v['modlist']) && sizeof($v['modlist']) > 0) {
								foreach ($v['modlist'] as $mod_key => $mod_val) {
									if ($mod_val) {
										$type     = 'module'; // module, theme, other
										$mod_name = $mod_key;
										$file     =  DIR_DB_BACKUP . $dir_name . '/' . $mod_name . '.sql';
										file_put_contents($file, $this->{$this->modSettings['model']}->backup($type, $mod_name), LOCK_EX);	
									}
								}
							}
							if (isset($v['rgen_theme']) && $v['rgen_theme']) {
								$type     = 'theme'; // module, theme, other
								$mod_name = 'rgen_theme';
								$file     =  DIR_DB_BACKUP . $dir_name . '/' . $mod_name . '.sql';
								file_put_contents($file, $this->{$this->modSettings['model']}->backup($type, $mod_name), LOCK_EX);
							}

						}
						$response['data'] = '';
						$response['status'] = 'success';
					}

					// Restore
					if ($f == 'restore' && $check_v) { 
						$checklist = array();
						if ($v['rgen_theme']) {
							$checklist[] = 'rgen_theme';
						}
						foreach ($v['modlist'] as $key => $value) {
							if ($value) { $checklist[] = $key; }
						}
						foreach ($checklist as $file) {
							$filepath = DIR_DB_BACKUP.$v['name'].'/'.$file.'.sql';
							if (file_exists($filepath)) {
								$content = file_get_contents($filepath);
								$this->{$this->modSettings['model']}->restore($content);
							}
						}

						$response['data'] = '';
						$response['status'] = 'success';
					}

					// Backup remove
					if ($f == 'backupremove' && $check_g) { 
						$dir = DIR_DB_BACKUP.$g;
						$files = array_diff(scandir($dir), array('.','..')); 
						foreach ($files as $file) { 
							unlink("$dir/$file"); 
						} 
						rmdir($dir);
						
						$folders = array_diff(scandir(DIR_DB_BACKUP), array('..', '.'));
						$response['data'] = $folders;
						$response['status'] = 'success';
					}

					// Clear files
					if ($f == 'clear') {
						$clearType = $g;
						if ($clearType == 'css') {
							$files = glob(DIR_SYSTEM.'../'.DIR_MINIFY_CSS.'*.css');
							if ($files) {
								foreach ($files as $file) {
									if (file_exists($file)) {
										unlink($file);
									}
								}
							}	
						}
						if ($clearType == 'js') {
							$files = glob(DIR_SYSTEM.'../'.DIR_MINIFY_JS.'*.js');
							if ($files) {
								foreach ($files as $file) {
									if (file_exists($file)) {
										unlink($file);
									}
								}
							}
						}
						if ($clearType == 'module') {
							$k = isset($urlparts[3]) ? $urlparts[3] : 'n';
							$files = glob(DIR_SYSTEM.'../'.DIR_MODULE_CACHE.$k.'/*.tpl');
							if ($files) {
								foreach ($files as $file) {
									if (file_exists($file)) {
										unlink($file);
									}
								}
							}	
						}

						$response['data'] = '';
						$response['status'] = 'success';
						
					}

				} else {
					$response['status'] = 'error';
				}
				header('Content-Type: application/json');
				echo json_encode($response);

			} catch (Exception $e) {
				throw new Exception('Invalid Request');
			}

		}elseif($this->request->server['REQUEST_METHOD'] == 'POST'){
			$response['status'] = 'permission';
			header('Content-Type: application/json');
			echo json_encode($response);
		}

		if ($this->request->server['REQUEST_METHOD'] == 'GET') {
			try {
				if (count($urlparts) < 2) {
					throw new Exception('Invalid URL');
				}

				/* GET - SETTINGS
				------------------------*/
				if ($t == 'settings') {
					if ($f == 'Getgroup' && $check_g) { 
						$response['data'] = $this->{$this->modSettings['model']}->{'settings'.$f}($g);
						$response['status'] = 'success';
					}
					if ($f == 'Getkey' && $check_g) { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						if ($k != '' || $k != null) {
							$response['data'] = $this->{$this->modSettings['model']}->{'settings'.$f}($g, $k);
							$response['status'] = 'success';
						}
					}
					
				/* GET - THEME
				------------------------*/
				} elseif ($t == 'theme') {
					if ($f == 'Getsection') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'theme'.$f}($g, $s);
						$response['status'] = 'success';
					}
					if ($f == 'Getkey') { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'theme'.$f}($g, $k);
						$response['status'] = 'success';
						//echo "<pre>".print_r($response['data'],true)."</pre>";
					}
					if ($f == 'Getfonts') { 
						$response['data']['googlefonts'] = json_decode(file_get_contents(DIR_SYSTEM . '../rgen/data/fonts/google-fonts.json'));
						$response['data']['websafefonts'] = json_decode(file_get_contents(DIR_SYSTEM . '../rgen/data/fonts/other-fonts.json'));
						$response['status'] = 'success';
						//echo "<pre>".print_r($response['data']['websafefonts'],true)."</pre>";
					}
					if ($f == 'Geticons') { 
						$response['data'] = json_decode(file_get_contents(DIR_SYSTEM . '../rgen/data/icons/icons.json'));
						$response['status'] = 'success';
					}

					$response['status'] = 'success';

				/* GET - THEME STORAGE
				------------------------*/
				} elseif ($t == 'themestorage') {
					if ($f == 'Getlist' && $check_g) { 
						$file = FILE_THEME_STORAGE_LIST;
						$response['data'] = file_exists($file) ? json_decode(file_get_contents($file)) : '';
						$response['status'] = 'success';
					}
					if ($f == 'Loadtheme' && $check_g) { 
						$themedata = $this->rgen->factory->objToArray(json_decode(file_get_contents(DIR_THEME_STORAGE.'rgen_'.$g.'.json')));
						$this->{$this->modSettings['model']}->{'storage'.$f}($themedata);
						$response['data'] = '';
						$response['status'] = 'success';
					}
					
					$response['status'] = 'success';

				/* GET - BACKUP / RESTORE
				------------------------*/
				} elseif ($t == 'system') {
					if ($f == 'backuplist') { 
						$folders = array_diff(scandir(DIR_DB_BACKUP), array('..', '.'));
						$response['data'] = $folders;
						$response['status'] = 'success';
						//echo "<pre>".print_r($folders,true)."</pre>";
					}
					
					$response['status'] = 'success';

				/* GET - MOD CUSTOMIZE
				------------------------*/
				} elseif ($t == 'modtheme') {
					if ($f == 'Getsection') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'modtheme'.$f}($g, $s);
						$response['status'] = 'success';
					}
					if ($f == 'Getkey') { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'modtheme'.$f}($g, $k);
						$response['status'] = 'success';
						//echo "<pre>".print_r($response['data'],true)."</pre>";
					}
					$response['status'] = 'success';

				/* GET - MODULE
				------------------------*/
				} elseif ($t == 'module') {
					if ($f == 'Getsection') { 
						$s = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g, $s);
						$response['status'] = 'success';
					}
					if ($f == 'Getkey') { 
						$k = isset($urlparts[3]) ? $urlparts[3] : null;
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g, $k);
						$response['status'] = 'success';
					}
					if ($f == 'Getlayouts') { 
						$results = $this->model_design_layout->getLayouts();
						foreach ($results as $result) {
							$data['layouts'][] = array(
								'layout_id' => $result['layout_id'],
								'name'      => $result['name']
							);
						}
						foreach ($data['layouts'] as $key => $value) {
							$layout = $this->model_design_layout->getLayoutRoutes($value['layout_id']);
							foreach ($layout as $k => $v) {
								$data['layouts'][$key]['layout_route_id'] = $v['layout_route_id'];
								$data['layouts'][$key]['route'] = $v['route'];
							}
						}
						$response['data'] = $data['layouts'];
						$response['status'] = 'success';
					}
					if ($f == 'Getrevsliders') { 
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}();
						$response['status'] = 'success';
					}
					if ($f == 'Getallmodules') { 
						$response['data'] = $this->{$this->modSettings['model']}->{'mod'.$f}($g);
						$response['status'] = 'success';
					}

				/* GET - OTHER
				------------------------*/
				} elseif ($t == 'source') {
					if ($f == 'Getsource') { 
						$response['data'] = json_decode(file_get_contents(DIR_SYSTEM . '../rgen/data/themes/defaults.json'));
						$response['status'] = 'success';
					}
					if ($f == 'category') { 
						$id = isset($urlparts[2]) ? $urlparts[2] : null;
						$response['data'] = $id != null ? $this->model_catalog_category->getCategory((int)$id) : null;
						$response['status'] = 'success';
					}
					if ($f == 'product') { 
						$id = isset($urlparts[2]) ? $urlparts[2] : null;
						$response['data'] = $id != null ? $this->model_catalog_product->getProduct((int)$id) : null;
						$response['status'] = 'success';
					}
					if ($f == 'brand') { 
						$id = isset($urlparts[2]) ? $urlparts[2] : null;
						$response['data'] = $id != null ? $this->model_catalog_manufacturer->getManufacturer((int)$id) : null;
						$response['status'] = 'success';
					}

				} else {
					$response['status'] = 'error';
				}
				header('Content-Type: application/json');
				echo json_encode($response);

			} catch (Exception $e) {
				throw new Exception('Invalid Request');
			}
		}
	}

	public function render() {
		$file = DIR_ADMIN_TPL.$this->request->get['path'].'.tpl';
		if (file_exists($file)) {
			ob_start();
			require($file);
			$output = ob_get_contents();
			ob_end_clean();
			$this->response->setOutput($output);
		}
	}

	/* AUTOCOMPLETE - CATEGORY
	------------------------*/
	public function autocomplete_category() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_category->getCategories($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}
		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	/* AUTOCOMPLETE - PRODUCTS
	------------------------*/
	public function autocomplete_product() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
			$this->load->model('catalog/product');
			$this->load->model('catalog/option');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 5;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				$option_data = array();

				$product_options = $this->model_catalog_product->getProductOptions($result['product_id']);

				foreach ($product_options as $product_option) {
					$option_info = $this->model_catalog_option->getOption($product_option['option_id']);

					if ($option_info) {
						$product_option_value_data = array();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);

							if ($option_value_info) {
								$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
								);
							}
						}

						$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
						);
					}
				}

				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	/* AUTOCOMPLETE - BRANDS
	------------------------*/
	public function autocomplete_brand() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/manufacturer');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_manufacturer->getManufacturers($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'manufacturer_id' => $result['manufacturer_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	/* AUTOCOMPLETE - INFORMATION
	------------------------*/
	public function autocomplete_info() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/information');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 100
			);

			$results = $this->model_catalog_information->getInformations($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'information_id' => $result['information_id'],
					'name'           => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/'.$this->modSettings['modKey'])) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}