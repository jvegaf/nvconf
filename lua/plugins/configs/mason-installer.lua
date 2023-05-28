local tools = require "mason-tool-installer"

tools.setup {
  ensure_installed = {
    "stylua",
    "shellcheck",
    "shfmt",
    "xmlformatter",
    "yamllint",
    "prettier",
    "eslint_d",
    "clangd",
    "clang-format",
  },
  auto_update = true,
  run_on_start = true,
}
