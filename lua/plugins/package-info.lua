return {
  "vuki656/package-info.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = "BufEnter package.json",
  config = function()
    require("package-info").setup {
      colors = {
        up_to_date = "#3C4048", -- Text color for up to date package virtual text
        outdated = "#fc514e", -- Text color for outdated package virtual text
      },
      hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = true, -- It hides unstable versions from version list e.g next-11.1.3-canary3

      package_manager = "npm",
    }
  end,
  keys = {
    { "nd", "<cmd>PackageInfoDelete<cr>", desc = "Delete Package" },
    { "np", "<cmd>PackageInfoChangeVersion<cr>", desc = "Change Package Version" },
    { "ni", "<cmPackageInfoInstall<cr>", desc = "Install Package" },
    { "nu", "<cmPackageInfoUpdate<cr>", desc = "Update Package" },
  },
}
