-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>]", "<C-i>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>[", "<C-o>", { noremap = true, silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Y", "Vy<Esc>", { desc = "[Y]ank whole line" })

function reindent()
    vim.lsp.buf.format()
end

vim.keymap.set("n", "<leader>=", reindent, { desc = "[=] Reindent file" })

