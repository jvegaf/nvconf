local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

vim.g.vim_php_refactoring_use_default_mapping = 0

local opts = {
  mode = 'n', -- NORMAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  C = {
    name = 'PHP',
    a = { '<cmd>PhpAlignAssigns<Cr>', 'Align Assignments' },
    c = { '<cmd>PhpExtractConst<Cr>', 'Extract Const' },
    d = { '<cmd>PhpDocAll<Cr>', 'PHPDocAll' },
    e = { '<cmd>PhpExtractClassProperty<cr>', 'Extract class property' },
    g = { '<cmd>PhpCreateGetters<Cr>', 'create getters' },
    G = { '<cmd>PhpCreateSettersAndGetters<Cr>', 'create setters & getters' },
    m = { '<cmd>PhpExtractMethod<Cr>', 'Extract Method' },
    p = { '<cmd>PhpCreateProperty<Cr>', 'create Property' },
    r = { '<cmd>PhpRenameMethod<Cr>', 'Rename method' },
    R = { '<cmd>PhpRenameClassVariable<Cr>', 'Rename Class Variable' },
    u = { '<cmd>PhpDetectUnusedUseStatements<Cr>', 'Detect Unused Use statements' },
    U = { '<cmd>PhpExtractUse<Cr>', 'Extract Use' },
    v = { '<cmd>PhpRenameLocalVariable<Cr>', 'Rename Local Variable' },
  },
}

which_key.register(mappings, opts)
