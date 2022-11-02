
pcall(require, 'impatient')

require('internal.packer_commands')
require('utils.globals')
require('config')
require('settings')
require('colorscheme')
require('keymappings')
require('autocmds')
require('functions')
require('internal.cursorword')

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
