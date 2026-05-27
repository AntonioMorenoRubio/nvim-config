local nix = require("config.nix")

return {
  "neovim/nvim-lspconfig",
  dir = nix.pkg("nvim-lspconfig"),
  lazy = false,
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace   = { checkThirdParty = false },
          telemetry   = { enable = false },
        },
      },
    })

    vim.lsp.config("nixd", { capabilities = capabilities })

    vim.lsp.config("csharp_ls", {
      capabilities = capabilities,
      -- Solo arranca con ficheros C# o en directorios con proyecto .NET
      root_dir = function(fname)
        local util = require("lspconfig.util")
        return util.root_pattern("*.sln", "*.csproj", "*.cs")(fname)
      end,
    })

    vim.lsp.enable({ "lua_ls", "nixd", "csharp_ls" })

    vim.diagnostic.config({
      virtual_text     = true,
      signs            = true,
      underline        = true,
      update_in_insert = false,
      severity_sort    = true,
    })
  end,
}