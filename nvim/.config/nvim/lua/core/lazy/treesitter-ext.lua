return {
    {
        "nvim-treesitter/playground",
        event = { "BufReadPost", "BufNewFile" }, -- Load only when opening a file
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" }, -- Load only when opening a file
    },
}
