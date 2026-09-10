pcall(require, "luarocks.loader")
package.loaded["awful.hotkeys_popup.keys.tmux"] = {}

local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- error handling
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    text = awesome.startup_errors
  })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    if in_error then return end
    in_error = true
    naughty.notify({
      preset = naughty.config.presets.critical,
      text = tostring(err)
    })
    in_error = false
  end)
end

-- modules
require("tags")
require("screens")
require("bindings")
require("rules")
require("signals")
