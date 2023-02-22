local actions = require "telescope.actions"
local previewers = require "telescope.previewers"
local builtin = require "telescope.builtin"
local icons = EcoVim.icons

require("telescope").load_extension "fzf"
require("telescope").load_extension "repo"
-- require("telescope").load_extension "git_worktree"
require("telescope").load_extension "aerial"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "media_files"
require("telescope").load_extension "node_modules"
require("telescope").load_extension "lsp_handlers"
require("telescope").load_extension "emoji"
require("telescope").load_extension "changes"
require("telescope").load_extension "undo"
require("telescope").load_extension "tailiscope"
require("telescope").load_extension "yank_history"

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = icons.fileCopy,
  deleted = icons.gitRemove,
  renamed = icons.circle,
  unmerged = icons.questionCircle,
  untracked = icons.rectangleIntersect,
}

require("telescope").setup {
  defults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    layout_config = {
      horizontal = {
        preview_cutoff = 120,
      },
      prompt_position = "top",
    },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = "  ",
    color_devicons = true,

    dynamic_preview_title = true,

    git_icons = git_icons,

    sorting_strategy = "ascending",

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<ESC>"] = actions.close,
      },
      n = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },
    },
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ["_"] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
    },
    file_browser = {
      hijack_netrw = true,
    },
    lsp_handlers = {
      code_action = {
        telescope = require("telescope.themes").get_dropdown {},
      },
    },
  },
}

-- Implement delta as previewer for diffs

local M = {}

local delta_bcommits = previewers.new_termopen_previewer {
  get_command = function(entry)
    return {
      "git",
      "-c",
      "core.pager=delta",
      "-c",
      "delta.side-by-side=false",
      "diff",
      entry.value .. "^!",
      "--",
      entry.current_file,
    }
  end,
}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
  end,
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta_bcommits,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

-- Custom pickers

M.edit_neovim = function()
  builtin.git_files(require("telescope.themes").get_dropdown {
    color_devicons = true,
    cwd = "~/.config/nvim",
    previewer = false,
    prompt_title = "Ecovim Dotfiles",
    sorting_strategy = "ascending",
    winblend = 4,
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
      prompt_position = "top",
    },
  })
end

M.project_files = function(opts)
  opts = opts or {} -- define here if you want to define something
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files(opts)
  end
end

M.command_history = function()
  builtin.command_history(require("telescope.themes").get_dropdown {
    color_devicons = true,
    winblend = 4,
    layout_config = {
      width = function(_, max_columns, _)
        return math.min(max_columns, 150)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 15)
      end,
    },
  })
end

return M
