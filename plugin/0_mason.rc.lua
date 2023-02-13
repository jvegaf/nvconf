local status, mason = pcall(require, 'mason')
if not status then
  return
end
local status2, lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
  return
end

mason.setup {}

lspconfig.setup {
  ensure_installed = {
    'tsserver',
    'lua_ls',
    'eslint',
    'angularls',
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'emmet_ls',
    'sqlls',
    'taplo',
    'vimls',
    'jsonls',
    'arduino_language_server',
    'yamlls',
    'lemminx', -- xml
  },
  automatic_installation = true,
}
