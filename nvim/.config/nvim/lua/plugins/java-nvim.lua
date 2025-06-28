-- -- picked this up from https://github.com/s1n7ax/lazyvim-dotnvim/blob/main/lua/plugins/java/init.lua
-- local f = require('utils.file').is_pkg_dir
--
-- return {
--     'nvim-java/nvim-java',
--     enabled = false,
--     -- dir = f('~/Workspace/nvim-java'),
--     config = false,
--     dependencies = {
--         {
--             'JavaHello/spring-boot.nvim',
--             -- commit = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
--         },
--         {
--             'nvim-java/lua-async-await',
--             -- dir = f('~/Workspace/lua-async-await'),
--         },
--         {
--             'nvim-java/nvim-java-core',
--             -- dir = f('~/Workspace/nvim-java-core'),
--         },
--         {
--             'nvim-java/nvim-java-test',
--             -- dir = f('~/Workspace/nvim-java-test'),
--         },
--         {
--             'nvim-java/nvim-java-dap',
--             -- dir = f('~/Workspace/nvim-java-dap'),
--         },
--         {
--             'nvim-java/nvim-java-refactor',
--             -- dir = f('~/Workspace/nvim-java-refactor'),
--         },
--         {
--             "nvim-treesitter/nvim-treesitter",
--             opts = { ensure_installed = { "java" } },
--         },
--         'MunifTanjim/nui.nvim',
--         'mfussenegger/nvim-dap',
--         {
--             'williamboman/mason.nvim',
--             opts = {
--                 registries = {
--                     'github:nvim-java/mason-registry',
--                     'github:mason-org/mason-registry',
--                 },
--             },
--         },
--         {
--             'neovim/nvim-lspconfig',
--             opts = {
--                 servers = {
--                     jdtls = {
--                         handlers = {
--                             ['$/progress'] = function() end,
--                         },
--                         capabilities = vim.lsp.protocol.make_client_capabilities(),
--                     },
--                 },
--                 setup = {
--                     jdtls = function()
--                         require('java').setup({
--                             jdk = {
--                                 auto_install = false,
--                             },
--                             notifications = {
--                                 dap = false,
--                             },
--                         })
--
--                         -- require('lspconfig').jdtls.setup({})
--                         local home = os.getenv("HOME")
--                         require('lspconfig').jdtls.setup({
--                             settings = {
--                                 java = {
--                                     -- autobuild = false,
--                                     -- contentProvider = { preferred = 'fernflower' },
--                                     signatureHelp = { enabled = true },
--                                     eclipse = {
--                                         downloadSources = true,
--                                     },
--                                     maven = {
--                                         downloadSources = true,
--                                     },
--                                     references = {
--                                         includeDecompiledSources = true,
--                                     },
--                                     referencesCodeLens = {
--                                         enabled = true,
--                                     },
--                                     inlayHints = {
--                                         parameterNames = {
--                                             enabled = "all",
--                                         },
--                                     },
--                                     format = {
--                                         settings = {
--                                             url = home .. "rhombus_formatter_eclipse.xml",
--                                             profile = "RhombusFormatter"
--                                         }
--                                     }
--                                 }
--                             }
--                         })
--
--                         -- return true will skip mason-lspconfig from setting up jdtls
--                         return true
--                     end,
--                 },
--             },
--         },
--
--     },
-- }

-- local jdtls = require("jdtls")
-- local home = vim.env.HOME
-- local bundles = vim.fn.glob(
--     home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
--     true, true)

-- local extra_bundles = vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", true,
--     true)
-- vim.list_extend(bundles, extra_bundles)


return {
    {
        "mfussenegger/nvim-jdtls",
        opts = {
            settings = {
                java = {
                    inlayHints = { parameterNames = { enabled = "all" } },
                    format = {
                        enabled = true,
                        settings = {
                            url = vim.fn.expand("~/rhombus_formatter_eclipse.xml"),
                            profile = "RhombusFormatter",
                        },
                    },
                },
            },
        },
        -- config = function()
        --     local jdtls = require("jdtls")
        --
        --     local extendedClientCapabilities = jdtls.extendedClientCapabilities
        --     extendedClientCapabilities.onCompletionItemSelectedCommand = "editor.action.triggerParameterHints"
        --
        --     local on_attach = function(client, bufnr)
        --         vim.lsp.inlay_hint.enable(true)
        --     end
        --
        --     local config = {
        --         on_attach = on_attach,
        --
        --         settings = {
        --             java = {
        --                 inlayHints = { parameterNames = { enabled = "all" } },
        --                 format = {
        --                     enabled = true,
        --                     settings = {
        --                         url = vim.fn.expand("~/rhombus_formatter_eclipse.xml"),
        --                         profile = "RhombusFormatter",
        --                     },
        --                 },
        --             },
        --         },
        --
        --         init_options = {
        --             extendedClientCapabilities = extendedClientCapabilities,
        --         },
        --     }
        --
        --     config.root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" })
        --     config.cmd = { "jdtls" } -- adapt this if your jdtls binary/cmd setup is different
        --     if vim.bo.filetype == "java" then
        --         jdtls.start_or_attach(config)
        --     end
        -- end,
        -- config = function(_, opts)
        --     -- print(vim.inspect(opts));
        --     local jdtls = require("jdtls")
        --     local on_attach = function(client, bufnr)
        --         vim.lsp.inlay_hint.enable(true)
        --     end
        --
        --     local extendedClientCapabilities = jdtls.extendedClientCapabilities
        --     extendedClientCapabilities.onCompletionItemSelectedCommand = "editor.action.triggerParameterHints"
        --
        --     local config = {
        --         on_attach = on_attach,
        --         settings = {
        --             java = {
        --                 inlayHints = { parameterNames = { enabled = "all" } },
        --                 format = {
        --                     enabled = true,
        --                     settings = {
        --                         url = vim.fn.expand("~/rhombus_formatter_eclipse.xml"),
        --                         profile = "RhombusFormatter",
        --                     },
        --                 },
        --             }
        --         },
        --         init_options = {
        --             extendedClientCapabilities = extendedClientCapabilities,
        --         }
        --     }
        --
        --     config.root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" })
        --     config.cmd = { "jdtls" } -- adapt this if your jdtls binary/cmd setup is different
        --     if vim.bo.filetype == "java" then
        --         jdtls.start_or_attach(config)
        --     end
        -- end,
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
                    {
                        junit_jar =
                        '/Users/brianespinoza/.local/share/nvim/neotest-java/junit-platform-console-standalone-1.10.1.jar',
                        incremental_build = true
                    } -- config here
                },
            },
        },
    },

}
-- jdtls.start_or_attach(config)
-- jdtls.setup_dap { hotcodereplace = "auto" }

-- init_options = {
--   bundles = {
--     vim.fn.expand "$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
--     -- unpack remaining bundles
--     (table.unpack or unpack)(vim.split(vim.fn.glob "$MASON/share/java-test/*.jar", "\n", {})),
--   },
-- },
