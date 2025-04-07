--print("hello from lua/init.lua!")

require("core.options")
require("core.mappings")

if not vim.g.lazy_initialized then
    vim.g.lazy_initialized = true
    require("core.lazy_init")
end


vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable automatic comment insertion",
    group = vim.api.nvim_create_augroup("AutoComment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function(event)
        local title = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        if event.file ~= "" then
            title = string.format("vim: %s", vim.fs.basename(event.file))
        end

        vim.fn.system({ "wezterm", "cli", "set-tab-title", title })
    end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
    callback = function()
        -- Setting title to empty string causes wezterm to revert to its
        -- default behavior of setting the tab title automatically
        vim.fn.system({ "wezterm", "cli", "set-tab-title", vim.fn.fnamemodify(vim.fn.getcwd(), ":t") })
    end,
})
