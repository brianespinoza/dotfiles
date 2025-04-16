return {
    "mfussenegger/nvim-jdtls",
    ft = { "python", "java", "go" }, -- add your own
    event = "UIEnter",
    dependencies = {
        "mfussenegger/nvim-dap"
    },
}
