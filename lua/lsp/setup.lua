local typescript_ok, typescript = pcall(require, "typescript")
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local ufo_config_handler = require("plugins.configs.nvim-ufo").handler

if not mason_ok or not mason_lsp_ok then
  return
end

mason.setup {
  ui = {
    border = "rounded",
  },
}

mason_lsp.setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "tailwindcss",
    "tsserver",
    "emmet_ls",
  },

  automatic_installation = true,
}

local lspconfig = require "lspconfig"

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded'}),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }),
}
local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Order matters

-- It enables tsserver automatically so no need to call lspconfig.tsserver.setup
if typescript_ok then
  typescript.setup {
    disable_commands = false, -- prevent the plugin from creating Vim commands debug = false, -- enable debug logging for commands
    -- LSP Config options
    server = {
      capabilities = require("lsp.servers.tsserver").capabilities,
      handlers = require("lsp.servers.tsserver").handlers,
      on_attach = require("lsp.servers.tsserver").on_attach,
      settings = require("lsp.servers.tsserver").settings,
    },
  }
end

lspconfig.tailwindcss.setup {
  capabilities = require("lsp.servers.tailwindcss").capabilities,
  filetypes = require("lsp.servers.tailwindcss").filetypes,
  handlers = handlers,
  init_options = require("lsp.servers.tailwindcss").init_options,
  on_attach = require("lsp.servers.tailwindcss").on_attach,
  settings = require("lsp.servers.tailwindcss").settings,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.servers.cssls").on_attach,
  settings = require("lsp.servers.cssls").settings,
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.servers.eslint").on_attach,
  settings = require("lsp.servers.eslint").settings,
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.servers.jsonls").settings,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.servers.lua_ls").settings,
}

for _, server in ipairs { "bashls", "emmet_ls", "graphql", "html", "volar", "prismals" } do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  }
end

require("ufo").setup {
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds = { "imports" },
}

