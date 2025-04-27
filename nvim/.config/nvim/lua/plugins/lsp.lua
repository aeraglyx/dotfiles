return {
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            -- { "williamboman/mason.nvim", opts = {} },
            -- "williamboman/mason-lspconfig.nvim",
            -- "WhoIsSethDaniel/mason-tool-installer.nvim",
            "hrsh7th/cmp-nvim-lsp",
            -- { "antosha417/nvim-lsp-file-operations", config = true },
            -- { "folke/neodev.nvim", opts = {} },
            -- "nvim-telescope/telescope.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            local lua_ls_opts = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        }
                    }
                }
            }

            lspconfig.lua_ls.setup(lua_ls_opts)
            lspconfig.clangd.setup({})
            lspconfig.pyright.setup({})
            lspconfig.nil_ls.setup({})

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("attach-lsp-group", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("K", vim.lsp.buf.hover, "TODO")
                    map("<leader>rs", ":LspRestart<CR>", "[R]e[S]tart LSP server")
                end
            })
        end
    }


    --[[
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            mason.setup({})
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                },
                automatic_installation = true,
            })
            mason_tool_installer.setup({})
        end
    },
    --]]
    -- {
    --     "neovim/nvim-lspconfig",
    --     -- event = {"BufReadPre", "BufNewFile"},
    --     dependencies = {
    --         { "williamboman/mason.nvim", opts = {} },
    --         "williamboman/mason-lspconfig.nvim",
    --         -- "WhoIsSethDaniel/mason-tool-installer.nvim",
    --         "hrsh7th/cmp-nvim-lsp",
    --         -- { "antosha417/nvim-lsp-file-operations", config = true },
    --         -- { "folke/neodev.nvim", opts = {} },
    --         -- "nvim-telescope/telescope.nvim",
    --     },
    --     config = function()
    --         local mason = require("mason")
    --         local mason_lspconfig = require("mason-lspconfig")
    --         local lspconfig = require("lspconfig")
    --
    --         mason.setup({})
    --         mason_lspconfig.setup({
    --             ensure_installed = {
    --                 "lua_ls",
    --                 "clangd",
    --                 "pyright",
    --             },
    --             automatic_installation = true,
    --             handlers = {
    --                 function(server_name)
    --                     -- local server = servers[server_name] or {}
    --                     -- server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
    --                     lspconfig[server_name].setup({})
    --                 end,
    --                 ["lua_ls"] = function()
    --                     lspconfig.lua_ls.setup({
    --                         -- capabilities = capabilities,
    --                         settings = {
    --                             Lua = {
    --                                 diagnostics = {
    --                                     globals = { "vim" },
    --                                 }
    --                             }
    --                         }
    --                     })
    --                 end,
    --             }
    --         })
    --
    --         vim.api.nvim_create_autocmd("LspAttach", {
    --             group = vim.api.nvim_create_augroup("attach-lsp-group", { clear = true }),
    --             callback = function(event)
    --                 local map = function(keys, func, desc, mode)
    --                     mode = mode or "n"
    --                     vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    --                 end
    --
    --                 map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    --                 map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    --                 map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    --                 map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    --                 map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    --                 map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    --                 map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    --                 map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
    --                 map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    --                 map("K", vim.lsp.buf.hover, "TODO")
    --                 map("<leader>rs", ":LspRestart<CR>", "[R]e[S]tart LSP server")
    --             end
    --         })
    --     end
    --
    --
    --
    --
    --     --[[
    --     config = function()
    --         local lspconfig = require("lspconfig")
    --         local mason_lspconfig = require("mason-lspconfig")
    --         -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
    --
    --         vim.api.nvim_create_autocmd("LspAttach", {
    --             group = vim.api.nvim_create_augroup("attach-lsp-group", { clear = true }),
    --             callback = function(event)
    --
    --                 local map = function(keys, func, desc, mode)
    --                     mode = mode or "n"
    --                     vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    --                 end
    --
    --                 map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    --                 map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    --                 map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    --                 map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    --                 map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    --                 map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    --                 map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    --                 map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
    --                 map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    --                 map("K", vim.lsp.buf.hover, "TODO")
    --                 map("<leader>rs", ":LspRestart<CR>", "[R]e[S]tart LSP server")
    --             end
    --         })
    --
    --
    --
    --
    --         local servers = {
    --             clangd = {},
    --             -- stylua = {},
    --             lua_ls = {
    --                 -- capabilities = capabilities,
    --                 settings = {
    --                     Lua = {
    --                         diagnostics = {
    --                             globals = {
    --                                 "vim",
    --                             },
    --                         }
    --                     }
    --                 }
    --             }
    --         }
    --
    --         local capabilities = vim.lsp.protocol.make_client_capabilities()
    --         capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    --
    --         local ensure_installed = vim.tbl_keys(servers or {})
    --         vim.list_extend(ensure_installed, {
    --             "stylua", -- Used to format Lua code
    --         })
    --         require("mason-tool-installer").setup { ensure_installed = ensure_installed }
    --
    --         mason_lspconfig.setup({
    --             ensure_installed = {},
    --             automatic_installation = false,
    --             handlers = {
    --                 function(server_name)
    --                     local server = servers[server_name] or {}
    --                     server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
    --                     lspconfig[server_name].setup(server)
    --                 end,
    --             }
    --         })
    --
    --
    --
    --
    --
    --         -- local capabilities = cmp_nvim_lsp.default_capabilities()
    --
    --         --[[
    --         mason_lspconfig.setup_handlers({
    --
    --             function(server_name)
    --                 lspconfig[server_name].setup({
    --                     capabilities = capabilities,
    --                 })
    --             end,
    --
    --             ["lua_ls"] = function()
    --                 lspconfig["lua_ls"].setup({
    --                     capabilities = capabilities,
    --                     settings = {
    --                         Lua = {
    --                             diagnostics = {
    --                                 globals = {
    --                                     "vim",
    --                                 },
    --                             }
    --                         }
    --                     }
    --                 })
    --             end,
    --
    --         })
    --     end
    -- --]]
    -- },
}
