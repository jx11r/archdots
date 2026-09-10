local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local status_icons = {
  active   = "",
  empty    = "",
  occupied = "",
}

local function by_state(self, tag, index, colors, icons, inactive)
  local text = self:get_children_by_id("tag_icon")[1]
  local color = colors[index] or beautiful.fg_normal
  local icon

  if tag.urgent then
    icon = status_icons.occupied
    color = beautiful.bg_urgent
  elseif tag.selected then
    icon = status_icons.active
  elseif #tag:clients() > 0 then
    icon = status_icons.occupied
  else
    icon = status_icons.empty
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

-- TODO: improve when tag is selected
local function by_icon(self, tag, index, colors, icons, inactive)
  local text = self:get_children_by_id("tag_icon")[1]
  local color = colors[index] or beautiful.fg_normal
  local icon = icons[index] or tag.name

  if tag.urgent then
    color = beautiful.bg_urgent
  elseif tag.selected and #tag:clients() == 0 then
    color = inactive
  elseif #tag:clients() == 0 then
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
  local font = args.font or beautiful.font
  local inactive = args.inactive or beautiful.fg_normal
  local spacing = args.spacing or 8
  local icons = args.icons or false
  local render = icons and by_icon or by_state

  args.colors = nil
  args.font = nil
  args.inactive = nil
  args.spacing = nil
  args.icons = nil

  args.layout = args.layout or {
    spacing = spacing,
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

    create_callback = function(self, tag, index)
      render(self, tag, index, colors, icons, inactive)
    end,

    update_callback = function(self, tag, index)
      render(self, tag, index, colors, icons, inactive)
    end,
  }

  return awful.widget.taglist(args)
end
