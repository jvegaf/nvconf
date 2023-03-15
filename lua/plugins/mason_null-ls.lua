local present, mason_nullls = pcall(require, 'mason-null-ls')
if not present then
  return
end

mason_nullls.setup {
  ensure_installed = { 'stylua', 'eslint_d', 'prettier' },
  automatic_installation = true,
  automatic_setup = true,
}
