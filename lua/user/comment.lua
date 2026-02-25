local M = {
    "numToStr/Comment.nvim",
    commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
    event = {"BufRead", "BufNewFile"},
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
            commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f",
        },
    },
}

function M.config()
    local keymap = vim.keymap.set

    keymap("n", "<leader>c", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {desc = "toggle comment", silent = false})
    keymap("x", "<leader>c", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {desc = "toggle comment", silent = false})
end

return M
