local present, onedark = pcall(require, 'onedark')

if not present then
  return
end

onedark.setup {
  style = 'deep'
}

onedark.load()

-- vim.cmd.colorscheme "onedark"
