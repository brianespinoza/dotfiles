local function setup_dap()
    -- gain access to the dap plugin and its functions
    local dap = require("dap")
    -- gain access to the dap ui plugin and its functions
    local dapui = require("dapui")

    -- Setup the dap ui with default configuration
    dapui.setup()

    -- setup an event listener for when the debugger is launched
    dap.listeners.before.launch.dapui_config = function()
        -- when the debugger is launched open up the debug ui
        dapui.open()
    end
    return {}
end

return {
    "mfussenegger/nvim-dap",
    event = "BufReadPre",
    dependencies = {
        -- ui plugins to make debugging simplier
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = setup_dap,
    keys = {
        { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "[D]ebug [T]oggle Breakpoint" },
        { "<leader>ds", function() require("dap").continue() end, desc = "[D]ebug [S]tart" },
        { "<leader>dc", function() require("dapui").close() end, desc = "[D]ebug [C]lose" },
        { "<leader>dS", function() require("dap").step_over() end, desc = "[D]ebug [S]tep Over" },
        { "<leader>dB", function() require("dap").step_into() end, desc = "[D]ebug [S]tep Into" },
        { "<leader>dO", function() require("dap").step_out() end, desc = "[D]ebug [S]tep Out" },
    }

}
