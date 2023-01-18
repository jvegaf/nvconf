local present, telescope = pcall(require, 'telescope')

if not present then
  return
end

local status = pcall(require, "telescope-project")
if not status then
  return
end

-- Telescope projects extention

telescope.setup({
  extensions = {
    project = {
      base_dirs = { "~/Code", max_depth = 3 },
      hidden_files = true,
    },
  },
})

telescope.load_extension("project")

vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ":lua require'telescope'.extensions.project.project{}<CR>",
  { noremap = true, silent = true }
)
