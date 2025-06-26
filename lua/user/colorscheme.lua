local M = {
    "folke/tokyonight.nvim",
    commit = "057ef5d260c1931f1dffd0f052c685dcd14100a3",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins        
}

M.name = "tokyonight-night"
function M.config()
    local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
    if not status_ok then
        return
    end
end

return M
