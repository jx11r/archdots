local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local function factory(args)
  args = args or {}

  local volume = {
    widget = args.widget or wibox.widget.textbox(),
    value = "",
  }

  local timeout = args.timeout or 1
  local settings = args.settings or function() end

  local function update()
    awful.spawn.easy_async(
      "pamixer --get-volume-human",
      function(stdout)
        volume.value = stdout:gsub("%s+", "")
        settings(volume)
      end
    )
  end

  function volume.update()
    update()
  end

  gears.timer({
    timeout = timeout,
    autostart = true,
    callback = update,
  })

  volume.widget:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.spawn.easy_async("pamixer -t", update)
    end),

    awful.button({}, 4, function()
      awful.spawn.easy_async("pamixer -i 1", update)
    end),

    awful.button({}, 5, function()
      awful.spawn.easy_async("pamixer -d 1", update)
    end)
  ))

  update()

  return volume
end

return factory
