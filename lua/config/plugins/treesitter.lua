return {
  "nvim-treesitter/nvim-treesitter",
  dir = _G.nixpkg("nvim-treesitter"),
  lazy = false,
  -- En NixOS los parsers vienen vía Nix, NO se compilan en runtime
  opts = {
    highlight = { enable = true },
    indent    = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}