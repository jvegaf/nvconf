return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "cljoly/telescope-repo.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "nvim-telescope/telescope-node-modules.nvim" },
    { "gbrlsnchs/telescope-lsp-handlers.nvim" },
    { "LinArcX/telescope-changes.nvim" },
    { "FeiyouG/command_center.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "danielvolchek/tailiscope.nvim" },
  },
  opts = function()
    local actions = require "telescope.actions"

    require("telescope").load_extension "repo"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "media_files"
    require("telescope").load_extension "node_modules"
    require("telescope").load_extension "lsp_handlers"
    require("telescope").load_extension "changes"
    require("telescope").load_extension "undo"
    require("telescope").load_extension "tailiscope"

    local git_icons = {
      added = "  ",
      changed = " 柳",
      copied = "  ",
      deleted = "  ",
      renamed = "  ",
      unmerged = "  ",
      untracked = " 練",
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

  end,
}
