return {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    opts = {},
    config = function()
        require'marks'.setup {
            mappings = {
                set_next = "m,",
                next = "m]",
                preview = "m:",
                set_bookmark0 = "m0",
                prev = false -- pass false to disable only this default mapping
                -- to delete you do dm{mark char}
            }
        }
    end,
}
