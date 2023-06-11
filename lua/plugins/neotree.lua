local status, neotree = pcall(require, "neo-tree")

if not status then
  return
end

neotree.setup({
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
        deleted = "✖",
        renamed = "",
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  }
})

vim.keymap.set('n', '<leader>e', '<cmd>NeoTree toggle<cr>', { noremap = true, silent = true, desc = 'NeoTree Toggle'})
