local M = {
    "nvim-telescope/telescope.nvim",
    commit = "b4da76be54691e854d3e0e02c36b0245f945c2c7",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
        {
            "ahmedkhalf/project.nvim",
            commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb"
        },
    },
}

local actions = require "telescope.actions"

M.opts = {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },
        mappings = {
            i = {
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
}

return M
