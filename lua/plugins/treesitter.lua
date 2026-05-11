---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "python" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
