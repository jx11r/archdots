local gio = require("lgi").Gio

local M = {}

function M.extract_property(object, key)
  local list = {}
  for _, v in ipairs(object) do
    table.insert(list, v[key])
  end
  return list
end

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
