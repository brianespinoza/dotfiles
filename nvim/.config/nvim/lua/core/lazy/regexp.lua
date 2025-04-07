return {
    "linux-cultist/venv-selector.nvim",
    ft = "py",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    branch = "regexp", -- This is the regexp branch, use this for the new version
    opts = {},
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
    },
}
