local M = {
  "max397574/better-escape.nvim",
  commit = "19a38aab94961016430905ebec30d272a01e9742",
  event = "VimEnter",
  config = function()
    require("better_escape").setup()
  end,
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
