local nix = require("config.nix")

return {
  "nvim-telescope/telescope.nvim",
  dir = nix.pkg("telescope.nvim"),
  lazy = false,
  opts = {
    defaults = {
      prompt_prefix = "  ",
      selection_caret = "  ",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = { preview_width = 0.55 },
      },
      file_ignore_patterns = {
        "node_modules", ".git/", "bin/", "obj/",
      },
    },
  },
}