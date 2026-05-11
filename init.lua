require("config.lazy")

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.diagnostic.config({
    virtual_text = true, -- inline text
    signs = true,        -- gutter signs
    underline = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        source = true, -- show which LSP reported it
    },
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

vim.keymap.set('n', '<leader>w', "<cmd>:w<CR>")
vim.keymap.set('n', '<leader>W', "<cmd>:wa<CR>")

vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "load the session for the current directory" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "select a session to load" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "load the last session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "stop Persistence => session won't be saved on exit" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
