local NS = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

--Remap space as leader key
map("n", "<Space>", "", NS)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<C-i>", "<C-i>", NS)

map("n", "x", '"_x', NS)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", NS)
map("n", "<C-j>", "<C-w>j", NS)
map("n", "<C-k>", "<C-w>k", NS)
map("n", "<C-l>", "<C-w>l", NS)
-- map('n', '<m-tab>', '<c-6>', NS)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", NS)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", NS)
map("v", ">", ">gv", NS)

-- Select all
map("n", "<C-a>", "gg<S-v>G", NS)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", NS)
map("n", "<C-Down>", ":resize +2<CR>", NS)
map("n", "<C-Left>", ":vertical resize -2<CR>", NS)
map("n", "<C-Right>", ":vertical resize +2<CR>", NS)

-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==", NS)
map("n", "<A-k>", ":m .-2<CR>==", NS)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", NS)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", NS)
-- map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", NS)
-- map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", NS)

map("n", "zz", "<cmd>wq<cr>", NS)
map("n", "vv", "V", NS)

map("i", "jj", "<Esc>", NS)
map("i", "kk", "<Esc>", NS)
-- map("n", "<leader>p", "o<Esc>p", NS)
-- map("n", "<leader>p", "<cmd>pu<cr>", NS)
-- map("n", "<leader>P", "<cmd>pu!<cr>", NS)

-- dont yank on visual paste
map("v", "p", '"_dP', NS)

map("n", "<F1>", "<cmd>vertical help<cr>", NS)
map("n", "<F4>", "<cmd>Telescope resume<cr>", NS)
map("n", "<F5>", "<cmd>Telescope commands<CR>", NS)
map(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  NS
)
map("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", NS)
map("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", NS)
map("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", NS)
map("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", NS)
map("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], NS) -- search for visualy selected text
map("n", "<C-p>", "<cmd>Telescope command_center<cr>", NS)
map("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", NS)


-- Tabs
-- map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", NS)
-- map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", NS)
map("n", "<A-q>", "<cmd>Bdelete<CR>", NS)

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Write", noremap = true, silent = true })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Close Window", noremap = true, silent = true })
