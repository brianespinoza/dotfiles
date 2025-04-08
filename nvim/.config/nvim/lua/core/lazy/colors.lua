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
        -- opts = function()
        --     SetColor("kanagawa-wave")
        -- end,
        opts = {
            transparent=true,
            overrides=function(colors)
                return {
                    ["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
                    ["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
                    ["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
                    ["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
                    ["@markup.list.markdown"] = { link = "Function" }, -- + list
                    ["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
                    ["@markup.list.checked.markdown"] = { link = "WarningMsg" } -- - [X] checked list item
                }
            end
        },
        event = "UIEnter",
        config = function()
            SetColor("kanagawa-wave")
        end,

    }
}
