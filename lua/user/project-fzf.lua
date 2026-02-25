local M = {
    "jakobwesthoff/project-fzf.nvim",
    commit = "93ab9b214dc082a8c6945e8ba2666a7f764a084f",
    dependencies = {
        "ahmedkhalf/project.nvim", -- Must be configured separately
        "ibhagwan/fzf-lua",
    },
    opts = {}, -- Will call require('project-fzf').setup(opts)
}

return M
