local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gfs = require("gears.filesystem")
local helper = require("helper")

local default = gfs.get_themes_dir() .. "default/"
local home = os.getenv("HOME")
local M = {}

local palette = {
  bg           = "#1a1b26",
  bg_dark      = "#16161e",
  bg_dark1     = "#0C0E14",
  bg_highlight = "#292e42",
  fg           = "#c0caf5",
  fg_dark      = "#a9b1d6",
  fg_gutter    = "#3b4261",
  blue         = "#7aa2f7",
  blue0        = "#3d59a1",
  blue1        = "#2ac3de",
  blue2        = "#0db9d7",
  blue5        = "#89ddff",
  blue6        = "#b4f9f8",
  blue7        = "#394b70",
  cyan         = "#7dcfff",
  green        = "#9ece6a",
  green1       = "#73daca",
  green2       = "#41a6b5",
  magenta      = "#bb9af7",
  magenta2     = "#ff007c",
  orange       = "#ff9e64",
  purple       = "#9d7cd8",
  red          = "#f7768e",
  red1         = "#db4b4b",
  teal         = "#1abc9c",
  yellow       = "#e0af68",
  gray         = "#565f89",
  black        = "#414868",
  dark3        = "#545c7e",
  dark5        = "#737aa2",
}

M.dpi = xresources.apply_dpi
M.palette = palette

M.bg_normal = palette.bg
M.bg_focus = palette.bg
M.bg_urgent = palette.bg_highlight
M.bg_minimize = palette.bg_highlight

M.fg_normal = palette.fg
M.fg_focus = palette.fg
M.fg_urgent = palette.red1
M.fg_minimize = palette.fg_dark

M.wibar_bg = M.bg_normal
M.wibar_fg = M.fg_normal
M.systray_icon_spacing = 2

M.fonts = {
  text = function(size) return string.format("%s %d", "Hasklug Nerd Font Mono", size) end,
  icon = function(size) return string.format("%s %d", "Symbols Nerd Font Mono", size) end,
}

M.font = M.fonts.text(9)
M.icon_font = M.fonts.icon(10)

-- clients
M.useless_gap = 5
M.border_width = 0

-- get a random wallpaper
local wallpapers_dir = home .. "/wallpapers/"
if gfs.is_dir(wallpapers_dir) then
  local wallpapers = helper.list_dir(wallpapers_dir)
  if #wallpapers > 0 then
    M.wallpaper = function()
      return wallpapers_dir .. wallpapers[math.random(#wallpapers)]
    end
  end
else
  M.wallpaper = default .. "background.png"
end

-- load all layout icons from the default theme directory
local layouts_dir = default .. "layouts/"
for _, name in ipairs(helper.list_dir(layouts_dir)) do
  local layout = name:match("^(.*)w%.png$")
  if layout then
    M["layout_" .. layout] = layouts_dir .. name
  end
end

return M
