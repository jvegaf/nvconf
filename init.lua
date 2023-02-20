require('config.base')
require('utils.globals')
require('config.highlights')
require('config.EcoVim')
require('config.maps')
require('config.lazy')
-- require('config.settings')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')

local host = vim.loop.os_uname().sysname

if host == 'Linux' then
  require('config.linux')
  return
end

require('config.windows')
