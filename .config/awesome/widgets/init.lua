local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")

local custom = require("widgets.custom")
local utils = require("widgets.utils")

local c = beautiful.palette
local M = {}

local sep = wibox.widget {
  markup = utils.fg("󰇙", c.gray),
  align = "center",
  valign = "center",
  font = beautiful.fonts.icon(8),
  widget = wibox.widget.textbox,
}

local textclock = wibox.widget {
  format = utils.fg("%H:%M", c.magenta, true),
  widget = wibox.widget.textclock,
}

local textdate = wibox.widget {
  format = utils.fg("%d/%b", c.blue, true),
  widget = wibox.widget.textclock,
}

local mem = lain.widget.mem {
  settings = function()
    widget:set_markup(utils.fg(mem_now.used .. "M", c.yellow, true))
  end
}

local cpu = lain.widget.cpu {
  settings = function()
    widget:set_markup(utils.fg(cpu_now.usage .. "%", c.red, true))
  end
}

local temp = lain.widget.temp {
  format = "%.0f",
  settings = function()
    widget:set_markup(utils.fg(coretemp_now .. "°C", c.orange, true))
  end
}

local fs_home = lain.widget.fs {
  timeout = 60,
  settings = function()
    widget:set_markup(utils.fg(fs_now["/home"].percentage .. "%", c.teal, true))
  end
}

local fs_root = lain.widget.fs {
  timeout = 60,
  settings = function()
    widget:set_markup(utils.fg(fs_now["/"].percentage .. "%", c.green2, true))
  end
}

local volume = custom.volume {
  timeout = 1,
  settings = function(self)
    local text = self.value
    if self.value == "muted" then
      text = "M"
    end
    self.widget:set_markup(utils.fg(text, c.green, true))
  end
}

local updates = custom.checkupdates {
  initial_text = "0",
  settings = function(self)
    self.widget:set_markup(utils.fg(self.count, c.purple, true))
  end
}

function M.setup(s)
  return {
    layout = wibox.layout.align.horizontal,
    {
      layout = wibox.layout.fixed.horizontal,
      utils.icon("", c.cyan, 14),
      utils.spacer(6),
      s.mytaglist,
      utils.spacer(3),
      sep,
    },
    s.mytasklist,
    {
      layout = wibox.layout.fixed.horizontal,
      sep,
      wibox.widget.systray(),
      utils.spacer(3),
      utils.icon("", c.green),
      volume.widget,
      utils.spacer(4),
      utils.icon("", c.orange),
      temp.widget,
      utils.spacer(6),
      utils.icon("󰍛 ", c.red),
      cpu.widget,
      utils.spacer(6),
      utils.icon(" ", c.yellow),
      mem.widget,
      utils.spacer(5),
      utils.icon(" ", c.purple),
      updates.widget,
      utils.spacer(5),
      utils.icon("󰌽 ", c.green2),
      fs_root.widget,
      utils.spacer(6),
      utils.icon(" ", c.teal),
      fs_home.widget,
      utils.spacer(6),
      utils.icon("󰃭 ", c.blue),
      textdate,
      utils.spacer(6),
      utils.icon("󰥔 ", c.magenta),
      textclock,
      utils.spacer(5),
      s.mylayoutbox,
    },
  }
end

return M
