local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

return function(args)
  args = args or {}

  local self = {
    widget = args.widget or wibox.widget.textbox(),
    value = "",
  }

  local timeout = args.timeout or 1
  local settings = args.settings or function(self) end

  function self.update()
    awful.spawn.easy_async(
      "pamixer --get-volume-human",
      function(stdout, _, _, exit_code)
        if exit_code == 0 then
          self.value = stdout:gsub("%s+", "")
          settings(self)
        else
          self.value = ""
          settings(self)
        end
      end
    )
  end

  gears.timer({
    timeout = timeout,
    autostart = true,
    callback = self.update,
  })

  self.widget:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.spawn.easy_async("pamixer -t", self.update)
    end),

    awful.button({}, 4, function()
      awful.spawn.easy_async("pamixer -i 1", self.update)
    end),

    awful.button({}, 5, function()
      awful.spawn.easy_async("pamixer -d 1", self.update)
    end)
  ))

  self.update()
  return self
end
