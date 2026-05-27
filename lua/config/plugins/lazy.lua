-- Encontrar lazy.nvim en el rtp de Nix
local lazypath
for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
  if rtp:match("lazy%.nvim$") then
    lazypath = rtp
    break
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
  performance = {
    reset_packpath = false,
    rtp = { reset = false },
  },
  install  = { missing = false },
  checker  = { enabled = false },
})