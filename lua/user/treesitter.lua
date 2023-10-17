local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "226c1475a46a2ef6d840af9caa0117a439465500",
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
  },
}
function M.config()
    -- local treesitter = require "nvim-treesitter"
    local configs = require "nvim-treesitter.configs"
    local rainbow =  {
        "#bb9af7",
        "#7aa2f7",
        "#7eb956",
        "#c058e1",
        "#ef5766",
        "#edbb5c",
        "#ffffff",
    }

  configs.setup {
    ensure_installed = {"python", "c", "cpp", "bash", "lua", "toml", "yaml"}, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" },                                                       -- List of parsers to ignore installing
    sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<A-f>',
          scope_incremental = '<A-f>',
          node_incremental = '<A-e>',
          node_decremental = '<A-d>',
        },
    },

    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        colors = rainbow,
        termcolors = rainbow
    },
  }
    -- apply rainbow bracket color overides
    -- for i, c in ipairs(rainbow) do -- p00f/rainbow#81
    --     vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
    -- end

end

return M
