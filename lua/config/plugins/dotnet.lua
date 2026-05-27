return {
  -- Scaffolding, run, test, packages
  {
    "GustavEikaas/easy-dotnet.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("easy-dotnet").setup({
        terminal = function(path, action)
          local cmd = string.format("dotnet %s", action)
          vim.cmd(string.format("split | term %s", cmd))
        end,
      })
    end,
  },

  -- DAP core
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")

      dap.adapters.coreclr = {
        type    = "executable",
        command = "netcoredbg",
        args    = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type    = "coreclr",
          name    = "Launch",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to dll: ",
              vim.fn.getcwd() .. "/bin/Debug/",
              "file"
            )
          end,
        },
      }
    end,
  },

  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- Abre/cierra la UI automáticamente al iniciar/terminar debug
      dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end
    end,
  },
}