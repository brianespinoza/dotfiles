return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", cmd = { "Mason", "MasonInstall", "MasonUpdate" } },  -- Load Mason on command
        { "williamboman/mason-lspconfig.nvim", },
        {"jay-babu/mason-nvim-dap.nvim" },
        { "hrsh7th/nvim-cmp", event = "InsertEnter" },  -- Load CMP when entering insert mode
        { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter"},
        { "hrsh7th/cmp-buffer", event = "InsertEnter"},
        { "hrsh7th/cmp-path", event = "InsertEnter"},
        { "hrsh7th/cmp-cmdline", event = "InsertEnter"},
        { "hrsh7th/cmp-nvim-lua", ft = "lua"},
        { "l3mon4d3/luasnip", ft = "lua" },  -- Load only in Insert mode
        { "saadparwaiz1/cmp_luasnip", ft = "lua"},
        { "mrcjkb/rustaceanvim", ft = "rust" },  -- Load Rust LSP only for Rust files
    },
    event = { "InsertEnter" },  -- Load LSP only when opening files
    config = function()
        -- Lazy-load Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "tailwindcss",
                "ts_ls", -- TypeScript
                "basedpyright",
                "jsonls",
                "html",
                "cssls",
                "lua_ls",
            },
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local lspconfig = require("lspconfig")
                    local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
                    lspconfig.basedpyright.setup {
                        capabilities = default_capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    autoSearchPaths = true,
                                    diagnosticMode = "workspace",
                                    useLibraryCodeForTypes = true,
                                },
                            },
                        }
                    }

                    local settings = {}

                    lspconfig[server_name].setup {
                        -- capabilities = default_capabilities,
                        -- settings = settings
                    }
                end,
            },
        })
        require("mason-nvim-dap").setup({
            ensure_installed = { "java-debug-adapter", "java-test" },
        })

        -- Configure LSP keybindings
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.supports_method("textDocument/completion") then
                    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
                end
                if client and client.supports_method("textDocument/definition") then
                    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
                end
            end,
        })

        -- Lazy-load CMP in Insert mode
        vim.api.nvim_create_autocmd("InsertEnter", {
            once = true,
            callback = function()
                local cmp = require("cmp")
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-p>'] = cmp.mapping.select_prev_item(),
                        ['<C-n>'] = cmp.mapping.select_next_item(),
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = 'luasnip' },
                    }, {
                            { name = 'buffer' },
                        })
                })
            end
        })

        -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
        -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
        vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
        -- Set vim motion for <Space> + c + r to display references to the code under the cursor
        vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
        -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
        vim.keymap.set("n", "<leader>gi", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
        -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
        vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
        -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

    end
}
