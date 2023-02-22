return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  lazy = true,
  config = function()
    require("nvim-autopairs").setup {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    }
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    ---@diagnostic disable-next-line: different-requires
    local cmp = require "cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  end,
}
