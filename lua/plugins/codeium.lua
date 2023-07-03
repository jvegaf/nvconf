-- return {
--   {
--     "jcdickinson/codeium.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "hrsh7th/nvim-cmp",
--     },
--     -- event = "InsertEnter",
--     cmd = { "Codeium" },
--     config = function()
--       require("codeium").setup {}
--     end,
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "jcdickinson/codeium.nvim",
--     },
--     config = function(_, opts)
--       local cmp = require "cmp"
--       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
--     end,
--   },
-- }
return {
  'Exafunction/codeium.vim',
  lazy = false,
  config = function ()
    vim.g.codeium_disable_bindings = 1

    vim.keymap.set('i', '<A-l>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<A-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<A-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
}
