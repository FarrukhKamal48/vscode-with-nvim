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
    local pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
        local U = require "Comment.utils"

        -- Determine whether to use linewise or blockwise commentstring
        local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

        -- Determine the location where to calculate commentstring from
        local location = nil
        if ctx.ctype == U.ctype.blockwise then
            location = require("ts_context_commentstring.utils").get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
            key = type,
            location = location,
        }
    end
  end
end

return M
