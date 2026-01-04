return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			vim.keymap.set("n", "<leader>ts", ":TSUpdate<CR>")
			require("nvim-treesitter").setup({
				ensure_installed = {
					"go",
					"vim",
					"lua",
					"rust",
					"bash",
					"markdown",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end,
	},
}
