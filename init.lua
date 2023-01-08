pcall(require, 'impatient')

require('core.packer_commands')
require('core.utils.globals')
require('plugins')
require('config')
require('keymappings')
require('autocmds')
require('functions')
require('colorscheme')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')

require('snippets.react')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_lin = has "linux"

if is_win then
  require('windows')
end

if is_lin then
  require('linux')
end

