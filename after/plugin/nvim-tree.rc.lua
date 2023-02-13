local present, nvim_tree = pcall(require, 'nvim-tree')

if not present then
  return
end

nvim_tree.setup {
  hijack_cursor = false,
  auto_reload_on_write = false,
  sync_root_with_cwd = false,
  view = {
    adaptive_size = false,
    width = 30,
    mappings = {
      list = {
        { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
        -- <C-e> keymapping cannot be set because it's used for toggling nvim-tree
        -- { key = "<C-e>",                        action = "edit_in_place" },
        { key = { 'O' }, action = 'edit_no_picker' },
        { key = { '<2-RightMouse>', '<C-]>' }, action = 'cd' },
        { key = '<C-v>', action = 'vsplit' },
        { key = '<C-x>', action = 'split' },
        { key = '<C-t>', action = 'tabnew' },
        { key = '<', action = 'prev_sibling' },
        { key = '>', action = 'next_sibling' },
        { key = 'P', action = 'parent_node' },
        { key = '<BS>', action = 'close_node' },
        { key = '<Tab>', action = 'preview' },
        { key = 'K', action = 'first_sibling' },
        { key = 'J', action = 'last_sibling' },
        { key = 'I', action = 'toggle_ignored' },
        { key = 'H', action = 'toggle_dotfiles' },
        { key = 'R', action = 'refresh' },
        { key = 'a', action = 'create' },
        { key = 'd', action = 'remove' },
        { key = 'D', action = 'trash' },
        { key = 'r', action = 'rename' },
        { key = '<C-r>', action = 'full_rename' },
        { key = 'x', action = 'cut' },
        { key = 'c', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'y', action = 'copy_name' },
        { key = 'Y', action = 'copy_path' },
        { key = 'gy', action = 'copy_absolute_path' },
        { key = '[c', action = 'prev_git_item' },
        { key = ']c', action = 'next_git_item' },
        { key = '-', action = 'dir_up' },
        { key = 's', action = 'system_open' },
        { key = 'q', action = 'close' },
        { key = '?', action = 'toggle_help' },
        { key = 'W', action = 'collapse_all' },
        { key = 'S', action = 'search_node' },
      },
    },
  },
  renderer = {
    full_name = true,
    group_empty = true,
    special_files = {},
    symlink_destination = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      modified_placement = 'after',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        bookmark = '',
        modified = '●',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '★',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '✗',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = { 'help' },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  filters = {
    custom = {
      '^.git$',
    },
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = 'abcdefghijklmnopqrstuvwxyz',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  live_filter = {
    prefix = '[FILTER]: ',
    always_show_folders = true,
  },
  log = {
    enable = true,
    truncate = true,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}
