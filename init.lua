require("config.lazy")

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.diagnostic.config({
  virtual_text = true, -- inline text
  signs = true, -- gutter signs
  underline = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = true, -- show which LSP reported it
  },
})

vim.g.python_indent = {
  open_paren = "shiftwidth()",
  nested_paren = "shiftwidth()",
  continue = "shiftwidth() * 2",
  closed_paren_align_last_line = false,
  searchpair_timeout = 500,
}

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics (floating)" })

vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })

vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>", { desc = "Write [:w]" })
vim.keymap.set("n", "<leader>W", "<cmd>:wa<CR>", { desc = "Write all [:wa]" })

vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Load the session for the current directory" })
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select a session to load" })
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Load the last session" })
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Stop Persistence => session won't be saved on exit" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
--   callback = function()
--     vim.opt.relativenumber = false
--     vim.cmd("redraw")
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
--   callback = function()
--     vim.opt.relativenumber = true
--     vim.cmd("redraw")
--   end,
-- })

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
vim.keymap.set("n", "<leader>cf", "<cmd>Format<cr>", { desc = "Format" })

vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
