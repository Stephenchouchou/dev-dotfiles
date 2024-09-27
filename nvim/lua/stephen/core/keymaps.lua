-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

----------------------- General Keymaps -------------------
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local opt = { noremap = true, silent = true }
-- local
local map = vim.api.nvim_set_keymap
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
keymap.set("n", "<A-c>", ":Bdelete<CR>", opt) --need bufdelete.nvim plugin
