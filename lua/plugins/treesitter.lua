---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ':TSUpdate',
  ensure_installed = { "python" },
  highlight = { enable = true },
  indent = { enable = true },
}
