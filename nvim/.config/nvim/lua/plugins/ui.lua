return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                integrations = {
                    notify = true,
                    flash = true,
                    gitsigns = true,
                    noice = true,
                },
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    },
    {
        "aeraglyx/onyx.nvim",
        dev = true,
        config = function()
            local reload_onyx = function()
                vim.cmd("Lazy reload onyx.nvim")
                local notify_orig = vim.notify
                vim.notify = function(...) end
                vim.cmd("Lazy reload lualine.nvim")
                vim.cmd("Lazy reload todo-comments.nvim")
                vim.cmd("Lazy reload indent-blankline.nvim")
                vim.cmd("Lazy reload nvim-notify")
                vim.notify = notify_orig
            end
            vim.keymap.set("n", "<leader>th", reload_onyx, { desc = "Reload [TH]eme" })
            require("onyx").setup()
        end
    },
    {
        -- "uga-rosa/ccc.nvim"
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = require("onyx.lualine")
                },
            })
        end
    },
    {
        "rcarriga/nvim-notify",
        opts = { background_colour = "#000000" },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            presets = { lsp_doc_border = true },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = {"BufReadPre", "BufNewFile"},
        main = "ibl",
        opts = {
            indent = { char = "|" },
            scope = { enabled = false },
        }
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 120, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- options = {
                -- },
            },
        }
    },
}
