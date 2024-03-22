local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Latte"

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font = wezterm.font("Fira Code")
config.font_size = 16.0

config.window_background_opacity = 0.90

return config
