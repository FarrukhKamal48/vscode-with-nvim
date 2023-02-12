local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml" }, --, "cs" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.google_java_format,
		--[[ diagnostics.flake8, ]]
	},
})

-- ale linter
-- vim.cmd("let g:ale_linters_explicit = 1") -- set to 1 to only enable on specified files
-- vim.cmd("let b:ale_linters = {'cs': ['OmniSharp']}")
-- vim.cmd("let g:ale_sign_error = ' '")
-- vim.cmd("let g:ale_sign_warning = ' '")
-- vim.cmd("let g:ale_sign_info = ' '")
