if vim.loop.os_uname().sysname == 'Linux' then
  return
end

vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
}

vim.g.shell = 'pwsh.exe -NoLogo'
