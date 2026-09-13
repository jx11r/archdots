local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local bindings = require("bindings")
local tags = require("tags")
local widgets = require("widgets")
local custom = require("widgets.custom")

local palette = beautiful.palette
local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- re-set wallpaper when a screen's geometry changes
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)
  tags.setup(s)
  s.mylayoutbox = awful.widget.layoutbox(s)

  s.mytaglist = custom.taglist {
    screen   = s,
    filter   = awful.widget.taglist.filter.all,
    buttons  = bindings.taglist_buttons,
    font     = beautiful.fonts.text(15),
    inactive = palette.gray,
    colors   = tags.colors,
  }

  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = bindings.tasklist_buttons,
    style   = {
      fg_normal = palette.gray,
      fg_focus = palette.fg,
    }
  }

  s.mywibox = awful.wibar({
    position     = "top",
    screen       = s,
    stretch      = false,
    height       = beautiful.dpi(20, s),
    border_width = 4,
    border_color = beautiful.bg_normal,
    width        = s.geometry.width - 28,
  })

  s.mywibox.y = 10
  s.mywibox:struts({
    top = beautiful.dpi(20, s) + 18
  })

  s.mywibox:setup {
    widgets.setup(s),
    left = 8,
    right = 8,
    layout = wibox.container.margin,
  }
end)
