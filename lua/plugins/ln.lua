---@type LazySpec
return {
  dir = "/Users/markos/Projects/ln.nvim",
  name = "ln.nvim",
  opts = {
    absolute_events = { "WinLeave", "TermEnter", "CmdlineEnter" },
    relative_events = { "WinEnter", "TermLeave", "CmdlineLeave" },
    exclude = {
      "TelescopePrompt",
      "lazy",
      "mason",
      "checkhealth",
      "help",
      "Trouble",
      "fzf",
      "toggleterm",
      "startify",
      "undotree",
      "dashboard",
      "snacks_dashboard",
      "aerial",
    },
  },
}
