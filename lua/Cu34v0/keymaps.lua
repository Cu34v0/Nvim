local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- -- Acortar el nombre de la función
local keymap = vim.api.nvim_set_keymap

-- Reasignar el espacio como tecla líder
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modos
-- modo_normal = "n",
-- modo_insertar = "i",
-- modo_visual = "v",
-- modo_bloque_visual = "x",
-- modo_terminal = "t",
-- modo_comando = "c",

-- Normal --
-- Mejor navegación por ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Abrir directorio de archivos nativo
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap('n', '<C-a>', '<cmd>NvimTreeToggle<cr>', opts)

-- Cambiar el tamaño con flechas
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navegar entre buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>x", ":bdelete<CR>", opts)

-- Insertar
-- Presiona "jk" para un ESC rápido
keymap("i", "jk", "<ESC>", opts)

-- Visual
-- Mantenerse en modo indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Mover el texto hacia arriba y hacia abajo
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Bloque visual
-- Mover el texto hacia arriba y hacia abajo
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Guardar
keymap("n", "<C-s>", ":w<CR>", opts)

-- Comentar
keymap("v", "<leader>t", ":CommentToggle<CR>", opts)

-- Terminal
-- Mejor terminal de navegación
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
