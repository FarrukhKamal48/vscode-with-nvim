-- Shorten function name
local keymap = vim.keymap.set


-- Silent keymap option
local opts = { silent = false }


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Better navigation in insert, command and terminal mode
keymap("i", "<A-h>", "<Left>", opts)
keymap("c", "<A-h>", "<Left>", opts)
keymap("t", "<A-h>", "<Left>", opts)

keymap("i", "<A-j>", "<Down>", opts)
keymap("c", "<A-j>", "<Down>", opts)
keymap("t", "<A-j>", "<Down>", opts)

keymap("i", "<A-k>", "<Up>", opts)
keymap("c", "<A-k>", "<Up>", opts)
keymap("t", "<A-k>", "<Up>", opts)

keymap("i", "<A-l>", "<Right>", opts)
keymap("c", "<A-l>", "<Right>", opts)
keymap("t", "<A-l>", "<Right>", opts)

keymap('i', "<A-;>", ";", opts)


-- [kitty] move like sonic
keymap("n", "<A-h>", "b", opts)
keymap("v", "<A-h>", "b", opts)

keymap("n", "<A-j>", "5j", opts)
keymap("v", "<A-j>", "5j", opts)

keymap("n", "<A-k>", "5k", opts)
keymap("v", "<A-k>", "5k", opts)

keymap("n", "<A-l>", "w", opts)
keymap("v", "<A-l>", "w", opts)

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
keymap("n", "n", "0", opts)
keymap("v", "n", "0", opts)
keymap("n", "m", "$", opts)
keymap("v", "m", "$", opts)


-- Move to TOP and BOTTOM of FILE
keymap("n", "<S-n>", "gg", opts)
keymap("v", "<S-n>", "gg", opts)

keymap("n", "<S-m>", "<S-g>", opts)
keymap("v", "<S-m>", "<S-g>", opts)


-- Move text up and down
keymap("n", "<A-J>", ":m .+1<CR>==", opts)
keymap("v", "<A-J>", ":m '>+1<CR>gv=gv", opts)

keymap("n", "<A-K>", ":m .-2<CR>==", opts)
keymap("v", "<A-K>", ":m '<-2<CR>gv=gv", opts)


-- Select EveryThing in normal_mode
keymap("n", "<C-A>", "ggVG", opts)
keymap("v", "<C-A>", "<ESC>ggVG", opts)


-- Change key map for cycling search term
keymap("n", "b", "n", opts)


-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)


-- Change key map for mark
keymap("n", "`", "m", opts)
keymap("n", "~", "'", opts)


-- Find and Replace
keymap("n", "<A-s>", ":%s/", opts)
keymap("v", "<A-s>", ":s/", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Close and Save buffer
keymap("n", "q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "s", "<cmd>w!<CR>", opts)

-- Close and Save all
keymap("n", "<C-q>", "<cmd>qa!<CR>", opts)
keymap("n", "<C-s>", "<cmd>wa!<CR>", opts)


-- RunCode
keymap("n", "<A-;>", ':RunCode<CR>:ToggleTerm<CR>:ToggleTerm<CR>', opts)


-- Better paste
keymap("v", "p", '"_dP', opts)


-- Macros
keymap("n", "<S-q>", "q", opts)


-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Plugins --

-- Comment
keymap("n", "<leader>c", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>c", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- These can't run in vscode
if not vim.g.vscode then

    -- Hop
    keymap("n", "F", ":HopLineStartMW<CR>", opts)
    keymap("n", "fw", ":HopWordMW<CR>", opts)
    keymap("n", "fp", ":HopPatternMW<CR>", opts)
    keymap("n", "fc", ":HopChar2MW<CR>", opts)

    -- NvimTree
    keymap("n", "<leader>E", ":NvimTreeToggle<CR> :NvimTreeRefresh<CR>", opts)

    -- Telescope
    keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
    keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
    keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
    keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

    -- Git
    keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)


    -- DAP
    keymap("n", "<A-d><A-b>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
    keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
    keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
    keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
    keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
    keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
    keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
    keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
    keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

    -- Lsp
    keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

end
