local keymap = vim.keymap


keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('n', '<Space>fb', ':Telescope file_browser<CR>')
keymap.set('n', '<Space>e', ':NeoTreeFocusToggle<CR>')

-- Move lines
keymap.set('n', '<A-j>', '<cmd> :m .+1<CR>==')
keymap.set('n', '<A-k>', '<cmd> :m .-2<CR>==')
keymap.set('v', '<A-j>', '<cmd> :m \'>+1<CR>gv=gv')
keymap.set('v', '<A-k>', '<cmd> :m \'<-2<CR>gv=gv')

-- Comments
keymap.set('n', '<Space>/', 'gcc')
keymap.set('v', '<Space>/', 'gc')
