local M = {
  "max397574/better-escape.nvim",
  event = "VimEnter",
  -- commit = "1a1eceafe54b5081eae4cb91c723abd1d450f34b",
}


function M.config()
    require("better_escape").setup {
        mapping = {"jk"}, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        -- keys = function()
        --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        -- end,
    }
end

return M
