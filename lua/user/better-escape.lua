local M = {
    "max397574/better-escape.nvim",
    event = "VimEnter",
}


function M.config()
    require("better_escape").setup {
        timeout = vim.o.timeoutlen, -- after `timeout` passes, you can press the escape key and the plugin will ignore it
        default_mappings = false, -- setting this to false removes all the default mappings
        mappings = {
            -- i for insert
            i = {
                j = {
                    -- These can all also be functions
                    k = "<Esc>",
                    j = "<Esc>",
                },
            },
            c = {
                j = {
                    k = "<C-c>",
                    j = "<C-c>",
                },
            },
            t = {
                j = {
                    k = "<C-\\><C-n>",
                },
            },
            s = {
                j = {
                    k = "<Esc>",
                },
            },
        },
    }
end

return M
