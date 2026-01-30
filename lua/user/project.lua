local M = {
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",

    keys = {
        {
            "<leader>fp",
            "<cmd>FzfProjects<CR>",
            desc = "Find Recent Projects",
        },
    }
}

function M.config()
    local project = require "project_nvim"
    project.setup {
        -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
        detection_methods = { "pattern" },

        -- patterns used to detect root dir, when **"pattern"** is in detection_methods
        patterns = { ".git", "Makefile", "package.json", "CMakeLists.txt" },
    }

    local history = require("project_nvim.utils.history")
    local project_p = require("project_nvim.project")

    vim.api.nvim_create_user_command("FzfProjects", function()
        local projects = history.get_recent_projects()

        require("fzf-lua").fzf_exec(projects, {
            prompt = "Projects> ",
            actions = {
                ["default"] = function(selected)
                    if selected and #selected > 0 then
                        local project_path = selected[1]
                        if project_p.set_pwd(project_path, "fzf-lua") then
                            require("fzf-lua").files()
                        end
                    end
                end,
            },
        })
    end, {})
end

return M
