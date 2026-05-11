return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- vsnip instead of LuaSnip
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",

		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				--autocomplete = false,
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"]     = cmp.mapping.scroll_docs(-4),
				["<C-f>"]     = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"]     = cmp.mapping.abort(),
				["<CR>"]      = cmp.mapping.confirm({ select = true }),
				["<Tab>"]     = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)",
								true, true, true), ""
						)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"]   = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true,
								true, true), ""
						)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
