return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 700,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 700,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Keymappings                                              │
        -- ╰──────────────────────────────────────────────────────────╯

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map({ "n", "v" }, "<leader>ghs", gs.stage_hunk)
        map({ "n", "v" }, "<leader>ghr", gs.reset_hunk)
        map("n", "<leader>ghS", gs.stage_buffer)
        map("n", "<leader>ghu", gs.undo_stage_hunk)
        map("n", "<leader>ghR", gs.reset_buffer)
        map("n", "<leader>ghp", gs.preview_hunk)
        map("n", "<leader>gm", function()
          gs.blame_line { full = true }
        end)
        map("n", "<leader>ghd", gs.diffthis)
        map("n", "<leader>ght", gs.toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    opts = function()
      local lib = require "diffview.lib"
      local diffview = require "diffview"

      local M = {}

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Custom toggle file history function via <leader>gd       │
      -- ╰──────────────────────────────────────────────────────────╯
      M.toggle_file_history = function()
        local view = lib.get_current_view()
        if view == nil then
          diffview.file_history()
          return
        end

        if view then
          view:close()
          lib.dispose_view(view)
        end
      end

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Custom toggle status function via <leader>gs             │
      -- ╰──────────────────────────────────────────────────────────╯
      M.toggle_status = function()
        local view = lib.get_current_view()
        if view == nil then
          diffview.open()
          return
        end

        if view then
          view:close()
          lib.dispose_view(view)
        end
      end

      return M
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = true, -- disable buffer local mapping created by this plugin
      disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    },
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    opts = function()
      local worktree = require "git-worktree"

      local keymap = vim.keymap.set
      local silent = { silent = true }
      local utils = require "utils"

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Setup                                                    │
      -- ╰──────────────────────────────────────────────────────────╯
      worktree.setup {
        change_directory_command = "cd", -- default: "cd",
        update_on_change = true, -- default: true,
        update_on_change_command = "e .", -- default: "e .",
        clearjumps_on_change = true, -- default: true,
        autopush = false, -- default: false,
      }

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Keymappings                                              │
      -- ╰──────────────────────────────────────────────────────────╯
      -- <Enter> - switches to that worktree
      -- <c-d> - deletes that worktree
      -- <c-f> - toggles forcing of the next deletion
      keymap("n", "<Leader>gww", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)

      -- First a telescope git branch window will appear.
      -- Presing enter will choose the selected branch for the branch name.
      -- If no branch is selected, then the prompt will be used as the branch name.

      -- After the git branch window,
      -- a prompt will be presented to enter the path name to write the worktree to.

      -- As of now you can not specify the upstream in the telescope create workflow,
      -- however if it finds a branch of the same name in the origin it will use it
      keymap(
        "n",
        "<Leader>gwc",
        "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
        silent
      )

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Hooks                                                    │
      -- ╰──────────────────────────────────────────────────────────╯
      -- op = Operations.Switch, Operations.Create, Operations.Delete
      -- metadata = table of useful values (structure dependent on op)
      --      Switch
      --          path = path you switched to
      --          prev_path = previous worktree path
      --      Create
      --          path = path where worktree created
      --          branch = branch name
      --          upstream = upstream remote name
      --      Delete
      --          path = path where worktree deleted

      worktree.on_tree_change(function(op, metadata)
        if op == worktree.Operations.Switch then
          utils.log("Switched from " .. metadata.prev_path .. " to " .. metadata.path, "Git Worktree")
          vim.cmd "BufferCloseAllButCurrent"
          vim.cmd "e"
        end
      end)
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter" },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
}
