local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local dashboard = require "alpha.themes.dashboard"
local icons = require "config.icons"
local if_nil = vim.F.if_nil
local fn = vim.fn

-- ╭──────────────────────────────────────────────────────────╮
-- │ Header                                                   │
-- ╰──────────────────────────────────────────────────────────╯

local header = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.header.type = "text"
dashboard.section.header.val = header
dashboard.section.header.opts = {
  position = "center",
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Heading Info                                             │
-- ╰──────────────────────────────────────────────────────────╯

local thingy = io.popen 'echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"'
if thingy == nil then
  return
end
local date = thingy:read "*a"
thingy:close()

local datetime = os.date " %H:%M"

-- ╭──────────────────────────────────────────────────────────╮
-- │ Buttons                                                  │
-- ╰──────────────────────────────────────────────────────────╯
-- Copied from Alpha.nvim source code

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = "right",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
    local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

dashboard.section.buttons.val = {
  button("r", " 🕒  " .. "Recents", "<cmd>Telescope oldfiles hidden=true<CR>", {}),
  button("f", " 🔎  " .. "Find File", "<cmd>Telescope find_files<CR>", {}),
  button(
    "b",
    " 🌍  " .. "Browse Files",
    "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>",
    {}
  ),
  button("d", " 📁  " .. "Load Current Dir Session", "<cmd>SessionManager load_current_dir_session<CR>", {}),
  button("u", " 🔄  " .. "Sync Plugins", "<cmd>Lazy sync<CR>", {}),
  button(
    "c",
    " 🎨  " .. "Select Theme",
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    {}
  ),
  button("s", " 🖥️  " .. "Settings", "<cmd>e $MYVIMRC<CR>", {}),
  button("q", " 👋  " .. "Exit", "<cmd>exit<CR>", {}),
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Footer                                                   │
-- ╰──────────────────────────────────────────────────────────╯

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then
    f:close()
  end
  return f ~= nil
end

local function line_from(file)
  if not file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

dashboard.section.footer.val = {
  "olaKeAse",
}
dashboard.section.footer.opts = {
  position = "center",
}

local section = {
  header = dashboard.section.header,
  buttons = dashboard.section.buttons,
  footer = dashboard.section.footer,
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯

local opts = {
  layout = {
    { type = "padding", val = 5 },
    section.header,
    { type = "padding", val = 5 },
    section.buttons,
    { type = "padding", val = 2 },
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(opts)

-- ╭──────────────────────────────────────────────────────────╮
-- │ Hide tabline and statusline on startup screen            │
-- ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  callback = function()
    vim.api.nvim_create_autocmd("BufUnload", {
      group = "alpha_tabline",
      buffer = 0,
      command = "set showtabline=2 ruler laststatus=3",
    })
  end,
})
