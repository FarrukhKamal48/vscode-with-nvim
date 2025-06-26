local M = {
    "nvim-treesitter/nvim-treesitter",
    commit = "42fc28ba918343ebfd5565147a42a26580579482",
    event = "BufReadPost",
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
            commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f",
        },
        {
            "nvim-tree/nvim-web-devicons",
            commit = "19d6211c78169e78bab372b585b6fb17ad974e82",
            event = "VeryLazy",
        },
    },
}

function M.config()
    -- local treesitter = require "nvim-treesitter"
    local configs = require "nvim-treesitter.configs"

    configs.setup {
        ensure_installed = require("utils").parsers, -- put the language you want in this array
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

        -- indent = { enable = true, disable = { "python", "css" } },
        --
        -- rainbow = {
        --     enable = true,
        --     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        --     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        --     max_file_lines = nil, -- Do not enable for files with more than n lines, int
        --     -- colors = {}, -- table of hex strings
        --     colors = rainbow,
        --     termcolors = rainbow
        -- },
    }

    require('ts_context_commentstring').setup {
        enable = true,
        enable_autocmd = false,
    }

end

return M
