local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "Dracula (Official)",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 14,
	window_background_opacity = 0.8,
}

return config
