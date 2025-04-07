return {
    "ibhagwan/fzf-lua",
    event = "UIEnter",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
        -- "fzf-native" -- uses bat for syntax highlighting
        -- "telescope",
        "default-title",
        -- "default-title",
        -- "ivy", -- pretty cool. opens a window at the bottom of the screen
        --- default keymaps
        keymap = {
            -- Below are the default binds, setting any value in these tables will override
            -- the defaults, to inherit from the defaults change [1] from `false` to `true`

            builtin = {
                -- neovim `:tmap` mappings for the fzf win
                -- true,        -- uncomment to inherit all the below in your custom config
                [ "<c-f>" ]= "preview-page-down",
                [ "<c-b>" ]= "preview-page-up",
                ["<M-Esc>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
                ["<F1>"]        = "toggle-help",
                ["<F2>"]        = "toggle-fullscreen",
                -- Only valid with the 'builtin' previewer
                ["<F3>"]        = "toggle-preview-wrap",
                ["<F4>"]        = "toggle-preview",
                -- Rotate preview clockwise/counter-clockwise
                ["<F5>"]        = "toggle-preview-ccw",
                ["<F6>"]        = "toggle-preview-cw",
                -- `ts-ctx` binds require `nvim-treesitter-context`
                ["<F7>"]        = "toggle-preview-ts-ctx",
                ["<F8>"]        = "preview-ts-ctx-dec",
                ["<F9>"]        = "preview-ts-ctx-inc",
                ["<S-Left>"]    = "preview-reset",
                ["<S-down>"]    = "preview-page-down",
                ["<S-up>"]      = "preview-page-up",
                ["<M-S-down>"]  = "preview-down",
                ["<M-S-up>"]    = "preview-up",
            },
            fzf = {
                -- fzf '--bind=' options
                -- true,        -- uncomment to inherit all the below in your custom config
                ["ctrl-f"]      = "preview-page-down",
                ["ctrl-b"]      = "preview-page-up",
                ["ctrl-z"]      = "abort",
                ["ctrl-x"]      = "jump",
                ["ctrl-u"]      = "half-page-up",
                ["ctrl-q"]      = "select-all+accept",
                ["ctrl-d"]      = "half-page-down",
                ["ctrl-e"]      = "end-of-line",
                ["alt-a"]       = "toggle-all",
                ["alt-g"]       = "first",
                ["alt-G"]       = "last",
                -- Only valid with fzf previewers (bat/cat/git/etc)
                ["f3"]          = "toggle-preview-wrap",
                ["f4"]          = "toggle-preview",
                ["shift-down"]  = "preview-page-down",
                ["shift-up"]    = "preview-page-up",
            },
        },
        actions = {
            -- Below are the default actions, setting any value in these tables will override
            -- the defaults, to inherit from the defaults change [1] from `false` to `true`
            files = {
                -- true,        -- uncomment to inherit all the below in your custom config
                -- Pickers inheriting these actions:
                --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
                --   tags, btags, args, buffers, tabs, lines, blines
                -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
                -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
                -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
                -- ["enter"]       = require("fzf-lua").actions.file_edit_or_qf,
                -- ["ctrl-s"]      = require("fzf-lua").actions.file_vsplit,
                -- ["ctrl-t"]      = require("fzf-lua").actions.file_tabedit,
                -- ["ctrl-q"]       = require("fzf-lua").actions.file_sel_to_qf,
                -- ["H"]       = require("fzf-lua").actions.toggle_hidden,
            },
        }
    },
    keys = {
        -- defaults
        -- LSP Pickers
        { "gd", "<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>", desc = "Goto Definition" },
        { "gr", "<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>", desc = "References", nowait = true },
        { "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
        { "gy", "<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },

        -- File Pickers
        { "<leader>pf", "<cmd>FzfLua files<cr>", desc = "[p]roject [f]iles" },
        { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "[f]ind [f]iles" },
        { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "[f]ind [w]ord" },
        { "<leader>sd", function()
            require("fzf-lua").live_grep({
                cwd = "~/.config/nvim/",
                prompt_title = "< .dotfiles >",
            })
        end,
            desc = "search dotfiles"
        },
        -- VIM PICKERS
        { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "[f]ind [b]uffers" },
        { "<leader>fr", "<cmd>FzfLua registers<cr>", desc = "[f]ind [r]egisters" },
        { "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "[f]ind [c]olorscheme" },

    },
    config = function()
        local fzf = require("fzf-lua")
        local actions = fzf.actions

        fzf.setup({
            actions = {
                -- 👇 YOUR CUSTOM OVERRIDES
                files = {
                    -- true,        -- uncomment to inherit all the below in your custom config
                    -- Pickers inheriting these actions:
                    --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
                    --   tags, btags, args, buffers, tabs, lines, blines
                    -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
                    -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
                    -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
                    ["enter"]   = actions.file_edit, -- ⬅️ opens file directly (single or multiple)
                    ["ctrl-s"]  = actions.file_vsplit,
                    ["ctrl-q"]  = actions.file_sel_to_qf,
                    ["ctrl-t"]       = actions.toggle_hidden,
                },
            },
        })
    end,

}
