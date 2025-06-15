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
        -- "uga-rosa/ccc.nvim"
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
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
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = {"BufReadPre", "BufNewFile"},
    --     main = "ibl",
    --     opts = {
    --         indent = {
    --             char = "|"
    --         },
    --     }
    -- },
}
