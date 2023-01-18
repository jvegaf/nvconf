local present, installer = pcall(require, 'mason-tool-installer')

if not present then
  return
end

installer.setup {
  ensure_installed = {
    "eslint_d",
    "prettierd",
    "luacheck",
    "stylua",
    "shfmt",
    "shellcheck",
  }
}
