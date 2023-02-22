return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_language_server",
        "vim_language_server",
        "stylua",
        "luacheck",
        "shellcheck",
        "shfmt",
        "xmlformatter",
        "stylelint",
        "yamllint",
        "prettier",
        "eslint_d",
      },
      run_on_start = false,
    },
  }
