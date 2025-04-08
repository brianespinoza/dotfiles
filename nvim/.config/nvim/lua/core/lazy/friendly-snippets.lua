return {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({ include = { "python", "java", "javascript", "typescript", "toml", "html" } })
    end,
}
