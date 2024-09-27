return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk"})
        keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk"})
        keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk"})
        keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk"})
        keymap.set("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk"})
        keymap.set("n", "<leader>hN", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk"})
    end
}
