local M = {
    "windwp/nvim-autopairs",
    commit = "2647cce4cb64fb35c212146663384e05ae126bdf",
    event = "InsertEnter",
    dependencies = {
        {
            "hrsh7th/nvim-cmp",
            event = {
                "InsertEnter",
                "CmdlineEnter",
            },
        },
    },
}

function M.config()
    require("nvim-autopairs").setup {
        check_ts = true, -- treesitter integration
        disable_filetype = { "TelescopePrompt" },
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            java = false,
        },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
    }

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
end

return M
