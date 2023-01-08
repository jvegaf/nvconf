pcall(require, 'impatient')

require('user.core.packer_commands')
require('user.core.utils.globals')
require('user.plugins')
require('user.config')
require('user.keymappings')
require('user.autocmds')
require('user.functions')
require('user.colorscheme')

require('user.lsp.config')
require('user.lsp.setup')
require('user.lsp.functions')

require('user.snippets.react')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_lin = has "linux"

if is_win then
  require('user.windows')
end

if is_lin then
  require('user.linux')
end

