-- my custom mappings
--print("hello from lua/core/mappings.lua!")

vim.g.mapleader = " "
-- open explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set('n', '<leader>e', ':Neotree toggle right<cr>', { desc = 'Go to [E]xplorer' })

vim.keymap.set("i", "<C-c>", "<Esc>")

-- quit
-- vim.keymap.set('n', '<leader>q', ':q<cr>', { desc = '[q]uit (buffer)'})
-- save and close

function SaveAndClose()
    if vim.bo.buftype == '' then
        vim.cmd('write')
    end
    vim.cmd('bdelete')
end

-- quick save
vim.api.nvim_set_keymap('n', '<leader>qq', '<cmd>lua SaveAndClose()<CR>', { noremap = true, silent = true })


-- toggle quickfix window
local function toggle_qf()
    -- get the quickfix window id (0 if closed)
    local qf_win = vim.fn.getqflist({winid = 1}).winid
    if qf_win == 0 then
        vim.cmd("copen")
    else
        vim.cmd("cclose")
    end
end

-- `qw`ick fix list
vim.keymap.set("n", "<leader>qf", toggle_qf, { desc = "Toggle Quickfix List" })
vim.keymap.set("n", "<leader>qn", function() vim.cmd("cnext") end, { desc = "Next Quickfix List" })
vim.keymap.set("n", "<leader>qp", function() vim.cmd("cprevious") end, { desc = "Previous Quickfix List" })

vim.keymap.set('n', 'Y', 'Vy<Esc>', { desc = '[Y]ank whole line' })


-- focus left right bottom top "screen"
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })



-- Indent whole file and jump back to last edit position
vim.keymap.set("n", "<leader>=", "maggVG=`a", { desc = '[=] Reindent file' })

vim.api.nvim_set_keymap('n', '<leader>]', '<C-i>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>[', '<C-o>', { noremap = true, silent = true })


-- Open fugitive menu
vim.keymap.set("n", "<leader>G", vim.cmd.Git, { desc = '[G]it interface' })

-- Remove last search term highlight
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- "" Region indent/outdent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('v', '<Tab>', '>gv')

-- Move cursor across soft wraps
vim.keymap.set('v', '<Right>', 'l', { silent = true })
vim.keymap.set('v', '<Left>', 'h', { silent = true })
vim.keymap.set('v', '<Up>', 'gk', { silent = true })
vim.keymap.set('v', '<Down>', 'gj', { silent = true })
vim.keymap.set('n', '<Right>', 'l', { silent = true })
vim.keymap.set('n', '<Left>', 'h', { silent = true })
vim.keymap.set('n', '<Up>', 'gk', { silent = true })
vim.keymap.set('n', '<Down>', 'gj', { silent = true })
vim.keymap.set('i', '<Up>', '<C-o>gk', { silent = true })
vim.keymap.set('i', '<Down>', '<C-o>gj', { silent = true })

-- in visual mode, leader p will paste to the clipboard using the _ register
vim.keymap.set('v', '<leader>p', '"_P', { desc = '[p]aste to clipboard' })

-- search the current word under the cursor and puts you in insert mode,
-- then you change the word, press esc, n to find the next instance, . to reapply the change
vim.keymap.set('n', '<leader>cw', function()
    vim.fn.setreg('/', '\\<' .. vim.fn.expand('<cword>') .. '\\>')
    vim.api.nvim_input('"_ciw')
end, { noremap = true, silent = true })
