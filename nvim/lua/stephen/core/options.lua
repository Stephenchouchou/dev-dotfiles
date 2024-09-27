local opt = vim.opt -- for conciseness

vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- listchar
opt.list = true
--vim.o.listchars = "trail:󰞓,eol:󰘌 󰌑 ↴,space:,tab:󰧂󰧂"
opt.listchars = "trail:󰞓,eol:↴,space:.,tab:󰧂󰧂"
--key time
--opt.timeoutlen = 100
--opt.ttimeoutlen = 100
