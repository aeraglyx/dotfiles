return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local parsers = {
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
                "rust",
                "julia",
                "css",
                "html",
            }
            require("nvim-treesitter").install(parsers)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = parsers,
                callback = function(args)
                    vim.treesitter.start(args.buf)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    }
}
