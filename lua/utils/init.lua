local M = {}

-- check https://github.com/williamboman/mason-lspconfig.nvim for available LSP's
M.servers = {
    "bashls",
    "clangd",
    "lua_ls",
    "pyright",
    "yamlls",
    "cmake",
    -- "prosemd_lsp",
    -- "csharp_ls",
    -- "omnisharp_mono",
    -- "omnisharp",
}

M.parsers = {
    "python", 
    "c", 
    "cpp", 
    "bash", 
    "lua", 
    "toml", 
    "yaml",
}

return M
