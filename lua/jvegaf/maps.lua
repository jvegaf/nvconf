M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keymap('n', '<C-i>', '<C-i>', opts)

keymap('n', 'x', '"_x', opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap('n', '<m-h>', '<C-w>h', opts)
keymap('n', '<m-j>', '<C-w>j', opts)
keymap('n', '<m-k>', '<C-w>k', opts)
keymap('n', '<m-l>', '<C-w>l', opts)
keymap('n', '<m-tab>', '<c-6>', opts)

-- Cancel search highlighting with ESC
keymap('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- File Browser
keymap('n', '<m-1>', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>e', ':NvimTreeFocus<CR>', opts)

-- Move text up and down
keymap('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
keymap('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
keymap('n', '<A-Left>', ':MoveHChar(-1)<CR>', opts)
keymap('n', '<A-Right>', ':MoveHChar(1)<CR>', opts)

keymap('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
keymap('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)
keymap('v', '<A-Left>', ':MoveHBlock(-1)<CR>', opts)
keymap('v', '<A-Right>', ':MoveHBlock(1)<CR>', opts)

-- dont yank on visual paste
keymap('v', 'p', '"_dP', opts)

keymap('n', '<F4>', '<cmd>Telescope resume<cr>', opts)
keymap('n', '<F5>', '<cmd>Telescope commands<CR>', opts)
keymap(
  'n',
  '<F6>',
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap('n', '<F7>', '<cmd>TSHighlightCapturesUnderCursor<cr>', opts)
keymap('n', '<F8>', '<cmd>TSPlaygroundToggle<cr>', opts)
keymap('n', '<F11>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap('n', '<C-p>', '<cmd>Telescope projects<cr>', opts)
keymap('n', '<C-t>', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand '<cword>')
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand '<cword>')
  elseif vim.fn.expand '%:t' == 'Cargo.toml' then
    require('crates').show_popup()
  else
    vim.lsp.buf.hover()
  end
end
vim.api.nvim_set_keymap('n', 'K', ":lua require('user.keymaps').show_documentation()<CR>", opts)

-- Comment
keymap('n', '<m-/>', "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap('x', '<m-/>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- vim.api.nvim_set_keymap(
--   "n",
--   "<tab>",
--   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"
--   ,
--   opts
-- )

-- Tabs
keymap('n', '<Tab>', '<cmd>BufferNext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>BufferPrevious<CR>', opts)
keymap('n', '<S-q>', '<cmd>BufferClose<CR>', opts)

-- Easyalign
keymap('n', 'ga', '<Plug>(EasyAlign)', opts)
keymap('x', 'ga', '<Plug>(EasyAlign)', opts)
--
-- Browser Search
keymap('v', '<m-s>', ":'<,'>BrowserSearch<CR>", opts)

return M
