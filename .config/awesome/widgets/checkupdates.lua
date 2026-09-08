local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local function factory(args)
  args = args or {}

  local updates = {
    widget = args.widget or wibox.widget.textbox(),
    count = 0,
  }

  local command = args.custom_command or "checkupdates"
  local timeout = args.timeout or 3600
  local initial_text = args.initial_text or ""
  local settings = args.settings or function() end

  updates.widget:set_text(initial_text)

  local function update()
    awful.spawn.easy_async_with_shell(
      command,
      function(stdout, stderr, reason, exit_code)
        if exit_code == 0 then
          local count = 0
          for _ in stdout:gmatch("[^\r\n]+") do
            count = count + 1
          end
          updates.count = count
          settings(updates)
        elseif exit_code == 2 then
          updates.count = 0
          settings(updates)
        end
      end
    )
  end

  function updates.update()
    update()
  end

  gears.timer({
    timeout = timeout,
    autostart = true,
    callback = update,
  })

  update()

  return updates
end

return factory
