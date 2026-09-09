local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")
local widgets = require("widgets")

local markup = lain.util.markup
local palette = beautiful.palette

-- create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end))

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

local function fg(text, color, bold)
  local content = bold and ("<b>" .. text .. "</b>") or text
  return '<span foreground="' .. color .. '">' .. content .. '</span>'
end

local function sep(width)
  return wibox.widget {
    forced_width = width,
    opacity = 0,
    widget = wibox.widget.separator,
  }
end

local function icon(text, color, size)
  local font = size and (beautiful.icon_font_n .. " " .. size) or beautiful.icon_font
  return wibox.widget {
    markup = fg(text, color),
    align = "center",
    valign = "center",
    font = font,
    widget = wibox.widget.textbox,
  }
end

local sep2 = wibox.widget {
  markup = fg("󰇙", palette.gray),
  align = "center",
  valign = "center",
  font = beautiful.icon_font_n .. " 8",
  widget = wibox.widget.textbox,
}

local textclock = wibox.widget {
  format = fg("%H:%M", palette.magenta, true),
  widget = wibox.widget.textclock,
}

local textdate = wibox.widget {
  format = fg("%d/%b", palette.blue, true),
  widget = wibox.widget.textclock,
}

local mem = lain.widget.mem {
  settings = function()
    widget:set_markup(fg(mem_now.used .. "M", palette.yellow, true))
  end
}

local cpu = lain.widget.cpu {
  settings = function()
    widget:set_markup(fg(cpu_now.usage .. "%", palette.red, true))
  end
}

local temp = lain.widget.temp {
  format = "%.0f",
  settings = function()
    widget:set_markup(fg(coretemp_now .. "°C", palette.orange, true))
  end
}

local fs_home = lain.widget.fs {
  timeout = 60,
  settings = function()
    widget:set_markup(fg(fs_now["/home"].percentage .. "%", palette.teal, true))
  end
}

local fs_root = lain.widget.fs {
  timeout = 60,
  settings = function()
    widget:set_markup(fg(fs_now["/"].percentage .. "%", palette.green2, true))
  end
}

local volume = widgets.volume {
  timeout = 1,
  settings = function(volume)
    local text = volume.value
    if volume.value == "muted" then
      text = "M"
    end
    volume.widget:set_markup(fg(text, palette.green, true))
  end
}

local updates = widgets.checkupdates {
  initial_text = "0",
  settings = function(updates)
    updates.widget:set_markup(fg(updates.count, palette.purple, true))
  end
}

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)
  awful.tag({ "1", "2", "3", "4", "q", "w", "e", "r" }, s, awful.layout.layouts[1])

  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))

  s.mytaglist = widgets.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    font = beautiful.font_n .. " 15",
    inactive = palette.gray,
    colors  = {
      palette.teal,
      palette.blue,
      palette.magenta,
      palette.red,
      palette.orange,
      palette.green1,
      palette.yellow,
      palette.purple,
    },
  }

  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  s.mywibox = awful.wibar({
    position     = "top",
    screen       = s,
    stretch      = false,
    height       = 20,
    border_width = 4,
    width        = s.geometry.width - 28,
  })

  s.mywibox.y = 10
  s.mywibox:struts({
    top = 20 + 18
  })

  s.mywibox:setup {
    {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        icon("", palette.cyan, 14),
        sep(6),
        s.mytaglist,
        sep(3),
        sep2,
      },
      s.mytasklist,
      {
        layout = wibox.layout.fixed.horizontal,
        sep2,
        wibox.widget.systray(),
        sep(3),
        icon("", palette.green),
        volume.widget,
        sep(4),
        icon("", palette.orange),
        temp.widget,
        sep(6),
        icon("󰍛 ", palette.red),
        cpu.widget,
        sep(6),
        icon(" ", palette.yellow),
        mem.widget,
        sep(5),
        icon(" ", palette.purple),
        updates.widget,
        sep(5),
        icon("󰌽 ", palette.green2),
        fs_root.widget,
        sep(6),
        icon(" ", palette.teal),
        fs_home.widget,
        sep(6),
        icon("󰃭 ", palette.blue),
        textdate,
        sep(6),
        icon("󰥔 ", palette.magenta),
        textclock,
        sep(5),
        s.mylayoutbox,
      },
    },
    left = 8,
    right = 8,
    layout = wibox.container.margin,
  }
end)
