local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
-- highlight line yanked
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

local config_group = vim.api.nvim_create_augroup("ConfigGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup "checktime",
  command = "checktime",
})

-- makes sure that any opened buffer which is contained in a git repo will be tracked.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    require("lazygit.utils").project_root_dir()
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "<buffer>",
      once = true,
      callback = function()
        vim.cmd [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
      end,
    })
  end,
})

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "OverseerForm",
    "OverseerList",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "TelescopePrompt",
--     "code-action-menu-menu",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set({ "n", "i" }, "<Esc>", "<cmd>close<cr>", { buffer = event.buf, silesnt = true })
--   end,
-- })

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- Session loaded
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    -- require("nvim-tree").toggle(false, true)
    require "notify" ("Session loaded!", "info", { title = "Session Manager" })
  end,
})

-- Session Saved
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionSavePost",
  group = config_group,
  callback = function()
    require "notify" ("Session saved!", "info", { title = "Session Manager", bufid = 0 })
    -- require("nvim-tree").toggle(false, true)
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup "resize_splits",
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})


-- nvim-tree

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
