local M = {
    "ibhagwan/fzf-lua",
    commit = "b3c870638bad2929aa62c4003cd9935110ada467",
    cmd = "FzfLua",
    event = "VeryLazy",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- opts = {
    --     keymap = {
    --         fzf = {
    --             ["ctrl-q"] = "select-all+accept",
    --         },
    --     },
    -- },

    keys = {
        -- All simple mappings are converted to command strings.
        -- This is more efficient and allows lazy.nvim to use them as triggers.
        { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
        { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
        { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Find Help" },
        { "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Find Keymaps" },
        { "<leader>fb", "<cmd>FzfLua builtin<CR>", desc = "Find Builtin" },
        { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "Find Word" },
        { "<leader>fW", "<cmd>FzfLua grep_cWORD<CR>", desc = "Find WORD" },
        { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Find Diagnostics" },
        { "<leader>fr", "<cmd>FzfLua resume<CR>", desc = "Resume FZF" },
        { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Find Old Files" },
        { "<leader><leader>", "<cmd>FzfLua buffers<CR>", desc = "Find Buffers" },
        { "<leader>/", "<cmd>FzfLua lgrep_curbuf<CR>", desc = "Grep Current Buffer" },
        -- Find in Config
        {
            "<leader>fc",
            function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find in Config",
        },

        -- Find and insert templates (Simplified)
        {
            "<leader>ft",
            function()
                local fzf = require("fzf-lua")
                local template = require("template")
                local current_filetype = vim.bo.filetype

                -- Get the list of templates from templates.nvim
                local template_list = template.get_temp_list()

                -- Safety check: ensure templates exist for this filetype
                if not template_list[current_filetype] then
                    vim.notify("No templates found for filetype: " .. current_filetype, vim.log.levels.WARN)
                    return
                end

                fzf.fzf_exec(template_list[current_filetype], {
                    prompt = string.format("Templates [%s]> ", current_filetype),
                    previewer = "builtin", -- Shows the content of the template in preview
                    actions = {
                        ["default"] = function(selected)
                            if selected and #selected > 0 then
                                -- selected[1] contains the full path
                                -- :t = tail (filename), :r = root (remove extension)
                                local name = vim.fn.fnamemodify(selected[1], ":t:r")

                                -- Execute the command
                                vim.cmd("Template " .. name)
                            end
                        end,
                    },
                })
            end,
            desc = "Find Templates",
        },
    },
}

return M
