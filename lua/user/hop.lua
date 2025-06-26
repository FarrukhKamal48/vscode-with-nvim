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

end

return M
