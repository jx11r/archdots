local wezterm = require 'wezterm'
local action = wezterm.action

return {
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = action.CopyTo 'ClipboardAndPrimarySelection',
  },

  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = action.PasteFrom 'Clipboard',
  },

  {
    key = '-',
    mods = 'CTRL',
    action = action.DecreaseFontSize,
  },

  {
    key = '+',
    mods = 'CTRL',
    action = action.IncreaseFontSize,
  },

  {
    key = '0',
    mods = 'CTRL',
    action = action.ResetFontSize,
  },

  {
    key = 't',
    mods = 'CTRL',
    action = action.SpawnTab 'CurrentPaneDomain',
  },

  {
    key = 'w',
    mods = 'CTRL',
    action = action.CloseCurrentPane { confirm = false },
  },

  {
    key = 'Tab',
    mods = 'CTRL',
    action = action { ActivateTabRelative = 1 },
  },

  {
    key = 'Tab',
    mods = 'CTRL|SHIFT',
    action = action { ActivateTabRelative = -1 },
  },

  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = action.Search { CaseSensitiveString = '' },
  },

  {
    key = 'Enter',
    mods = 'CTRL',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Left', 5 },
  },

  {
    key = 'H',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Left', 5 },
  },

  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Right', 5 },
  },

  {
    key = 'L',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Right', 5 },
  },

  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Up', 5 },
  },

  {
    key = 'K',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Up', 5 },
  },

  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Down', 5 },
  },

  {
    key = 'J',
    mods = 'CTRL|SHIFT|ALT',
    action = action.AdjustPaneSize { 'Down', 5 },
  },

  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Left',
  },

  {
    key = 'H',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Left',
  },

  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Right',
  },

  {
    key = 'L',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Right',
  },

  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Up',
  },

  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Up',
  },

  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Down',
  },

  {
    key = 'J',
    mods = 'CTRL|SHIFT',
    action = action.ActivatePaneDirection 'Down',
  },

  {
    key = 'Z',
    mods = 'CTRL|SHIFT',
    action = action.TogglePaneZoomState,
  },
}
