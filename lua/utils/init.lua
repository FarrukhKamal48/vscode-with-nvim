local M = {}

-- check https://github.com/williamboman/mason-lspconfig.nvim for available LSP's
M.servers = {
    "bashls",
    "clangd",
    "lua_ls",
    "pyright",
    "taplo",
    "yamlls",
}

return M
