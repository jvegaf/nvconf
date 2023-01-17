require('jvegaf.base')
require('jvegaf.highlights')
require('jvegaf.maps')
require('jvegaf.plugins')
require('jvegaf.settings')


local host = vim.loop.os_uname().sysname

print(host)

if host == 'Linux' then
  require('jvegaf.linux')
  return
end

require('jvegaf.windows')
