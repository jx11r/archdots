local beautiful = require("beautiful")
local wibox = require("wibox")

local M = {}

function M.fg(text, color, bold)
  local content = bold and string.format("<b>%s</b>", text) or text
  return string.format("<span foreground='%s'>%s</span>", color, content)
end

function M.icon(text, color, size)
  local font = size and beautiful.fonts.icon(size) or beautiful.icon_font
  return wibox.widget {
    markup = M.fg(text, color),
    align = "center",
    valign = "center",
    font = font,
    widget = wibox.widget.textbox,
  }
end

function M.spacer(width)
  return wibox.widget {
    forced_width = width,
    opacity = 0,
    widget = wibox.widget.separator,
  }
end

return M
