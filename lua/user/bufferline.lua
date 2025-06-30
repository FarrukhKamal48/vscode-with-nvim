local M = {
    "akinsho/bufferline.nvim",
    commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3",
    event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
    dependencies = {
        {
            "famiu/bufdelete.nvim",
            commit = "f6bcea78afb3060b198125256f897040538bcb81",
        },
    },
}
function M.config()
    local mocha = require("catppuccin.palettes").get_palette "mocha"
    
    require("bufferline").setup {
        options = {
            close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
            right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            separator_style = "thick",            -- | "thick" | "thin" | { 'any', 'any' },
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get {
            styles = { "italic", "bold" },
            custom = {
                all = {
                    fill = { bg = "#000000" },
                },
                mocha = {
                    background = { fg = mocha.text },
                },
                latte = {
                    background = { fg = "#000000" },
                },
            },
        },
    }
end

return M
