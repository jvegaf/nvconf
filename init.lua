require('jvegaf.base')
require('jvegaf.highlights')
require('jvegaf.maps')
require('jvegaf.plugins')
require('jvegaf.settings')

-- vim.cmd [[colorscheme onedark]]

local host = vim.loop.os_uname().sysname

if host == 'Linux' then
  require('jvegaf.linux')
  return
end

require('jvegaf.windows')
