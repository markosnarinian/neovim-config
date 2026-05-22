---@type LazySpec
return {
  "nvim-mini/mini.move",
  version = "*",
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = "<M-y>",
      right = "<M-o>",
      down = "<M-u>",
      up = "<M-i>",

      -- Move current line in Normal mode
      line_left = "<M-y>",
      line_right = "<M-o>",
      line_down = "<M-u>",
      line_up = "<M-i>",
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  },
}
