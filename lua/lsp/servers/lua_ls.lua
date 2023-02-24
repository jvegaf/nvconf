local M = {}

M.settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      checkThirdParty = false,
    },
    completion = {
      callSnippet = "Replace",
    },
  }
}

return M
