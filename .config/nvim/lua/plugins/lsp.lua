-- configure LSP
local plugins = {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- LSP Support
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',

        -- snippets engine
        'L3MON4D3/LuaSnip',

        -- snippets collection
        'rafamadriz/friendly-snippets',

        -- complements
        'onsails/lspkind-nvim', -- add the nice source + completion item kind to the menu
    },
    init = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- auto install LSP
        require('mason-lspconfig').setup({
            ensure_installed = {
                'pyright',
                'html',
                'cssls',
                'lua_ls',
                'bashls',
                'ansiblels',
            },
        })

        -- configure language servers
        -- require('lspconfig').ansiblels.setup({})
        -- require('lspconfig').bashls.setup({})
        -- require('lspconfig').cssls.setup({})
        -- require('lspconfig').html.setup({})
        -- require('lspconfig').lua_ls.setup({})
        -- require('lspconfig').pyright.setup({})


        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local lspconfig = require('lspconfig')
        local get_servers = require('mason-lspconfig').get_installed_servers

        for _, server_name in ipairs(get_servers()) do
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end

    end,
}

return plugins
