return {
    "mrjones2014/smart-splits.nvim",
    event = "UIEnter",
    opts = {},
    keys = function()
        -- recommended mappings
        -- resizing splits
        -- these keymaps will also accept a range,
        -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
        vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
        vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
        vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
        vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
        -- moving between splits
        vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
        vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
        vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
        vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
        vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    end,
}
