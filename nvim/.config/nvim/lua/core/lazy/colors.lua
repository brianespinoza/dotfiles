-- colors.lua

function SetColor(color)
    if color == nil then
        color = "kanagawa-wave" -- have a default value
    end
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "rebelot/kanagawa.nvim",
        opts = function()
            SetColor("kanagawa-wave")
        end,
        event = "UIEnter"

    }
}
