return {
    "supermaven-inc/supermaven-nvim",
    event = "LspAttach",
    opts = {
        disable_inline_completion = false, -- enables inline completion for use with cmp
        keymaps = {
            accept_suggestion = "<C-l>", -- accept suggestion with <C-l> to move forward
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
        },
        disable_keymaps = false,
        ignore_filetypes = { cpp = true, env = true },
        color = {
            suggestion_color = "#ffffff",
            cterm = 244,
        },
    }
}
