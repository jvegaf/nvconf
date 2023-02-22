return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.xmlformat,
        null_ls.builtins.formatting.prettier,

        null_ls.builtins.diagnostics.eslint_d.with {
          diagnostics_format = "[eslint] #{m}\n(#{c})",
        },
        -- b.diagnostics.php,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.luacheck,
      },
    }
  end,
}
