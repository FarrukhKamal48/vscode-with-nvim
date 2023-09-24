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


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Move like sonic
keymap("n", "<A-j>", "5j", opts)
keymap("n", "<A-k>", "5k", opts)


-- Move cursor word by word
keymap("n", "<A-h>", "b", opts)
keymap("n", "<A-l>", "w", opts)


-- Change key map for cycling search term
keymap("n", "b", "n", opts)


-- Change key map for mark
keymap("n", "`", "m", opts)
keymap("n", "~", "'", opts)


-- Move to START and END of LINE
keymap("n", "n", "0", opts)
keymap("n", "m", "$", opts)


-- Move to TOP and BOTTOM of FILE
keymap("n", "<S-n>", "gg", opts)
keymap("n", "<S-m>", "<S-g>", opts)

-- Move text up and down
keymap("n", "<A-J>", ":m .+1<CR>==", opts)
keymap("n", "<A-K>", ":m .-2<CR>==", opts)
keymap("v", "<A-J>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-K>", ":m '<-2<CR>gv=gv", opts)


-- Select EveryThing in normal_mode
keymap("n", "<C-A>", "ggVG", opts)  -- does'nt work


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)


-- Close and Save buffers
keymap("n", "q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "s", "<cmd>w!<CR>", opts)


-- Close and Save all
keymap("n", "<C-q>", "<cmd>qa!<CR>", opts)
keymap("n", "<C-s>", "<cmd>wa!<CR>", opts)


-- Save, Compile and Run (C/C++)
                                                           -- take the full path, and remove the file part.
                                                           -- Append "/./" to this path string. Then take the path
                                                           -- again, remove the directories part and the file
                                                         --|| extention and then apend it to the path string. 
-- keymap("n","<A-;>", ':w!<CR>:TermExec cmd="gcc %:p -o %:p:r && clear && %:p:h/./%:p:t:r"<CR>:ToggleTerm<CR>:ToggleTerm<CR>', opts)
keymap("n", "<A-;>", ':RunCode<CR>:ToggleTerm<CR>:ToggleTerm<CR>', opts)
-- if (vim.fn.expand('%:e')==('c')) then
--    keymap("n","<A-;>", ':w!<CR>:TermExec cmd="gcc %:p -o %:p:r && clear && %:p:h/./%:p:t:r"<CR>:ToggleTerm<CR>:ToggleTerm<CR>', opts)
-- end
-- print(vim.fn.expand('%:e'))


-- Better paste
keymap("v", "p", '"_dP', opts)


-- Macros
keymap("n", "<S-q>", "q", opts)

-- Insert --
-- Press jk fast to escape
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)


-- Better navigation in insert mode
keymap("i", "<A-h>", "<Left>", opts)
keymap("i", "<A-j>", "<Down>", opts)
keymap("i", "<A-k>", "<Up>", opts)
keymap("i", "<A-l>", "<Right>", opts)

keymap('i', "<A-;>", ";", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Move to START and END of LINE
keymap("v", "n", "0", opts)
keymap("v", "m", "$", opts)


-- Move to TOP and BOTTOM of FILE
keymap("v", "<S-n>", "gg", opts)
keymap("v", "<S-m>", "<S-g>", opts)


-- Select EveryThing in visual_mode
keymap("v", "<C-A>", "<ESC>ggVG", opts)   -- does'nt work


-- Move like sonic
keymap("v", "<A-j>", "5j", opts)
keymap("v", "<A-k>", "5k", opts)


-- Move cursor word by word
keymap("v", "<A-h>", "b", opts)
keymap("v", "<A-l>", "w", opts)


-- TERMINAL MODE

-- Better navigation in term mode
keymap("t", "<A-h>", "<Left>", opts)
keymap("t", "<A-j>", "<Down>", opts)
keymap("t", "<A-k>", "<Up>", opts)
keymap("t", "<A-l>", "<Right>", opts)


-- COMMAND MODE

-- Better navigation in command mode
keymap("c", "<A-h>", "<Left>", opts)
keymap("c", "<A-j>", "<Down>", opts)
keymap("c", "<A-k>", "<Up>", opts)
keymap("c", "<A-l>", "<Right>", opts)

if vim.g.vscode then
  return
else

    -- Plugins --

    -- NvimTree
    keymap("n", "<leader>E", ":NvimTreeToggle<CR> :NvimTreeRefresh<CR>", opts)

    -- Hop
    keymap("n", "F", ":HopLineStartMW<CR>", opts)
    keymap("n", "fw", ":HopWordMW<CR>", opts)
    keymap("n", "fp", ":HopPatternMW<CR>", opts)
    keymap("n", "fc", ":HopChar2MW<CR>", opts)


    -- ToogleTerm
    -- keymap("n", "<C-/>", ":ToggleTermToggleAll<CR>", opts)


    -- Telescope
    keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
    keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
    keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
    keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)


    -- Git
    keymap("n", "<leader>G", "<cmd>LazyGit<CR>", opts)


    -- Comment
    --[[ keymap("n", "<leader>cc", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts) ]]
    --[[ keymap("x", "<leader>cc", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>') ]]
    keymap("n", "<C-/>", "gcc<CR>", opts)
    keymap("x", "<C-/>", "gc<CR>", opts)

	--keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)

    -- DAP
    keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
    keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
    keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
    keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
    keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
    keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
    keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
    keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
    keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
end
