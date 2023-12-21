local M = {}

-- check https://github.com/williamboman/mason-lspconfig.nvim for available LSP's
M.servers = {
    "bashls",
    "clangd",
    "lua_ls",
    "pyright",
    "taplo",
    "yamlls",
    "cmake",
    -- "prosemd_lsp",
    -- "csharp_ls",
    -- "omnisharp_mono",
    -- "omnisharp",
}

return M
