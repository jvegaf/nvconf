return {
  "junegunn/vim-easy-align",
  event = "User BufReadPre",
  keys = { { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" } },
}
