local base16 = pcall(require, "base16-colorscheme")

if not base16 then
  return
end

vim.cmd.colorscheme "base16-tokyo-night-storm"
