-- Shorten function name
local keymap = vim.keymap.set


--Remap space as leader key
keymap("", "<Space>", "<Nop>", {desc = "remap space as leader key", silent = false})
vim.g.mapleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better Escape
keymap("i", "<C-l>", "<Esc>", {desc = "alternate escape", silent = true})

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", {desc = "navigate left window", silent = false})
keymap("n", "<C-j>", "<C-w>j", {desc = "navigate down window", silent = false})
keymap("n", "<C-k>", "<C-w>k", {desc = "navigate up window", silent = false})
keymap("n", "<C-l>", "<C-w>l", {desc = "navigate right window", silent = false})


-- Better navigation in insert, command and terminal mode
keymap("i", "<A-h>", "<Left>", {desc = "move left", silent = false})
keymap("c", "<A-h>", "<Left>", {desc = "move left", silent = false})
keymap("t", "<A-h>", "<Left>", {desc = "move left", silent = false})

keymap("i", "<A-j>", "<Down>", {desc = "move down", silent = false})
keymap("c", "<A-j>", "<Down>", {desc = "move down", silent = false})
keymap("t", "<A-j>", "<Down>", {desc = "move down", silent = false})

keymap("i", "<A-k>", "<Up>", {desc = "move up", silent = false})
keymap("c", "<A-k>", "<Up>", {desc = "move up", silent = false})
keymap("t", "<A-k>", "<Up>", {desc = "move up", silent = false})

keymap("i", "<A-l>", "<Right>", {desc = "move right", silent = false})
keymap("c", "<A-l>", "<Right>", {desc = "move right", silent = false})
keymap("t", "<A-l>", "<Right>", {desc = "move right", silent = false})

keymap('i', "<A-;>", ";", {desc = "type semicolon", silent = false})


-- [kitty] move like sonic
keymap("n", "<A-h>", "b", {desc = "go back one word", silent = false})
keymap("v", "<A-h>", "b", {desc = "go back one word", silent = false})

keymap("n", "<A-j>", "5j", {desc = "go down 5 lines", silent = false})
keymap("v", "<A-j>", "5j", {desc = "go down 5 lines", silent = false})

keymap("n", "<A-k>", "5k", {desc = "go up 5 lines", silent = false})
keymap("v", "<A-k>", "5k", {desc = "go up 5 lines", silent = false})

keymap("n", "<A-l>", "w", {desc = "go forward one word", silent = false})
keymap("v", "<A-l>", "w", {desc = "go forward one word", silent = false})

-- [alacritty] move like sonic
-- keymap("n", "<A-h>", "b", opts)
-- keymap("v", "<A-h>", "b", opts)

-- keymap("n", "<A-j", "b", opts)
-- keymap("v", "<A-j>", "b", opts)

-- keymap("n", "<A-k>", "b", opts)
-- keymap("v", "<A-k>", "b", opts)

-- keymap("n", "<A-l>", "b", opts)
-- keymap("v", "<A-l>", "b", opts)


-- Move to START and END of LINE
keymap("n", "n", "0", {desc = "go to start of line", silent = false})
keymap("v", "n", "0", {desc = "go to start of line", silent = false})
keymap("n", "m", "$", {desc = "go to end of line", silent = false})
keymap("v", "m", "$", {desc = "go to end of line", silent = false})


-- Move to TOP and BOTTOM of FILE
keymap("n", "<S-n>", "gg", {desc = "go to top of file", silent = false})
keymap("v", "<S-n>", "gg", {desc = "go to top of file", silent = false})

keymap("n", "<S-m>", "<S-g>", {desc = "go to bottom of file", silent = false})
keymap("v", "<S-m>", "<S-g>", {desc = "go to bottom of file", silent = false})


-- Move text up and down
keymap("n", "<A-J>", ":m .+1<CR>==", {desc = "move line down", silent = false})
keymap("v", "<A-J>", ":m '>+1<CR>gv=gv", {desc = "move line down", silent = false})

keymap("n", "<A-K>", ":m .-2<CR>==", {desc = "move line up", silent = false})
keymap("v", "<A-K>", ":m '<-2<CR>gv=gv", {desc = "move line up", silent = false})


