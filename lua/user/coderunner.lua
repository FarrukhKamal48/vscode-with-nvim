local M = {
  "CRAG666/code_runner.nvim",
  event = "VimEnter",
  commit = "01ce754d162170a3fcf372ad9f188a65c010f235",
}


function M.config()
    local runner = require "code_runner"

    runner.setup {
        mode = "toggleterm",
        focus = true,
        startinsert = true,
        -- term = {
        --     position = "vert",
        --     size = 15,
        -- },
        filetype = {
            -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
            python = "clear && python3.11 -u",
            c = "cd $dir && gcc $fileName -o $fileNameWithoutExt -lm && $dir/$fileNameWithoutExt",
            -- typescript = "deno run",
            -- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
        },
    }

end

return M
