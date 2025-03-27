return {
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- 'onsails/lspkind.nvim',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            -- 'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                sources = {
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'nvim_lsp_signature_help' },
                }
            })
        end,
    }
}
