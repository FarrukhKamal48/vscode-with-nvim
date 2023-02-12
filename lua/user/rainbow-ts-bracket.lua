require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      -- Colors here
        "#9d4f80",
        "#1a71bc",
        "#7eb956",
        "#c058e1",
        "#ef5766",
        "#edbb5c",
        "#ffffff",
    },
    -- termcolors = {} -- table of colour name strings
  }
}

-- vim.cmd("hi rainbowcol1 guifg=#dd1ee1")
-- vim.cmd("hi rainbowcol2 guifg=#df7820")
-- vim.cmd("hi rainbowcol3 guifg=#1d85e2")
-- vim.cmd("hi rainbowcol4 guifg=#22dd22")
-- vim.cmd("hi rainbowcol5 guifg=#00c2ff")
-- vim.cmd("hi rainbowcol6 guifg=#fc3d03")
-- vim.cmd("hi rainbowcol7 guifg=#1a6cac")
