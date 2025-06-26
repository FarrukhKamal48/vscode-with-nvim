local M = {
    "lukas-reineke/indent-blankline.nvim",
    commit = "005b56001b2cb30bfa61b7986bc50657816ba4ba",
    event = "VimEnter",
    main = "ibl",
    dependencies = {
        {
            "HiPhish/rainbow-delimiters.nvim",
            commit = "55ad4fb76ab68460f700599b7449385f0c4e858e",
            event = "VimEnter",
        },
    }
}


function M.config()
    local lineHighlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    vim.g.rainbow_delimiters = { highlight = lineHighlight }
    require("ibl").setup {
        scope = {
            enabled = true,
            char = "▏",
            highlight = lineHighlight,
        },
        -- indent = {
        --     char = "▏",
        --     highlight = lineHighlight,
        -- },
        -- whitespace = {
        --     highlight = { "Whitespace", "CursorColumn", },
        --     remove_blankline_trail = false,
        -- },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
