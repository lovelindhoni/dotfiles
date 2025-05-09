local wezterm = require("wezterm")

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	sections = {
		tabline_x = "",
		tabline_y = "",
		tab_active = { "index", { "process", padding = { left = 0, right = 1 } } },
	},
	options = {
		section_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		component_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thin,
			right = wezterm.nerdfonts.ple_left_half_circle_thin,
		},
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		color_overrides = {
			normal_mode = {
				a = { fg = "#2d353b", bg = "#a7c080" },
				b = { fg = "#a7c080", bg = "#42494e" },
				c = { fg = "#d3c6aa", bg = "#2d353b" },
			},
			copy_mode = {
				a = { fg = "#2d353b", bg = "#dbbc7f" },
				b = { fg = "#dbbc7f", bg = "#42494e" },
				c = { fg = "#d3c6aa", bg = "#2d353b" },
			},
			search_mode = {
				a = { fg = "#2d353b", bg = "#7fbbb3" },
				b = { fg = "#7fbbb3", bg = "#42494e" },
				c = { fg = "#d3c6aa", bg = "#2d353b" },
			},
			tab = {
				active = { fg = "#7fbbb3", bg = "#42494e" },
				inactive = { fg = "#d3c6aa", bg = "#2d353b" },
				inactive_hover = { fg = "#d699b6", bg = "#42494e" },
			},
			scheme = {
				foreground = "#d3c6aa",
				background = "#2d353b",
				cursor_fg = "#2d353b",
				cursor_bg = "#d3c6aa",
				cursor_border = "#d3c6aa",
				ansi = {
					"#4b565c",
					"#e67e80",
					"#a7c080",
					"#dbbc7f",
					"#7fbbb3",
					"#d699b6",
					"#83c092",
					"#d3c6aa",
				},
				brights = {
					"#5c6a72",
					"#f85552",
					"#8da101",
					"#dfa000",
					"#3a94c5",
					"#df69ba",
					"#35a77c",
					"#dfddc8",
				},
			},
		},
	},
})
