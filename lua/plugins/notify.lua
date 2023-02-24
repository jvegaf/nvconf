return {
  "rcarriga/nvim-notify",
  dependencies = {},
  config = function()
    require("notify").setup {
      background_colour = "#000000",
      timeout = 2000,
      stages = "slide",
    }
  end,
  init = function()
    local banned_messages =
      { "No information available", "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+." }
    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      require "notify"(msg, ...)
    end
  end,
}