-- Select EveryThing in normal_mode
keymap("n", "<C-A>", "ggVG", {desc = "select everything", silent = false})
keymap("v", "<C-A>", "<ESC>ggVG", {desc = "select everything", silent = false})


-- Change key map for cycling search term
keymap("n", "b", "n", {desc = "next search result", silent = false})


-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", {desc = "clear search highlights", silent = false})


-- Change key map for mark
keymap("n", "`", "m", {desc = "set mark", silent = false})
keymap("n", "~", "'", {desc = "go to mark", silent = false})


-- Find and Replace
keymap("n", "<A-rr>", ":%s/", {desc = "find and replace in file", silent = false})
keymap("v", "<A-r>", ":s/", {desc = "find and replace in selection", silent = false})


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", {desc = "decrease window height", silent = false})
keymap("n", "<C-Down>", ":resize +2<CR>", {desc = "increase window height", silent = false})
keymap("n", "<C-Left>", ":vertical resize -2<CR>", {desc = "decrease window width", silent = false})
keymap("n", "<C-Right>", ":vertical resize +2<CR>", {desc = "increase window width", silent = false})


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", {desc = "next buffer", silent = false})
keymap("n", "<S-h>", ":bprevious<CR>", {desc = "previous buffer", silent = false})


-- Close and Save buffer
keymap("n", "q", "<cmd>Bdelete!<CR>", {desc = "close buffer", silent = false})
keymap("n", "s", "<cmd>w!<CR>", {desc = "save buffer", silent = false})

-- Close and Save all
keymap("n", "<C-q>", "<cmd>qa!<CR>", {desc = "quit all", silent = false})
keymap("n", "<C-s>", "<cmd>wa!<CR>", {desc = "save all", silent = false})


-- RunCode
keymap("n", "<A-;>", ':RunCode<CR>:ToggleTerm<CR>:ToggleTerm<CR>', {desc = "run code", silent = false})


-- Better paste
keymap("v", "p", '"_dP', {desc = "paste without yanking", silent = false})


-- Macros
keymap("n", "<S-q>", "q", {desc = "record macro", silent = false})


-- Stay in indent mode
keymap("v", "<", "<gv", {desc = "indent left", silent = false})
keymap("v", ">", ">gv", {desc = "indent right", silent = false})


-- Plugins --

-- Comment
keymap("n", "<leader>c", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {desc = "toggle comment", silent = false})
keymap("x", "<leader>c", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {desc = "toggle comment", silent = false})

-- These can't run in vscode
if not vim.g.vscode then

    -- Hop
    keymap("n", "F", ":HopLineStartMW<CR>", {desc = "hop to line", silent = false})
    keymap("n", "fw", ":HopWordMW<CR>", {desc = "hop to word", silent = false})
    keymap("n", "fp", ":HopPatternMW<CR>", {desc = "hop to pattern", silent = false})
    keymap("n", "fc", ":HopChar2MW<CR>", {desc = "hop to char", silent = false})

    -- NvimTree
    keymap("n", "<leader>E", ":NvimTreeToggle<CR> :NvimTreeRefresh<CR>", {desc = "toggle file tree", silent = false})

    -- Telescope
    -- refer to user.telescope

    -- Git
    -- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {desc = "open lazygit", silent = false})

    -- Diff View
    keymap("n", "<leader>go", ":DiffviewOpen<CR>", {desc = "open diff view", silent = false})
    keymap("n", "<leader>gq", ":DiffviewClose<CR>", {desc = "close diff view", silent = false})
    keymap("n", "<leader>gh", ":DiffviewFileHistory<CR>", {desc = "show file history", silent = false})
    keymap("n", "<leader>gr", ":DiffviewRefresh<CR>", {desc = "refresh diff view", silent = false})

    -- DAP
    keymap("n", "<A-d><A-b>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {desc = "toggle breakpoint", silent = false})
    keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {desc = "debug continue", silent = false})
    keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", {desc = "step into", silent = false})
    keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", {desc = "step over", silent = false})
    keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", {desc = "step out", silent = false})
    keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", {desc = "toggle debug repl", silent = false})
    keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", {desc = "run last debug", silent = false})
    keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", {desc = "toggle debug ui", silent = false})
    keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", {desc = "terminate debug", silent = false})

    -- Lsp
    keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", {desc = "format file", silent = false})

end
