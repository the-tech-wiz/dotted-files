local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",

	font = wezterm.font("monospace", { weight = "Medium" }),
	font_size = 14.5,
	freetype_load_flags = "NO_HINTING",

	enable_tab_bar = false,
	window_content_alignment = {
		horizontal = "Center",
		vertical = "Center",
	},
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
