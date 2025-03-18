local on_attach = function()
    -- Mappings.
    local opts = { noremap=false, silent=true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=true })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer=true })
end

return { setup = function()
    local cmp = require('cmp')
    local copilot_cmp = require("copilot_cmp")
    local lspconfig = require('lspconfig')

    copilot_cmp.setup()

    lspconfig.pylsp.setup{}
    lspconfig.ts_ls.setup{}

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.snippet.expand(args.body)
            end,
        },
    window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources(
        {
            { name = "copilot" },
            { name = 'nvim_lsp' },
        }, 
        {
            { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.clangd.setup{ capabilities = capabilities, on_attach = on_attach }
    lspconfig.pylsp.setup{ capabilities = capabilities, on_attach = on_attach  }
    lspconfig.ts_ls.setup{ capabilities = capabilities, on_attach = on_attach }
end }
