-- ~/.config/nvim/lua/plugins/vim-fugitive.lua

return {
  "tpope/vim-fugitive",
  event = "VeryLazy", -- 或 "BufReadPre" 根據你想要的載入時機調整
  config = function()
    -- 常用 Git 指令 keybindings
    vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame (full file)" })
    vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
    vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff split" })

    -- 顯示目前游標行的 git blame，並複製到剪貼簿
    vim.keymap.set("n", "<leader>gbl", function()
      local line = vim.fn.line(".")
      local file = vim.fn.expand("%")
      local result = vim.fn.system("git blame " .. file .. " -L " .. line .. "," .. line)
      vim.fn.setreg("+", result) -- 複製到系統剪貼簿
      print(result)              -- 顯示在下方命令列
    end, { desc = "Git blame current line (copied)" })
  end,
}
