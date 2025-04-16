local function setup_dap()
    -- gain access to the dap plugin and its functions
    local dap = require("dap")
    -- gain access to the dap ui plugin and its functions
    local dapui = require("dapui")

    -- Setup the dap ui with default configuration
    dapui.setup()

    -- auto open/close UI
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    return {}
end

return {
    "mfussenegger/nvim-dap",
    event = "UIEnter",
    dependencies = {
        -- ui plugins to make debugging simplier
        { "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup()
                vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "[D]ebug [U]I Toggle" })
            end,
        },
        "nvim-neotest/nvim-nio",
        {
            "jay-babu/mason-nvim-dap.nvim" ,
            opts = {
                ensure_installed = { "debugpy", "java-debug-adapter" },
            }
        }
    },
    config = setup_dap,
    keys = {
        { "<F5>", require("dap").continue, desc = "[D]ebug [C]ontinue" },
        { "<F10>", require("dap").step_over, desc = "[D]ebug [S]tep Over" },
        { "<F11>", require("dap").step_into, desc = "[D]ebug [S]tep Into" },
        { "<F12>", require("dap").step_out, desc = "[D]ebug [S]tep Out" },
        { "<Leader>b", require("dap").toggle_breakpoint, desc = "[D]ebug [T]oggle Breakpoint" },
        { "<Leader>B", function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, desc = "[D]ebug [S]et Breakpoint" },
    },
}
