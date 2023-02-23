return {

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- lazy = false,
    dependencies = {
      "mason.nvim",
    },
    -- opts = {
    --   ensure_installed = {
    --     "lua-language-server",
    --     "vim-language-server",
    --     "stylua",
    --     "luacheck",
    --     "shellcheck",
    --     "shfmt",
    --     "xmlformatter",
    --     "stylelint",
    --     "yamllint",
    --     "prettier",
    --     "eslint_d",
    --   },
    --   run_on_start = false,
    -- },
  },
  {
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
  },
  {
    "kosayoda/nvim-lightbulb",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
    opts = {
      autocmd = {
        enabled = true,
      },
    },
    config = function()
      vim.api.nvim_command "highlight LightBulbFloatWin ctermfg= ctermbg= guifg= guibg="
      vim.api.nvim_command "highlight LightBulbVirtualText ctermfg= ctermbg= guifg= guibg="
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
}
