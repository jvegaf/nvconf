require 'config.base'
require 'config.highlights'
require 'config.maps'
require 'config.plugins'
require 'config.settings'
require 'config.autocmds'

local host = vim.loop.os_uname().sysname

if host == 'Linux' then
  require 'config.linux'
  return
end

require 'config.windows'
