---@type LazySpec
return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    setupFoldKeymaps = false,
    autoFold = {
      enabled = true,
      kinds = { "comment" },
    },
  }, -- required even when using default config

  -- recommended: disable vim's auto-folding
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
}
