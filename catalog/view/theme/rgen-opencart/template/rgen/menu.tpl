<?php if (isset($data['menu'])) { 
$display_type = isset($settings['type']) && $settings['type'] == 'v' ? ' v-menu' : null; ?>
<nav id="<?php echo $module_id; ?>" data-w="<?php echo isset($settings['menuwidth']) ? ' '.$settings['menuwidth'] : ' bx' ?>" class="rg-nav-wrp<?php echo ' menu-'.$settings['align'] . $module_class . $display_type; ?>">
	<div class="rg-nav-handle"><i class="fa fa-bars"></i></div>
	<ul class="rg-nav">
		<?php foreach ($data['menu'] as $key => $menu) { 

		/* Main menu items
		------------------------*/ ?>
		<li <?php echo isset($menu['item_class']) ? 'class="'.$menu['item_class'].'"' : null; ?>>
			<?php if (isset($menu['item_url']) && $menu['item_url'] != '') { ?>
			<a class="main-item" href="<?php echo $menu['item_url']; ?>"><?php 
				include $this->rgen('label_icon');
				echo html_entity_decode($menu['item_title'][$lng], ENT_QUOTES, 'UTF-8'); ?>
			</a>	
			<?php } else { ?>
			<span class="main-item"><?php 
				include $this->rgen('label_icon');
				echo html_entity_decode($menu['item_title'][$lng], ENT_QUOTES, 'UTF-8'); ?>
			</span>
			<?php }

			/* Sub menu - Fly out menu
			------------------------*/
			if ($menu['submenu_type'] == 'fly') { ?>
			<div class="sub<?php echo ' '.$menu['submenu_size']; ?>">
				<ul class="nav-fly">
					<?php foreach ($menu['submenu'] as $key => $submenu) { 
						
						switch ($submenu['item_type']) {
							case 'normal': ?>
							<li>
								<a href="<?php echo $submenu['item_data']['url']; ?>"<?php 
									echo isset($submenu['item_data']['open']) && $submenu['item_data']['open'] == 'y' ? " target='_blank'" : null; 
									?>><?php echo $submenu['item_data']['title'][$lng]; ?></a>
								<?php if (isset($submenu['navfly'])) { echo $submenu['navfly']; } ?>
							</li><?php 
							break;
							
							case 'cat': ?>
							<li>
								<a href="<?php echo $submenu['item_data']['url']; ?>"><?php echo $submenu['item_data']['title']; ?></a>
								<?php if (isset($submenu['navfly'])) { echo $submenu['navfly']; } ?>
							</li><?php 
							break;

							case 'prd':
							if (isset($submenu['item_data'])) { ?>
							<?php foreach ($submenu['item_data']['products'] as $product) { ?>
							<li>
								<?php include $this->rgen('flyout_prd'); ?>
							</li>
							<?php } ?>
							<?php } 
							break;

							case 'brand':
							if (isset($submenu['item_data'])) { ?>
							<?php foreach ($submenu['item_data']['brands'] as $brand) { ?>
							<li>
								<?php include $this->rgen('flyout_brand'); ?>
							</li>
							<?php } ?>
							<?php } 
							break;
						}

					} ?>
				</ul>
			</div>
			<?php }

			/* Sub menu - Mega menu
			------------------------*/
			if ($menu['submenu_type'] == 'mega') { ?>
			<div class="sub<?php echo ' '.$menu['submenu_size']; ?>">
				<div class="nav-mega">
					
					<?php 
					/* Row */
					if (isset($menu['submenu'])) {
					foreach ($menu['submenu'] as $row_k => $row) { ?>
					<div class="rw<?php echo ' '.$row['item_data']['gutter'] . ' ' .$row['item_data']['margin_b']; ?>">

						<?php
						/* Column */
						if (isset($row['nested_item'])) {
						foreach ($row['nested_item'] as $col_k => $column) { 
						if (isset($column) && $column['status']) { ?>
						<div class="<?php echo $column['item_data']['col_size']; ?>" style="<?php echo $column['item_data']['border']; ?>">

							<?php 
							/* Items */
							if (isset($column['nested_item'])) { 
							foreach ($column['nested_item'] as $item) { 
								if (isset($item)) {
									switch ($item['item_type']) {

										/* Item - Normal
										------------------------*/
										case 'normal': ?>
										<ul class="mg-items normal-item">
											<li class="<?php echo $item['item_data']['style'] == 'title' ? 'hd' : null; ?>">
												<?php if (isset($item['item_data']['url']) && $item['item_data']['url'] != '') { ?>
												<a class="sub-item" href="<?php echo $item['item_data']['url']; ?>"<?php echo $item['item_data']['open'] == 'y' ? " target='_blank'" : null; ?> style="<?php echo $item['item_data']['css']; ?>"><?php echo $item['item_data']['title'][$lng]; ?></a>	
												<?php } else { ?>
												<span class="sub-item" style="<?php echo $item['item_data']['css']; ?>"><?php echo $item['item_data']['title'][$lng]; ?></span>	
												<?php } ?>
											</li>
											
											<?php 
											if (isset($item['nested_item'])) { 
											foreach ($item['nested_item'] as $k => $v) { 

												switch ($v['item_type']) {
													case 'normal':
														if (isset($v['item_data'])) { ?>
														<li>
															<a class="sub-item" href="<?php echo $v['item_data']['url']; ?>" style="<?php echo $v['item_data']['css']; ?>"><?php echo $v['item_data']['title'][$lng]; ?></a>
															<?php if (isset($v['navfly'])) { echo $v['navfly']; } ?>
														</li>
														<?php }
														break;
													
													case 'cat':
														if (isset($v['item_data'])) { ?>
														<li>
															<a class="sub-item" href="<?php echo $v['item_data']['url']; ?>"><?php echo $v['item_data']['title']; ?></a>
															<?php if (isset($v['navfly'])) { echo $v['navfly']; } ?>
														</li>
														<?php } 
														break;

													case 'prd':
														if (isset($v['item_data'])) { ?>
														<li><?php
															if ((isset($v['item_data']['products'])) && (sizeof($v['item_data']['products']) > 0)) {?>
															<ul class="nav-prd<?php echo ' '.$v['item_data']['grid_settings']; ?>">
																<?php foreach ($v['item_data']['products'] as $key => $product) { ?>
																<li class="cl">
																	<?php include $this->rgen('sm_prd'.$v['item_data']['style']); ?>
																</li>
																<?php } ?>
															</ul>		
															<?php } ?>
														</li>
														<?php }
														break;
												}

											} } ?>

										</ul><?php
										break;

										/* Item - Categories
										------------------------*/
										case 'cat':
										include $this->rgen('menu_mg_cat'.$item['item_data']['style']);
										break;

										/* Item - Products
										------------------------*/
										case 'prd': 
										if ((isset($item['item_data'])) && (sizeof($item['item_data']) > 0)) {?>
										<ul class="nav-prd<?php echo ' '.$item['item_data']['grid_settings']; ?>">
											<?php foreach ($item['item_data']['products'] as $key => $product) { ?>
											<li class="cl">
												<?php include $this->rgen('sm_prd'.$item['item_data']['style']); ?>
											</li>
											<?php } ?>
										</ul>		
										<?php }
										break;

										/* Item - Brands
										------------------------*/
										case 'brand': 
										if ((isset($item['item_data'])) && (sizeof($item['item_data']) > 0)) {?>
										<ul class="nav-brands<?php echo ' '.$item['item_data']['grid_settings']; ?>">
											<?php foreach ($item['item_data']['brands'] as $key => $brand) { ?>
											<li class="cl">
												<?php include $this->rgen('brand'.$item['item_data']['style']); ?>
											</li>
											<?php } ?>
										</ul>		
										<?php }
										break;

										/* Item - Banner image
										------------------------*/
										case 'bannerimg': 
										if ((isset($item['item_data'])) && (sizeof($item['item_data']) > 0)) {?>
										<?php 
											$banner = $item['item_data'];
											include $this->rgen('bannerimg'.$item['item_data']['style']); 
										?>
										<?php }
										break;

										/* Item - Info box
										------------------------*/
										case 'infobox': 
										if ((isset($item['item_data'])) && (sizeof($item['item_data']) > 0)) {?>
										<?php 
											$infobox = $item['item_data'];
											include $this->rgen('menu_infobox'.$item['item_data']['style']); 
										?>
										<?php }
										break;

										/* Item - Custom HTML
										------------------------*/
										case 'customhtml': 
										if ((isset($item['item_data'])) && (sizeof($item['item_data']) > 0)) {?>
										<div class="nav-customhtml<?php echo $item['item_data']['margin_b']; ?>" style="<?php echo $item['item_data']['css']; ?>">
											<?php echo html_entity_decode($item['item_data']['html'][$lng], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }
										break;

									}
								}
							} } ?>
						</div>
						<?php } } }
						/* End - Column */ ?>

					</div>
					<?php } }
					/* End - Row */ ?>
					
				</div>
			</div>
			<?php } ?>

		</li>
		<?php } ?>
	</ul>
</nav>
<script>
jQuery(document).ready(function($) {
	$('#<?php echo $module_id; ?>').rgenmenu();
});
</script>
<?php } ?>