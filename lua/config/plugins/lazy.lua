-- Encontrar lazy.nvim en el rtp de Nix
local lazypath
for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
  if rtp:match("lazy%.nvim$") then
    lazypath = rtp
    break
  end
end
vim.opt.rtp:prepend(lazypath)

-- Helper: encuentra el path del store dado el nombre exacto del directorio
local function pkg(name)
  for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
    if rtp:match("/" .. name .. "$") then
      return rtp
    end
  end
end

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

-- Exponer pkg globalmente para que los specs lo usen
nix.pkg = pkg