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
        "lstopo",
        "MessageWin",
        "mpv",
        "pavucontrol",
        "qt5ct",
        "Sxiv",
        "Tor Browser",
        "Thunar",
        "veromix",
        "Wpa_gui",
        "wt-floating",
        "Xephyr",
        "Xfce4-about",
        "xtightvncviewer",
      },
      name = {
        "Event Tester",
        "Power Manager",
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

  -- tag assignment
  { rule = { class = "code" },          properties = { tag = "2" } },
  { rule = { class = "insomnia" },      properties = { tag = "3" } },
  { rule = { class = "Gimp" },          properties = { tag = "4" } },
  { rule = { class = "obs" },           properties = { tag = "4" } },
  { rule = { class = "Brave-browser" }, properties = { tag = "q" } },
  { rule = { class = "discord" },       properties = { tag = "w" } },
  { rule = { class = "Telegram" },      properties = { tag = "w" } },
  { rule = { class = "Evince" },        properties = { tag = "e" } },
}
