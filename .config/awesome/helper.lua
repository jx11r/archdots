local gio = require("lgi").Gio

local M = {}

function M.list_dir(path)
  local dir = gio.File.new_for_path(path)
  local enum = dir:enumerate_children(
    "standard::name",
    gio.FileQueryInfoFlags.NONE
  )

  if not enum then return {} end
  local files = {}

  for info in function() return enum:next_file() end do
    table.insert(files, info:get_name())
  end

  return files
end

return M
