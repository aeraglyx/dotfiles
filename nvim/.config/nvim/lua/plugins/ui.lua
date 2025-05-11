return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
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
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        event = {"BufReadPre", "BufNewFile"},
        main = "ibl",
        opts = {
            indent = {
                char = "|"
            },
        }
    },
}
