local M = {
    "williamboman/mason.nvim",
    commit = "8024d64e1330b86044fed4c8494ef3dcd483a67c",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            commit = "f54e3c11fc9ebfcfc27e696182b0295b071d0811",
        },
    },
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

function M.config()
    require("mason").setup(settings)
    require("mason-lspconfig").setup {
        ensure_installed = require("utils").servers,
        automatic_installation = true,
    }
    -- require("mason-lspconfig").setup_handlers {
    --     function () -- default handler (optional)
    --         require("lspconfig").omnisharp.setup{}
    --     end,
    -- }
    -- require("lspconfig").omnisharp_mono.setup{}
end


return M
