local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "eslint",
    "angularls",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "emmet_ls",
    "spectral", -- openapi
    "sqlls",
    "taplo",
    "vimls",
    "jsonls",
    "arduino_language_server",
    "yamlls"
  },
  automatic_installation = true
}
