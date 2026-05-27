-- lazy.nvim gestionado por Nix: el plugin ya está en el store,
-- solo necesitamos apuntar a él y desactivar la instalación automática.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Nix pone lazy.nvim en el runtimepath via extraPackages,
-- así que si no existe el path local, lo buscamos en rtp.
if not vim.loop.fs_stat(lazypath) then
  for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
    if rtp:match("lazy.nvim") then
      lazypath = rtp
      break
    end
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "config.plugins.theme" },
    { import = "config.plugins.lualine" },
    { import = "config.plugins.telescope" },
    { import = "config.plugins.treesitter" },
    { import = "config.plugins.neo-tree" },
    { import = "config.plugins.lsp" },
    { import = "config.plugins.cmp" },
    { import = "config.plugins.dotnet" },
  },
  -- Nix gestiona los plugins, lazy NO debe descargar nada
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
    },
  },
  install = {
    missing = false,
  },
  checker = {
    enabled = false,
  },
})