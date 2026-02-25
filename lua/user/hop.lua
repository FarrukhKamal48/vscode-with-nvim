local M = {
    "phaazon/hop.nvim",
    event = "VimEnter",
    commit = "1a1eceafe54b5081eae4cb91c723abd1d450f34b",
}


function M.config()
    local hop = require "hop"

    hop.setup {
        keys = 'etovxqpdygfblzhckisuran',
        quit_key = '<SPC',
        jump_on_sole_occurrence = false,
        case_insensitive = true,
        multi_windows = true,
    }

    local keymap = vim.keymap.set

    keymap("n", "F", ":HopLineStartMW<CR>", {desc = "hop to line", silent = false})
    keymap("n", "fw", ":HopWordMW<CR>", {desc = "hop to word", silent = false})
    keymap("n", "fp", ":HopPatternMW<CR>", {desc = "hop to pattern", silent = false})
    keymap("n", "fc", ":HopChar2MW<CR>", {desc = "hop to char", silent = false})

end

return M
