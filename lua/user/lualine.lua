local M = {
    "nvim-lualine/lualine.nvim",
    commit = "a94fc68960665e54408fe37dcf573193c4ce82c9",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
        return
    end

    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = false,
        always_visible = true,
    }

    local diff = {
        "diff",
        colored = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
    }

    local filetype = {
        "filetype",
        icons_enabled = false,
    }

    local location = {
        "location",
        padding = 1,
    }

    -- local spaces = function()
    --   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    -- end
    lualine.setup {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "catppuccin",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "dashboard" },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { diagnostics },
            lualine_x = { diff, filetype },
            lualine_y = { location },
            lualine_z = { "progress" },
        },
    }
end

return M
