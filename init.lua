require('jvegaf.base')
require('jvegaf.highlights')
require('jvegaf.maps')
require('jvegaf.plugins')
require('jvegaf.settings')

local has = vim.fn.has
local is_lin = has "linux"
local is_win = has "win32"

if is_lin then
  require('jvegaf.linux')
end
if is_win then
  require('jvegaf.windows')
end
