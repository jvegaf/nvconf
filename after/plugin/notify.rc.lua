local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local n_status_ok, _ = pcall(require, "notify")
if not n_status_ok then
  return
end

telescope.load_extension "notify"
