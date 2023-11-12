local M = {}

-- check https://github.com/williamboman/mason-lspconfig.nvim for available LSP's
M.servers = {
    "bash-language-server",
    "clangd",
    "lua-language-server",
    "pyright",
    "taplo",
    "yamlls",
    -- "csharp_ls",
    -- "omnisharp_mono",
    -- "omnisharp",
}

return M
