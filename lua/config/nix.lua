local M = {}

function M.pkg(name)
  -- Escapar caracteres especiales de patrón Lua
  local escaped = name:gsub("([%.%-])", "%%%1")
  for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
    if rtp:match("/" .. escaped .. "$") then
      return rtp
    end
  end
  vim.notify("nixpkg no encontrado: " .. name, vim.log.levels.WARN)
end

return M