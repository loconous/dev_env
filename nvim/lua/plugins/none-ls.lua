return {
	"nvimtools/none-ls.nvim",
  dependencies =
  {
    "nvim-lua/plenary.nvim"
  },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
        null_ls.builtins.formatting.stylua,
        -- Golang
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.diagnostics.golangci_lint,
        -- Markdown
        null_ls.builtins.diagnostics.markdownlint,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
