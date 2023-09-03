local wezterm = require 'wezterm'
local keys = require 'keys'

return {
  audible_bell = 'Disabled',
  automatically_reload_config = true,
  bold_brightens_ansi_colors = true,
  check_for_updates = false,
  debug_key_events = false,
  default_cursor_style = 'SteadyBar',
  enable_scroll_bar = false,
  enable_wayland = false,
  force_reverse_video_cursor = true,
  line_height = 1.0,
  scrollback_lines = 3500,
  show_update_window = false,

  -- colorschemes
  color_scheme = 'Catppuccin Mocha',

  -- font
  font_size = 11,
  font = wezterm.font {
    family = 'CaskaydiaCove Nerd Font',
    stretch = 'Normal',
    weight = 'Regular',
  },

  -- key bindings
  disable_default_key_bindings = true,
  keys = keys,

  -- tab bar
  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- window
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.9,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = 'NONE',
  window_padding = {
    top = 25,
    right = 25,
    bottom = 25,
    left = 25,
  },
}
