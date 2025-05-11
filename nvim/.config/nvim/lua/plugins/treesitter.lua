return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = {"BufReadPre", "BufNewFile"},
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "gitignore",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "query",
                "vim",
                "vimdoc",
                "python",
                "json",
                "toml",
                "yaml",
                "nix",
                "hyprlang",
                "rasi",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        }
    }
}
