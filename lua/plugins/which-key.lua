local present, wk = pcall(require, "which-key")

if not present then
  return
end

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}


local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
  b = {
    name = "Buffer",
    a = { "<Cmd>BWipeout other<Cr>", "Delete all buffers" },
    d = { "<Cmd>bd<Cr>", "Delete current buffer" },
    l = { "<Cmd>ls<Cr>", "List buffers" },
    n = { "<Cmd>bn<Cr>", "Next buffer" },
    p = { "<Cmd>bp<Cr>", "Previous buffer" },
    f = { "<Cmd>bd!<Cr>", "Force delete current buffer" },
  },
  f = {
    name = "File",
    b = { "<Cmd>Telescope buffers<Cr>", "Search buffers" },
    c = { "<Cmd>Telescope current_buffer_fuzzy_find<Cr>", "Search current buffer" },
    f = { "<Cmd>Telescope git_files<Cr>", "Git files" },
    g = { "<Cmd>Telescope live_grep<Cr>", "Live grep" },
    h = { "<Cmd>Telescope help_tags<Cr>", "Help" },
    p = { "<Cmd>Telescope file_browser<Cr>", "Pop-up file browser" },
    o = { "<Cmd>Telescope oldfiles<Cr>", "Old files" },
    s = { "<Cmd>Telescope symbols<Cr>", "Symbols" },
    t = { "<Cmd>Telescope<CR>", "Telescope" },
    l = { "<Cmd>e!<CR>", "Reload file" },
  },
  g = { name = "Git" },
  l = {
    name = "LSP",
    a = { "code action" },
    d = { "<cmd>TroubleToggle<CR>", "local diagnostics" },
    D = { "<cmd>Telescope diagnostics wrap_results=true<CR>", "workspace diagnostics" },
    f = { "format" },
    l = { "line diagnostics" },
    r = { "rename" },
    t = { "<cmd>LspToggleAutoFormat<CR>", "toggle format on save" },
  },
  p = {
    name = "Project",
    p = {
      "<Cmd>lua require('telescope').extensions.project.project({})<Cr>",
      "List projects",
    },
    r = {
      "<Cmd>Telescope projects<Cr>",
      "Recent projects",
    },
  },
  s = {
    name = "Search",
    b = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find buffer" },
    c = { "q:", "Command history" },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', "dotfiles" },
    e = { "<cmd>Telescope emoji<CR>", "Emoji" },
    f = {
      "viw:lua require('spectre').open_file_search()<Cr>",
      "Open file search",
    },
    g = {
      "<Cmd>lua require('telescope').extensions.arecibo.websearch()<CR>",
      "Web search",
    },
    h = { "q/", "Grep history" },
    l = { "<Cmd>lua require('custom.utils.cheatsheet').cheatsheet()<CR>", "Search code" },
    o = { "<Cmd>SymbolsOutline<CR>", "Symbols Outline" },
    s = { "<Cmd>lua require('spectre').open()<CR>", "Search file" },
    t = { "<cmd>Telescope colorscheme<CR>", "color schemes" },
    u = { "<Cmd>Telescope ultisnips<CR>", "Search snippets" },
    v = {
      "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      "Visual search",
    },
    w = { "<cmd>Telescope grep_string theme=dropdown<CR>", "search word" },
    z = { "<Plug>SearchNormal", "Browser search" },
  },
  S = {
    name = "System",
    b = {
      "<Cmd>hi Normal ctermbg=none guibg=none<CR>",
      "Transparent background",
    },
    d = { "<cmd>Alpha<CR>", "open Dashboard" },
    i = { "<Cmd>PackerStatus<Cr>", "Packer status" },
    s = { "<Cmd>PackerSync<Cr>", "Packer sync" },

    S = { ":<C-u>SaveSession<Cr>", "Save session" },
    L = { ":<C-u>SearchSession<Cr>", "Load session" },
    -- h = { "<Cmd>15sp +term<CR>", "New horizontal terminal" },
    m = {
      function()
u = {
    name = '+ultest',
    a = {'<cmd>UltestAttach<cr>',                               'Attach (Debugging live)'},
    j = {'<cmd>UltestNearest<cr>',                              'Run nearest test current file'},
    r = {'<cmd>Ultest<cr>',                                     'Run all test current file'},
    s = {'<cmd>UltestSummary<cr>',                              'Toggle summary window'},
    x = {'<cmd>UltestStop<cr>',                                 'Stop running tests'}
  },
        require("telescope").extensions.notify.notify()
      end,
      "Messages",
    },
    t = { "<Cmd>Telescope colorscheme<Cr>", "Color scheme" },
    y = { "<Cmd>Telescope neoclip<Cr>", "Clipboard manager" },
    z = {
      ":e $MYVIMRC | :cd %:p:h <CR>",
      "Configuration",
    },
  },
  t = { name = "Terminal" },
  u = { name = "Update" },
  w = { name = "Workspace" },
  z = { name = "Fold" },
}

local visual_mode_mappings = {
  -- single
  ["s"] = { "<cmd>'<,'>sort<CR>", "sort" },

  a = {
    name = "Actions",
    c = { "comment box" },
  },

  c = {
    name = "LSP",
    a = { "range code action" },
    f = { "range format" },
  },

  g = {
    name = "Git",
    h = {
      name = "Hunk",
      r = "reset hunk",
      s = "stage hunk",
    },
  },

  p = {
    name = "Project",
    r = { "refactor" },
  },

  t = {
    name = "Table Mode",
    t = { "tableize" },
  },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Register                                                 │
-- ╰──────────────────────────────────────────────────────────╯

wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, visual_opts)

local function attach_typescript(bufnr)
  wk.register({
    c = {
      name = "LSP",
      F = { "<cmd>TypescriptFixAll<CR>", "fix all" },
      i = { "<cmd>TypescriptAddMissingImports<CR>", "import all" },
      o = { "<cmd>TypescriptOrganizeImports<CR>", "organize imports" },
      u = { "<cmd>TypescriptRemoveUnused<CR>", "remove unused" },
    },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_npm(bufnr)
  wk.register({
    n = {
      name = "NPM",
      c = { '<cmd>lua require("package-info").change_version()<CR>', "change version" },
      d = { '<cmd>lua require("package-info").delete()<CR>', "delete package" },
      h = { "<cmd>lua require('package-info').hide()<CR>", "hide" },
      i = { '<cmd>lua require("package-info").install()<CR>', "install new package" },
      r = { '<cmd>lua require("package-info").reinstall()<CR>', "reinstall dependencies" },
      s = { '<cmd>lua require("package-info").show()<CR>', "show" },
      u = { '<cmd>lua require("package-info").update()<CR>', "update package" },
    },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_jest(bufnr)
  wk.register({
    j = {
      name = "Jest",
      f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "run current file" },
      i = { '<cmd>lua require("neotest").summary.toggle()<CR>', "toggle info panel" },
      j = { '<cmd>lua require("neotest").run.run()<CR>', "run nearest test" },
      l = { '<cmd>lua require("neotest").run.run_last()<CR>', "run last test" },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', "open test output" },
      s = { '<cmd>lua require("neotest").run.stop()<CR>', "stop" },
    },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

return {
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_jest = attach_jest,
}
