return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
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