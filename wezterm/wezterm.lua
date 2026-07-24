local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('IosevkaTerm Nerd Font', { weight = 'Medium' })
config.font_size = 13
config.default_prog = { 'debian' }
config.color_scheme = 'Tokyo Night'
config.enable_tab_bar = false

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config