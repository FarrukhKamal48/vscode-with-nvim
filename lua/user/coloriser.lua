local M = {
    "norcalli/nvim-colorizer.lua",
    commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e",
    event = "BufReadPost",
}

function M.config()
    -- Exclude some filetypes from highlighting by using `!`
    require 'colorizer'.setup {
      '*'; -- Highlight all files, but customize some others.
      '!vim'; -- Exclude vim from highlighting.
      -- Exclusion Only makes sense if '*' is specified!
    }
end

return M
