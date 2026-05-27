local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Básicos
map("n", "<leader>w", "<cmd>w<cr>",  { desc = "Guardar" })
map("n", "<leader>q", "<cmd>q<cr>",  { desc = "Cerrar" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Cerrar todo" })

-- Navegación entre splits
map("n", "<C-h>", "<C-w>h", { desc = "Split izquierdo" })
map("n", "<C-j>", "<C-w>j", { desc = "Split abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Split arriba" })
map("n", "<C-l>", "<C-w>l", { desc = "Split derecho" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<cr>",     { desc = "Buffer siguiente" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Cerrar buffer" })

-- Mover líneas en visual
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Mover selección abajo" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Mover selección arriba" })

-- Neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorador" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Buscar ficheros" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Buscar texto" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "Buscar buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",   { desc = "Buscar ayuda" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>",    { desc = "Ficheros recientes" })

-- LSP (se sobreescriben al adjuntar el LSP, pero útil tenerlos aquí de referencia)
map("n", "<leader>ca", vim.lsp.buf.code_action,    { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename,         { desc = "Renombrar" })
map("n", "gd",         vim.lsp.buf.definition,     { desc = "Ir a definición" })
map("n", "gr",         vim.lsp.buf.references,     { desc = "Referencias" })
map("n", "K",          vim.lsp.buf.hover,          { desc = "Hover docs" })
map("n", "<leader>d",  vim.diagnostic.open_float,  { desc = "Diagnóstico" })

-- DAP (.NET debugging)
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>",          { desc = "DAP continuar" })
map("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>",         { desc = "DAP step into" })
map("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>",         { desc = "DAP step over" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>",          { desc = "DAP UI toggle" })

-- easy-dotnet
map("n", "<leader>dn", "<cmd>Dotnet new<cr>",     { desc = ".NET nuevo proyecto" })
map("n", "<leader>dr", "<cmd>Dotnet run<cr>",     { desc = ".NET run" })
map("n", "<leader>dt", "<cmd>Dotnet test<cr>",    { desc = ".NET test" })
map("n", "<leader>dp", "<cmd>Dotnet add package<cr>", { desc = ".NET add package" })