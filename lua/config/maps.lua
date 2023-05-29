local NS = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", NS)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-i>", "<C-i>", NS)

keymap("n", "x", '"_x', NS)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", NS)
keymap("n", "<C-j>", "<C-w>j", NS)
keymap("n", "<C-k>", "<C-w>k", NS)
keymap("n", "<C-l>", "<C-w>l", NS)
-- keymap('n', '<m-tab>', '<c-6>', NS)

-- Cancel search highlighting with ESC
keymap("n", "<ESC><ESC>", ":nohlsearch<Bar>:echo<CR>", NS)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", NS)
keymap("v", ">", ">gv", NS)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", NS)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", NS)
keymap("n", "<C-Down>", ":resize +2<CR>", NS)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", NS)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", NS)

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==", NS)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", NS)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", NS)
keymap("n", "<A-k>", ":m .-2<CR>==", NS)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", NS)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", NS)

keymap("n", "vv", "V", NS)
keymap("n", "<leader>o", "o<Esc>", NS)
keymap("n", "<leader>O", "O<Esc>", NS)
-- keymap("n", "<leader>p", "o<Esc>p", NS)
keymap("n", "<leader>p", "<cmd>pu<cr>", NS)
keymap("n", "<leader>P", "<cmd>pu!<cr>", NS)

-- dont yank on visual paste
keymap("v", "p", '"_dP', NS)

keymap("n", "<F1>", "<cmd>vertical help<cr>", NS)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", NS)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", NS)
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  NS
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", NS)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", NS)
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", NS)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", NS)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], NS) -- search for visualy selected text
keymap("n", "<C-p>", "<cmd>Telescope command_center<cr>", NS)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", NS)

-- Comment
keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", NS)
keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', NS)

-- Tabs
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", NS)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", NS)
keymap("n", "<A-q>", "<cmd>Bdelete<CR>", NS)

keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Write", noremap = true, silent = true })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Close Window", noremap = true, silent = true })
