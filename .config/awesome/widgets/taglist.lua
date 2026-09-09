local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local icons = {
  active   = "",
  empty    = "",
  occupied = "",
}

local function update_tag(self, tag, index, colors, inactive)
  local text = self:get_children_by_id("tag_icon")[1]

  local color = colors[index] or beautiful.fg_normal
  local icon

  if #tag:clients() > 0 and tag.urgent then
    icon = icons.occupied
    color = beautiful.bg_urgent
  elseif tag.selected then
    icon = icons.active
  elseif #tag:clients() > 0 then
    icon = icons.occupied
  else
    icon = icons.empty
    color = inactive
  end

  text:set_markup(
    string.format(
      "<span foreground='%s'>%s</span>",
      color,
      icon
    )
  )
end

return function(args)
  args = args or {}

  local colors = args.colors or {}
  local inactive = args.inactive or beautiful.fg_normal
  local font = args.font or beautiful.font

  args.colors = nil
  args.inactive = nil

  args.layout = args.layout or {
    spacing = 8,
    layout = wibox.layout.fixed.horizontal,
  }

  args.widget_template = {
    {
      id = "tag_icon",
      align = "center",
      valign = "center",
      font = font,
      widget = wibox.widget.textbox,
    },

    widget = wibox.container.background,

    create_callback = function(self, tag, index, objects)
      update_tag(self, tag, index, colors, inactive)
    end,

    update_callback = function(self, tag, index, objects)
      update_tag(self, tag, index, colors, inactive)
    end,
  }

  return awful.widget.taglist(args)
end
