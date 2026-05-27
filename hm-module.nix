{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      git
      dotnet-sdk_9
      netcoredbg
      csharp-ls
      lua-language-server
      nixd
      stylua
      nixpkgs-fmt
    ];

    plugins = with pkgs.vimPlugins; [
      lazy-nvim

      # Tema
      rose-pine

      # UI
      lualine-nvim
      nvim-web-devicons

      # Navegación
      telescope-nvim
      plenary-nvim
      neo-tree-nvim
      nui-nvim

      # Treesitter
      nvim-treesitter.withAllGrammars

      # LSP
      nvim-lspconfig

      # Autocompletado
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
      friendly-snippets

      # DAP
      nvim-dap
      nvim-dap-ui
      nvim-nio

      # .NET
      easy-dotnet-nvim
    ];

    extraLuaConfig = ''
      require("config.init")
    '';
  };

  xdg.configFile = {
    "nvim/lua/config/init.lua".source                    = ./lua/config/init.lua;
    "nvim/lua/config/options.lua".source                 = ./lua/config/options.lua;
    "nvim/lua/config/keymaps.lua".source                 = ./lua/config/keymaps.lua;
    "nvim/lua/config/plugins/lazy.lua".source            = ./lua/config/plugins/lazy.lua;
    "nvim/lua/config/plugins/theme.lua".source           = ./lua/config/plugins/theme.lua;
    "nvim/lua/config/plugins/lualine.lua".source         = ./lua/config/plugins/lualine.lua;
    "nvim/lua/config/plugins/telescope.lua".source       = ./lua/config/plugins/telescope.lua;
    "nvim/lua/config/plugins/treesitter.lua".source      = ./lua/config/plugins/treesitter.lua;
    "nvim/lua/config/plugins/neo-tree.lua".source        = ./lua/config/plugins/neo-tree.lua;
    "nvim/lua/config/plugins/lsp.lua".source             = ./lua/config/plugins/lsp.lua;
    "nvim/lua/config/plugins/cmp.lua".source             = ./lua/config/plugins/cmp.lua;
    "nvim/lua/config/plugins/dotnet.lua".source          = ./lua/config/plugins/dotnet.lua;
  };
}