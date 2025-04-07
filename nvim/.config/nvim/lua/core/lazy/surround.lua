return { 'echasnovski/mini.nvim', version = false,
    config = function()
        require('mini.surround').setup()
    end
    -- keys = {
    -- sa = surround add
    -- sd = surround delete
    -- sr = surround replace
    -- sf = surround find
    -- sh = surround highlight
    -- }
}
