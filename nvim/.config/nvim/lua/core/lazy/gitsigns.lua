-- git gutter (git in the left-most side of screen)
--{ "airblade/vim-gitgutter" },
return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function(_, opts)
            vim.cmd("set statusline+=%{get(b:,'gitsigns_status','')}");
            local gs = require("gitsigns")
            gs.setup(opts)
        end,
    }
}
