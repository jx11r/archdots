local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local tags = require("tags")

local mod = os.getenv("XEPHYR") and "Mod1" or "Mod4"
local terminal = "wezterm start"
local M = {}

-- mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

M.client_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ mod }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ mod }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

M.taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

M.tasklist_buttons = gears.table.join(
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
  end)
)

-- key bindings
local keys = gears.table.join(
  awful.key({ mod, }, "z", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
  awful.key({ mod, }, "Escape", awful.tag.history.restore,
    { description = "go back", group = "tag" }),
  awful.key({ mod, }, "j",
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next by index", group = "client" }
  ),
  awful.key({ mod, }, "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by index", group = "client" }
  ),

  -- layout manipulation
  awful.key({ mod, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }),
  awful.key({ mod, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }),
  awful.key({ mod, "Control" }, "j", function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "screen" }),
  awful.key({ mod, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }),
  awful.key({ mod, }, "u", awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }),

  -- standard program
  awful.key({ mod, }, "Return", function() awful.spawn(terminal .. " --always-new-process") end,
    { description = "open terminal", group = "launcher" }),
  awful.key({ mod, "Shift" }, "Return", function() awful.spawn(terminal .. " --class wt-floating") end,
    { description = "open terminal (floating)", group = "launcher" }),
  awful.key({ mod, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ mod, "Control" }, "s", awesome.quit,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ mod, }, "l", function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }),
  awful.key({ mod, }, "h", function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }),
  awful.key({ mod, }, "Tab", function() awful.layout.inc(1) end,
    { description = "select next", group = "layout" }),
  awful.key({ mod, "Shift" }, "Tab", function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }),
  awful.key({ mod, "Control" }, "n",
    function()
      local c = awful.client.restore()
      -- focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", { raise = true }
        )
      end
    end,
    { description = "restore minimized", group = "client" }),

  -- prompt
  awful.key({ mod }, "s", function() awful.spawn("rofi -show drun") end,
    { description = "spawn rofi", group = "launcher" }),

  -- apps
  awful.key({ mod }, "b", function() awful.spawn("brave") end,
    { description = "open browser", group = "apps" }),
  awful.key({ mod }, "f", function() awful.spawn("thunar") end,
    { description = "open file explorer", group = "apps" }),
  awful.key({}, "Print", function() awful.spawn("flameshot gui") end,
    { description = "take a screenshot", group = "apps" }),

  -- system
  awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("brightnessctl set 5%-") end),
  awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("brightnessctl set +5%") end),
  awful.key({}, "XF86AudioMute", function() awful.spawn("pamixer --toggle-mute") end),
  awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pamixer --decrease 3") end),
  awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pamixer --increase 3") end),
  awful.key({}, "XF86AudioPlay", function() awful.spawn("playerctl play-pause") end),
  awful.key({}, "XF86AudioPrev", function() awful.spawn("playerctl previous") end),
  awful.key({}, "XF86AudioNext", function() awful.spawn("playerctl next") end)
)

M.client_keys = gears.table.join(
  awful.key({}, "F11",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),
  awful.key({ mod, }, "a", function(c) c:kill() end,
    { description = "close", group = "client" }),
  awful.key({ mod, }, "space", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }),
  awful.key({ mod, }, "t", function(c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" }),
  awful.key({ mod, }, "n",
    function(c)
      -- the client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus
      c.minimized = true
    end,
    { description = "minimize", group = "client" }),
  awful.key({ mod, }, "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" }),
  awful.key({ mod, "Control" }, "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    { description = "(un)maximize vertically", group = "client" }),
  awful.key({ mod, "Shift" }, "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = "(un)maximize horizontally", group = "client" })
)

-- bind all key numbers to tags
for i, key in ipairs(tags.keys) do
  keys = gears.table.join(keys,
    awful.key({ mod }, key,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          -- back to previous tag if already active
          if tag == screen.selected_tag then
            awful.tag.history.restore()
          else
            tag:view_only()
          end
        end
      end,
      { description = "view tag #" .. i, group = "tag" }),

    -- move client to tag
    awful.key({ mod, "Shift" }, key,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "tag" })
  )
end

root.keys(keys)
return M
