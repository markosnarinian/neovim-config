---@type LazySpec
return {
  dir = "/Users/markos/Projects/fold-logging",
  name = "fold-logging",
  ft = { "python", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  cmd = {
    "FoldLoggingFold",
    "FoldLoggingUnfold",
    "FoldLoggingToggle",
    "FoldLoggingList",
  },
  opts = {
    -- all optional; defaults shown
    enable = true,
    auto_fold = true,
    fold_single_line = false,
    min_lines = 1,
    -- base_foldexpr = vim.lsp.foldexpr,  -- only if you drive folds via LSP
  },
}
