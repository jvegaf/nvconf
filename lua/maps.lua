local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--[[ Normal/Origin ]]

keymap('n', '<S-C-p>', '"0p', opts)
-- Delete without yank
keymap('n', '<leader>d', '"_d', opts)
keymap('n', 'x', '"_x', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- remap macro record key
keymap("n", "Q", "q", opts)

-- e, but insert mode
keymap("i", "<C-e>", "<Esc>ea", opts)
-- b, but insert mode
keymap("i", "<C-b>", "<Esc>bi", opts)

-- :q
keymap("n", "<space>q", ":q<cr>", opts)
keymap("n", "<space>Q", ":q!<cr>", opts)

-- :w
keymap("n", "<space>w", ":w<cr>", opts)

-- :tabedit - new tab
keymap("n", "<C-n>", ":tabedit<cr>", opts)
keymap("n", "<Tab>", ":tabnext<cr>", opts)

-- :bdelete
keymap("n", "<space>bd", ":bdelete<cr>", opts)
keymap("n", "<space>bD", ":bdelete!<cr>", opts)

-- move cursor to start of line, better ^
keymap('n', '<C-h>', '<Home>^', opts)
keymap('i', '<C-h>', '<Home><Esc>^i', opts)
keymap('v', '<C-h>', '<Home>^', opts)
keymap('n', '<C-S-h>', '<Home>', opts)
keymap('i', '<C-S-h>', '<Home><Esc>i', opts)
keymap('v', '<C-S-h>', '<Home>', opts)

-- better $
keymap('n', '<C-l>', '<End>', opts)
keymap('i', '<C-l>', '<End>', opts)
keymap('v', '<C-l>', '<End>', opts)

--[[ Window ]]

-- Split window
keymap('n', 'ss', ':split<cr><C-w>w', opts)
keymap('n', 'sv', ':vsplit<cr><C-w>w', opts)

-- Move window
keymap('n', '<M-Left>', '<C-w>h', opts)
keymap('n', '<M-Up>', '<C-w>k', opts)
keymap('n', '<M-Down>', '<C-w>j', opts)
keymap('n', '<M-Right>', '<C-w>l', opts)

-- Resize window
keymap('n', '<C-left>', '<C-w><', opts)
keymap('n', '<C-right>', '<C-w>>', opts)
keymap('n', '<C-up>', '<C-w>-', opts)
keymap('n', '<C-down>', '<C-w>+', opts)

--keymap("v", "s", ":\'<,\'BrowserSearch<cr>" opts)
--[[ Plugin ]]


-- telescope
local status_telescope_ok, telescope = pcall(require, 'telescope')
if status_telescope_ok then
  keymap('n', 'ff', ':Telescope find_files<CR>', opts)
  keymap('n', 'fr', ':Telescope live_grep<CR>', opts)
  keymap('n', 'fb', ':Telescope buffers<CR>', opts)
  keymap('n', 'fo', ':Telescope oldfiles<CR>', opts)
  keymap('n', 'fh', ':Telescope help_tags<CR>', opts)

  -- todo-comments
  local status_todo_comments_ok = pcall(require, 'todo-comments')
  if status_todo_comments_ok then
    keymap('n', 'ft', ':TodoTelescope<CR>', opts)
  end

  if telescope.extensions.vim_bookmarks ~= nil then
    keymap('n', 'fm', ':Telescope vim_bookmarks current_file<CR>', opts)
    keymap('n', 'fM', ':Telescope vim_bookmarks all<CR>', opts)
  end
end

-- nvim-tree
local status_nvim_tree_ok = pcall(require, 'nvim-tree')
if (status_nvim_tree_ok) then
  keymap('n', 'fe', ':NvimTreeToggle<cr>', opts)
  keymap('n', 'fd', ':NvimTreeFindFile<cr>', opts)
end

-- bufferline.nvim
local status_bufferline_ok = pcall(require, "bufferline")
if status_bufferline_ok then
  keymap('n', '<s-tab>', ':BufferLineCyclePrev<CR>', opts)
  keymap('n', '<tab>', ':BufferLineCycleNext<CR>', opts)
  keymap('n', '<space>bp', ':BufferLinePick<CR>', opts)
  keymap('n', '<space>bc', ':BufferLinePickClose<CR>', opts)
end

-- nvim-spectre
local status_nvim_spectre_ok = pcall(require, 'spectre')
if (status_nvim_spectre_ok) then
  keymap('n', '<space>S', ':lua require("spectre").open()<cr>', opts)
  keymap('n', '<space>sw', ':lua require("spectre").open_visual({select_word=true})<cr>', opts)
  keymap('n', '<space>s', ':lua require("spectre").open_visual()<cr>', opts)
  keymap('n', '<space>sp', ':lua require("spectre").open_file_search()<cr>', opts)
end

-- diffview
-- see after/plugin/diffivew.lua key_bindinds

-- gitsigns
-- whichkey
-- see after/plugin/whichkey.lua mappings
local status_which_key_ok = pcall(require, "which-key")
if status_which_key_ok then
  keymap('n', '<space>k', ':WhichKey<CR><space>', opts)
end

-- hop
local status_hop_ok = pcall(require, "hop")
if status_hop_ok then
  -- word
  keymap('n', 'gw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", opts)
  keymap('v', 'gw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", opts)
  keymap('o', 'gw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", opts)
  -- line
  keymap('n', 'gl', ':HopLine<cr>', opts)
  keymap('v', 'gl', ':HopLine<cr>', opts)
  keymap('o', 'gl', ':HopLine<cr>', opts)
end

-- goto-preview
local status_goto_preview_ok = pcall(require, 'goto-preview')
if status_goto_preview_ok then
  keymap('n', 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", opts)
  keymap('n', 'gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", opts)
  keymap('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<cr>", opts)

  if status_telescope_ok then
    keymap('n', 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<cr>", opts)
  end
end

-- toggleterm
local status_toggleterm_ok = pcall(require, "toggleterm")
if status_toggleterm_ok then
  keymap('n', 'git', ':lua _LAZYGIT_TOGGLE()<cr>', opts)
end

local status_commentary_ok = pcall(require, "commentary")
if status_commentary_ok then
  keymap('n', '<leader-c>', ':Commentary<cr>', opts)
end

local status_trouble_ok = pcall(require, "trouble")
if status_trouble_ok then
  keymap('n', '<space>tt', '<cmd>TroubleToggle<cr>', opts)
  keymap('n', '<space>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
  keymap('n', '<space>td', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
  keymap('n', '<space>tl', '<cmd>TroubleToggle loclist<cr>', opts)
  keymap('n', '<space>tq', '<cmd>TroubleToggle quickfix<cr>', opts)
  keymap('n', '<space>tr', '<cmd>TroubleToggle lsp_references<cr>', opts)
end

