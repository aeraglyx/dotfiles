return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
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
    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "CC",
            },
            opleader = {
                line = "C",
            }
        }
    },
    {
        -- TODO: keymaps
        "lewis6991/gitsigns.nvim",
        opts = {}
    },
}
