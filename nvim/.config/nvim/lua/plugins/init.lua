return {
    {
        "lewis6991/gitsigns.nvim",
        -- TODO: keymaps
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "mm",
            },
            opleader = {
                line = "m",
            }
        }
    },
    {
        "nguyenvukhang/nvim-toggler",
        config = function()
            require("nvim-toggler").setup({
                remove_default_keybinds = true,
            })
            vim.keymap.set({"n", "v"}, "<leader>te", require("nvim-toggler").toggle, { desc = "Toggle text" })
        end
    },
}
