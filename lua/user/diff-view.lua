local M = {
    "sindrets/diffview.nvim",
    commit = "4516612fe98ff56ae0415a259ff6361a89419b0a",
    event = "VimEnter",
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
    },
    opts = {},

}

function M.config()
    local keymap = vim.keymap.set

    keymap("n", "<leader>gg", ":DiffviewOpen<CR>", {desc = "open diff view", silent = false})
    keymap("n", "<leader>go", ":DiffviewClose<CR>", {desc = "close diff view", silent = false})
    keymap("n", "<leader>gh", ":DiffviewFileHistory<CR>", {desc = "show file history", silent = false})
    keymap("n", "<leader>gr", ":DiffviewRefresh<CR>", {desc = "refresh diff view", silent = false})
end


return M
