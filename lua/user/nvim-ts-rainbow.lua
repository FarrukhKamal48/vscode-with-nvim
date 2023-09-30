local M = {
  "p00f/nvim-ts-rainbow",
  event = "VimEnter",
  -- commit = "1a1eceafe54b5081eae4cb91c723abd1d450f34b",
}


-- function M.config()
--     local tsconfig = require "nvim-treesitter.configs"
--
--     tsconfig.setup {
--         highlight = {
--         },
--         rainbow = {
--             enable = true,
--             -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--             extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--             max_file_lines = nil, -- Do not enable for files with more than n lines, int
--             colors = {
--               -- Colors here
--                 "#9d4f80",
--                 "#1a71bc",
--                 "#7eb956",
--                 "#c058e1",
--                 "#ef5766",
--                 "#edbb5c",
--                 "#ffffff",
--             },
--             -- termcolors = {} -- table of colour name strings
--         }
--     }
--
-- end

return M
