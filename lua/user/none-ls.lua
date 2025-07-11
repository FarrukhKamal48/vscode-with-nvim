local M = {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    commit = "db2a48b79cfcdab8baa5d3f37f21c78b6705c62e",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            commit = "857c5ac632080dba10aae49dba902ce3abf91b35",
        },
    },
}

function M.config()
    local null_ls = require "null-ls"
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    -- https://github.com/prettier-solidity/prettier-plugin-solidity
    null_ls.setup {
        debug = false,
        sources = {
            formatting.prettier.with {
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
        -- formatting.black.with { extra_args = { "--fast" } },
        formatting.stylua,
        formatting.clang_format,
        formatting.cmake_format,
        -- formatting.google_java_format,
        -- diagnostics.flake8,
        },
    }
end

return M
