(function(){
	'use strict';
	angular.module('rgen').factory('menuFactory', [function () {
		return {
			tree_node: function () {
				return {
					id: 1,
					depth: 1,
					status: true,
					node_type: "main", // Main - Row - Column - Item
					node_title: "Menu item",
					submenu_type: 'n', // None - Fly out - Mega menu
					item_data: {},
					items: []
				}
			},
			main: function () {
				return {
					node: 'main',
					title: {},
					url: "",
					icon: {
						"status": false,
						"type": "ico",
						"icon": "fa fa-chevron-up",
						"size": "14px",
						"color": "#ffffff",
						"image": "../image/no_image.png",
						"bgsize": "auto",
						"bgsize_w": "100%",
						"bgsize_h": "100%",
						"position": "center center",
						"css": ""
					},
					icon_position: 'l',
					icon_block: {},
					css_class: '',
					label: {
						status: false,
						type: "txt",
						text: {},
						image: "../image/no_image.png",
						img_w: 40,
						background: "#000",
						text_color: "#fff",
						text_size: "12px",
						css_class: "",
						block: {},
						top: -15,
						left: 0
					},
					submenu_type: "n",
					submenu_size: "sub-size4"
				}
			},
			row: function () {
				return {
					node: 'row',
					gutter: 'gt20',
					margin_b: 'mb20'
				}
			},
			col: function (argument) {
				return {
					node       : 'col',
					col_size   : 'cl4',
					lg_desktop : 'cl4',
					desktop    : ' d-xl4',
					tablet     : ' t-xl6',
					mob_xl     : ' m-xl6',
					mob_sm     : ' m-sm12',
					mob_xs     : ' m-xs12',
					classGroup : 'cl4 d-xl4 t-xl6 m-xl6 m-sm12 m-xs12',
					border     : {}
				}
			},
			item: function () {
				return {
					node: 'item',
					item_type: "normal", // Normal link, Categories, Products, Brands
					tab: {
						status: false,
						tab_style: "side" // side / top
					},
					sub_item: {
						title: {},
						url: "normal url",
						win: "n", // Open in new window
						style: "normal" // Title / Normal
					}
				}
			},
			normal_link: function () {
				return {
					title: {},
					url: "normal url",
					win: "n", // Open in new window
					style: "normal",
					css: {}
				}
			},
			cat: function () {
				return {
					category: {},
					image_w: '150',
					image_h: '150',
					win: "n", // Open in new window
					style: 1,
					max_sub: 5
				}
			},
			prd: function () {
				return {
					products: [],
					image_w: '150',
					image_h: '150',
					style: 1,
					grid_settings: {
						lg_desktop: 'eq4',
						desktop: 	'd-eq4',
						tablet: 	't-eq4',
						mob_xl: 	'mxl-eq2',
						mob_sm: 	'msm-eq2',
						mob_xs: 	'mxs-eq1',
						gutter: 	'gt20',
						margin_b: 	'mb20',
						classGroup:	'eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'
					}
				}
			},
			brand: function () {
				return {
					brands: [],
					image_w: '150',
					image_h: '150',
					style: 1,
					grid_settings: {
						lg_desktop: 'eq4',
						desktop: 	'd-eq4',
						tablet: 	't-eq4',
						mob_xl: 	'mxl-eq2',
						mob_sm: 	'msm-eq2',
						mob_xs: 	'mxs-eq1',
						gutter: 	'gt20',
						margin_b: 	'mb20',
						classGroup:	'eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'
					}
				}
			},
			bannerimg: function () {
				return {
					title_status: true,
					title: {},
					image: "../image/no_image.png",
					url: "",
					win: "n",
					style: 1,
					margin_b: " mrb5",
					image_w: '200',
					image_h: '200'
				}
			},
			infobox: function () {
				return {
					title_status: true,
					description_status: true,
					image_status: true,
					btn_status: true,

					title: {},
					image: "../image/no_image.png",
					description: {},
					url: "",
					win: "n",
					style: 1,
					margin_b: " mrb5",
					image_w: '200',
					image_h: '200',
					align: 'left',
					button: {}
				}
			},
			customhtml: function () {
				return {
					html: {},
					margin_b: " mrb5",
					css: {}
				}
			},
			assign: function () {
				return {
					module_id:'',
					layout_id: '',
					position: '',
					status: true,
					sort_order: 0,
					type: 'h',
					align: 'left',
					menuwidth: 'bx'
				}
			}
		}
	}]);
})();