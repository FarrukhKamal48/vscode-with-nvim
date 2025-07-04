local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- only load hop.nvim if vscode is using nvim instace
-- if vim.g.vscode then
--     require("lazy").setup("code")
-- else
    -- load lazy
    require("lazy").setup("user", {
        install = { colorscheme = { require("user.colorscheme").name } },
        defaults = {
            lazy = true,
            version = "6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a"
        },
        ui = { wrap = "true" },
        change_detection = { enabled = true },
        debug = false,
        performance = {
            rtp = {
                disabled_plugins = {
                    -- "gzip", -- Plugin for editing compressed files.
                    -- "matchit", -- What is it?
                    --  "matchparen", -- Plugin for showing matching parens
                    --  "netrwPlugin", -- Handles file transfers and remote directory listing across a network
                    --  "tarPlugin", -- Plugin for browsing tar files
                    --  "tohtml", -- Converting a syntax highlighted file to HTML
                    --  "tutor", -- Teaching?
                    --  "zipPlugin", -- Handles browsing zipfiles
                },
            },
        },
    })
-- end
