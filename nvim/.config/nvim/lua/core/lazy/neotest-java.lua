return {
    {
        "rcasia/neotest-java",
        ft = "java",
        dependencies = {
            "mfussenegger/nvim-jdtls",
            "mfussenegger/nvim-dap", -- for the debugger
            "rcarriga/nvim-dap-ui", -- recommended
            "theHamsta/nvim-dap-virtual-text", -- recommended
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            adapters = {
                ["neotest-java"] = {
                },
            },
        },
        keys = {
            { "<leader>tn", function() require("neotest").run.run() end, desc = "[T]est [N]earest" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "[T]est [F]ile" },
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "[T]est [D]ebug" },
            { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "[T]est [O]utput" },
        }
    },
}
