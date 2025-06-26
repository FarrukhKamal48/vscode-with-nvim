local M = {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    commit = "19d6211c78169e78bab372b585b6fb17ad974e82"
}

function M.config()
    require("nvim-web-devicons").setup {
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh",
            },
        },
        color_icons = true,
        default = true,
    }
end

return M
