local opt = vim.opt

-- Apariencia
opt.number = true          -- números de línea
opt.relativenumber = true  -- números relativos (muy útil para moverse con j/k)
opt.cursorline = true      -- resalta la línea actual
opt.signcolumn = "yes"     -- columna izquierda para LSP signs, siempre visible
opt.termguicolors = true   -- colores de 24 bits

-- Indentación
opt.tabstop = 4            -- un tab visual son 4 espacios
opt.shiftwidth = 4         -- indentación automática de 4 espacios
opt.expandtab = true       -- convierte tabs en espacios
opt.smartindent = true     -- indentación inteligente al escribir código

-- Búsqueda
opt.ignorecase = true      -- búsqueda sin distinguir mayúsculas
opt.smartcase = true       -- ...salvo que escribas mayúsculas
opt.hlsearch = false       -- no resaltar resultados al terminar de buscar

-- Comportamiento
opt.wrap = true           -- no partir líneas largas visualmente
opt.scrolloff = 8          -- margen de 8 líneas al hacer scroll
opt.sidescrolloff = 8      -- ídem horizontal
opt.mouse = "a"            -- ratón habilitado en todos los modos
opt.clipboard = "unnamedplus" -- clipboard compartido con el sistema
opt.undofile = true        -- historial de undo persistente entre sesiones
opt.swapfile = false       -- sin ficheros .swp
opt.backup = false         -- sin backups

-- Splits
opt.splitbelow = true      -- nuevo split horizontal va abajo
opt.splitright = true      -- nuevo split vertical va a la derecha

-- Rendimiento
opt.updatetime = 250       -- tiempo de refresco reducido (para LSP)
opt.timeoutlen = 300       -- tiempo para secuencias de teclas