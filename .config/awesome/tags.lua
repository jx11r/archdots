local awful = require("awful")
local beautiful = require("beautiful")

local c = beautiful.palette
local M = {}

local layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.spiral,
  awful.layout.suit.floating,
}

local tags = {
  { name = "1", icon = "", color = c.teal, layout = layouts[1] },
  { name = "2", icon = "", color = c.blue, layout = layouts[1] },
  { name = "3", icon = "󰆼", color = c.magenta, layout = layouts[1] },
  { name = "4", icon = "󰹍", color = c.red, layout = layouts[1] },
  { name = "q", icon = "󰈹", color = c.orange, layout = layouts[1] },
  { name = "w", icon = "󰇮", color = c.green1, layout = layouts[1] },
  { name = "e", icon = "󰝰", color = c.yellow, layout = layouts[1] },
  { name = "r", icon = "", color = c.purple, layout = layouts[1] },
}

M.setup = function(screen)
  for i, tag in ipairs(tags) do
    awful.tag.add(tag.name, {
      layout = tag.layout,
      screen = screen,
      selected = (i == 1),
    })
  end
end

local function extract_property(key)
    local list = {}
    for _, tag in ipairs(tags) do
        table.insert(list, tag[key])
    end
    return list
end

awful.layout.layouts = layouts
M.colors = extract_property("color")
M.icons = extract_property("icon")
M.keys = extract_property("name")

return M
