return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
  opts = function()
    local b = require("null-ls").builtins

    return {
      sources = {
        b.formatting.stylua,
        b.formatting.prettierd,
        b.formatting.jq,
      }
    }
  end,
}
