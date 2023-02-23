local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-i>", "<C-i>", opts)

keymap("n", "x", '"_x', opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap('n', '<m-tab>', '<c-6>', opts)


-- Cancel search highlighting with ESC
keymap("n", "<ESC><ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move Lines
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)

-- dont yank on visual paste
keymap("v", "p", '"_dP', opts)

keymap("n", "<F1>", "<cmd>vertical  help<cr>", opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts) -- search for visualy selected text
keymap("n", "<C-p>", "<cmd>Telescope command_center<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)

keymap("n", "y", "<Plug>(YankyYank)", opts)
keymap("x", "y", "<Plug>(YankyYank)", opts)


-- Comment
keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Tabs
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-q>", "<cmd>Bdelete<CR>", opts)

keymap("n", "<leader>x", "<cmd>qall<CR>", {desc = "Exit" ,  noremap = true, silent = true })   
keymap("n", "<leader>w", "<cmd>w<CR>", {desc = "Write" ,  noremap = true, silent = true })
keymap("n", "<leader>q", "<cmd>q<CR>", {desc = "Close Window" ,  noremap = true, silent = true} )   
