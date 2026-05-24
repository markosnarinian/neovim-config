---@type LazySpec
return {
  "oskarnurm/koda.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("koda").setup({
      theme = { dark = "dark", light = "glade" },
    })
    vim.cmd("colorscheme koda")
  end,
}
