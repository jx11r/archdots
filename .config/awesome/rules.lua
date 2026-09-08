local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("keys")

awful.rules.rules = {
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = keys.clientkeys,
      buttons = keys.clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- floating clients
  {
    rule_any = {
      instance = {
        "DTA",
        "copyq",
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Gpicview",
        "Kruler",
        "kvantummanager",
        "Lxappearance",
        "MessageWin",
        "pavucontrol",
        "qt5ct",
        "Sxiv",
        "Tor Browser",
        "Thunar",
        "veromix",
        "Wpa_gui",
        "wt-floating",
        "Xfce4-about",
        "xtightvncviewer",
      },
      name = {
        "Event Tester",
      },
      role = {
        "AlarmWindow",
        "ConfigManager",
        "pop-up",
      }
    },
    properties = {
      floating = true,
      placement = awful.placement.centered,
    }
  },

  -- add titlebars to normal clients and dialogs
  {
    rule_any = { type = { "normal", "dialog" }
    },
    properties = { titlebars_enabled = false }
  },
}
