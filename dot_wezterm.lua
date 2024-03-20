local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Ef-Melissa-Light'

config.colors = {
  background = '#f2ecbc'
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font = wezterm.font 'Fira Code'
config.font_size =  14.0

return config
