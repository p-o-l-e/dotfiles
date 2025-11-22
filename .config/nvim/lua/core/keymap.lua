-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness


-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", 			{ desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", 			{ desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", 			{ desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", 	{ desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", 	{ desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", 	{ desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", 		{ desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", 		{ desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", 	{ desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.keymap.set("v", "<C-c>", '"+y', 		{ silent = true })
vim.keymap.set("v", "<C-x>", '"+c',  		{ silent = true })
vim.keymap.set("n", "<C-v>", 'c<ESC>"+p', 	{ silent = true })


-- MOVEMENT

keymap.set("n", "<C-A-Left>", "<C-w>h")
keymap.set("n", "<C-A-Down>", "<C-w>j")
keymap.set("n", "<C-A-Up>", "<C-w>k")
keymap.set("n", "<C-A-Right>", "<C-w>l")

-- terminal
keymap.set("t", "<C-Left>", "<cmd>wincmd h<CR>")
keymap.set("t", "<C-Down>", "<cmd>wincmd j<CR>")
keymap.set("t", "<C-Up>", "<cmd>wincmd k<CR>")
keymap.set("t", "<C-Right>", "<cmd>wincmd l<CR>")


-- RESIZE

keymap.set("n", "<C-S-Up>", ":resize +1<CR>")
keymap.set("n", "<C-S-Down>", ":resize -1<CR>")
keymap.set("n", "<C-S-Left>", ":vertical resize +1<CR>")
keymap.set("n", "<C-S-Right>", ":vertical resize -1<CR>")

-- terminal
keymap.set("t", "<C-S-Up>", "<cmd>resize +1<CR>")
keymap.set("t", "<C-S-Down>", "<cmd>resize -1<CR>")
keymap.set("t", "<C-S-Left>", "<cmd>vertical resize +1<CR>")
keymap.set("t", "<C-S-Right>", "<cmd>vertical resize -1<CR>")

-- Buffer navigation

keymap.set("n", "<A-TAB>",   ":bn<CR>")
keymap.set("n", "<S-A-TAB>", ":bp<CR>")
keymap.set("n", "<A-q>",     ":bd<CR>")
