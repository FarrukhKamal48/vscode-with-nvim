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

-- Screen line movement
keymap({ "n", "v", "x" }, "j", "gj", {desc = "move 1 screen line down", silent = true})
keymap({ "n", "v", "x" }, "k", "gk", {desc = "move 1 screen line down", silent = true})

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", {desc = "navigate left window", silent = false})
keymap("n", "<C-j>", "<C-w>j", {desc = "navigate down window", silent = false})
keymap("n", "<C-k>", "<C-w>k", {desc = "navigate up window", silent = false})
keymap("n", "<C-l>", "<C-w>l", {desc = "navigate right window", silent = false})


-- Better navigation in insert, command and terminal mode
keymap({ "i", "c", "t" }, "<A-h>", "<Left>", {desc = "move left", silent = false})
keymap({ "i", "c", "t" }, "<A-j>", "g<Down>", {desc = "move 1 screen line down", silent = false})
keymap({ "i", "c", "t" }, "<A-k>", "g<Up>", {desc = "move 1 screen line up", silent = false})
keymap({ "i", "c", "t" }, "<A-l>", "<Right>", {desc = "move right", silent = false})


-- move like sonic
keymap({ "n", "v" }, "<A-h>", "b", {desc = "go back one word", silent = false})
keymap({ "n", "v" }, "<A-j>", "5j", {desc = "go down 5 lines", silent = false})
keymap({ "n", "v" }, "<A-k>", "5k", {desc = "go up 5 lines", silent = false})
keymap({ "n", "v" }, "<A-l>", "w", {desc = "go forward one word", silent = false})


keymap("n", "<S-k>", "O<Esc>j", {desc = "add line above", silent = false})


-- Move to START and END of LINE
keymap("n", "n", "0", {desc = "go to start of line", silent = false})
keymap("v", "n", "0", {desc = "go to start of line", silent = false})
keymap("n", "m", "$", {desc = "go to end of line", silent = false})
keymap("v", "m", "$", {desc = "go to end of line", silent = false})


-- Move to TOP and BOTTOM of FILE
keymap({ "n", "v" }, "<S-n>", "gg", {desc = "go to top of file", silent = false})
keymap({ "n", "v" }, "<S-m>", "<S-g>", {desc = "go to bottom of file", silent = false})


-- Move text up and down
keymap("n", "<A-J>", ":m .+1<CR>==", {desc = "move line down", silent = false})
keymap("v", "<A-J>", ":m '>+1<CR>gv=gv", {desc = "move line down", silent = false})

keymap("n", "<A-K>", ":m .-2<CR>==", {desc = "move line up", silent = false})
keymap("v", "<A-K>", ":m '<-2<CR>gv=gv", {desc = "move line up", silent = false})


-- Select EveryThing in normal_mode
keymap("n", "<C-A>", "ggVG", {desc = "select everything", silent = false})
keymap("v", "<C-A>", "<ESC>ggVG", {desc = "select everything", silent = false})


-- highlights
keymap("n", "b", "n", {desc = "next search result", silent = false})
keymap("n", "<S-b>", "<S-n>", {desc = "previous search result", silent = false})
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", {desc = "clear search highlights", silent = false})


-- Change key map for mark
keymap("n", "`", "m", {desc = "set mark", silent = false})
keymap("n", "~", "'", {desc = "go to mark", silent = false})


-- Find and Replace
keymap("n", "<A-r>", ":%s/", {desc = "find and replace in file", silent = false})
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


-- Better paste
keymap("v", "p", '"_dP', {desc = "paste without yanking", silent = false})


-- Macros
keymap("n", "<S-q>", "q", {desc = "record macro", silent = false})


-- Stay in indent mode
keymap("v", "<", "<gv", {desc = "indent left", silent = false})
keymap("v", ">", ">gv", {desc = "indent right", silent = false})


-- These can't run in vscode
if not vim.g.vscode then





end
