local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

return function(args)
  args = args or {}

  local self = {
    widget = args.widget or wibox.widget.textbox(),
    count = 0,
  }

  local command = args.custom_command or "checkupdates"
  local initial_text = args.initial_text or ""
  local timeout = args.timeout or 3600
  local settings = args.settings or function(self) end
  self.widget:set_text(initial_text)

  function self.update()
    awful.spawn.easy_async_with_shell(
      command,
      function(stdout, _, _, exit_code)
        if exit_code == 0 then
          local count = 0
          for _ in stdout:gmatch("[^\r\n]+") do
            count = count + 1
          end
          self.count = count
          settings(self)
        else
          self.count = 0
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

  self.update()
  return self
end
