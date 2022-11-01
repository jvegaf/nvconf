local status_nvim_treesitter_ok, tsconfigs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then
  return
end

tsconfigs.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  sync_install = true,
  auto_install = true,
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "lua",
    "json",
    "yaml",
    "html",
    "scss",
    "cpp",
    "css",
    "vue",
    "vim"
  },
  disable = function(lang, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,

  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = false,
}
