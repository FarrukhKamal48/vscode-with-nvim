-- General Settings
require("user.options")
require("user.keymaps")
require("user.project")
require("user.impatient")
require("user.autocommands")

if vim.g.vscode then
    -- vscode extensions
    require("user.vscode&nvim")
else
    -- ordinary Neovim
    require("user.plugins")
    require("user.colorscheme")
    require("user.cmp")
    require("user.telescope")
    require("user.treesitter")
    require("user.autopairs")
    require("user.gitsigns")
    require("user.illuminate")
    require("user.indentline")
    require("user.alpha")
    require("user.lsp")
    require("user.dap")
    require("user.coderunner")
    require('user.rainbow-ts-bracket')
    require("user.nvim-tree")
    require("user.bufferline")
    require("user.lualine")
    require("user.toggleterm")
    require("user.comment")
end
