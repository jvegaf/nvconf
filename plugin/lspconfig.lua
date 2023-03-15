--vim.lsp.set_log_level("debug")
local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then
  return
end

local ufo_config_handler = require('plugins.nvim-ufo').handler

local typescript_ok, typescript = pcall(require, 'typescript')

local protocol = require 'vim.lsp.protocol'

local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds { group = augroup_format, buffer = bufnr }
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format { bufnr = bufnr }
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
  },
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
}

local status_notify, notify = pcall(require, 'notify')

if status_notify then
  vim.notify = notify
end

-- table from lsp severity to vim severity.
local severity = {
  'error',
  'warn',
  'info',
  'info', -- map both hint and info to info?
}

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = '●' },
    severity_sort = true,
  }),
  ['window/showMessage'] = function(err, method, params, client_id)
    vim.notify(method.message, severity[params.type])
  end,
}
-- Utility functions shared between progress reports for LSP and DAP

local client_notifs = {}

local function get_notif_data(client_id, token)
  if not client_notifs[client_id] then
    client_notifs[client_id] = {}
  end

  if not client_notifs[client_id][token] then
    client_notifs[client_id][token] = {}
  end

  return client_notifs[client_id][token]
end

local spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' }

local function update_spinner(client_id, token)
  local notif_data = get_notif_data(client_id, token)

  if notif_data.spinner then
    local new_spinner = (notif_data.spinner + 1) % #spinner_frames
    notif_data.spinner = new_spinner

    notif_data.notification = vim.notify(nil, nil, {
      hide_from_history = true,
      icon = spinner_frames[new_spinner],
      replace = notif_data.notification,
    })

    vim.defer_fn(function()
      update_spinner(client_id, token)
    end, 100)
  end
end

local function format_title(title, client_name)
  return client_name .. (#title > 0 and ': ' .. title or '')
end

local function format_message(message, percentage)
  return (percentage and percentage .. '%\t' or '') .. (message or '')
end

if typescript_ok then
  typescript.setup {
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    -- LSP Config options
    server = {
      capabilities = require('lsp.servers.tsserver').capabilities,
      handlers = require('lsp.servers.tsserver').handlers,
      on_attach = require('lsp.servers.tsserver').on_attach,
      settings = require('lsp.servers.tsserver').settings,
    },
  }
end

nvim_lsp.tailwindcss.setup {
  capabilities = require('lsp.servers.tailwindcss').capabilities,
  filetypes = require('lsp.servers.tailwindcss').filetypes,
  handlers = handlers,
  init_options = require('lsp.servers.tailwindcss').init_options,
  on_attach = require('lsp.servers.tailwindcss').on_attach,
  settings = require('lsp.servers.tailwindcss').settings,
}

nvim_lsp.cssls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require('lsp.servers.cssls').on_attach,
  settings = require('lsp.servers.cssls').settings,
}

nvim_lsp.eslint.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require('lsp.servers.eslint').on_attach,
  settings = require('lsp.servers.eslint').settings,
}

nvim_lsp.jsonls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.jsonls').settings,
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.lua_ls').settings,
}

nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.intelephense.setup {
  settings = {
    intelephense = {
      stubs = {
        'bcmath',
        'bz2',
        'calendar',
        'Core',
        'curl',
        'zip',
        'zlib',
        'wordpress',
        'woocommerce',
        'acf-pro',
        'wordpress-globals',
        'wp-cli',
        'genesis',
        'polylang',
      },
      environment = {
        includePaths = '$HOME/.composer/vendor/php-stubs/',
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
}

local status_ufo, ufo = pcall(require, 'ufo')

if not status_ufo then
  return
end

ufo.setup {
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds = { 'imports' },
}
