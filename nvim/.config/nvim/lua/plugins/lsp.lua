return {
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "saghen/blink.cmp",
            "hrsh7th/cmp-nvim-lsp",
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

            local nixd_opts = {
                cmd = { "nixd" },
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import <nixpkgs> {}",
                        },
                        -- formatting = {
                        --     command = { "alejandra" },
                        -- },
                    }
                }
            }

            local basedpyright_opts = {
                settings = {
                    basedpyright = {
                        typeCheckingMode = "standard",  -- standard or off
                        -- logLevel = "error",
                    },
                }
            }

            require('lspconfig.ui.windows').default_options.border = "rounded"

            -- lspconfig.pyright.setup({})
            -- lspconfig.nil_ls.setup({})
            lspconfig.lua_ls.setup(lua_ls_opts)
            lspconfig.clangd.setup({})
            lspconfig.basedpyright.setup(basedpyright_opts)
            lspconfig.nixd.setup(nixd_opts)

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
                    map("<leader>re", vim.lsp.buf.rename, "[RE]name")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("K", vim.lsp.buf.hover, "TODO")
                    map("<leader>rs", ":LspRestart<CR>", "[R]e[S]tart LSP server")
                end
            })
        end
    }
}
