local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

local b = null_ls.builtins

null_ls.setup {
  sources = {
    b.formatting.stylua,
    b.formatting.xmlformat,
    b.formatting.prettier,
    b.formatting.black,

    b.diagnostics.eslint_d.with {
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    },
    -- b.diagnostics.php,
    b.diagnostics.shellcheck,
    b.diagnostics.stylelint,
    b.diagnostics.yamllint,
    b.diagnostics.djlint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
}

vim.api.nvim_create_user_command("DisableLspFormatting", function()
  vim.api.nvim_clear_autocmds { group = augroup, buffer = 0 }
end, { nargs = 0 })
