local M = {}

function M.pkg(name)
  for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
    if rtp:match("/" .. name .. "$") then
      return rtp
    end
  end
  vim.notify("nixpkg no encontrado: " .. name, vim.log.levels.WARN)
end

return M