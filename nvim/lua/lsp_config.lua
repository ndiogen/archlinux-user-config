local on_attach = function()
    -- Mappings.
    local opts = { noremap=true, silent=true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=true })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer=true })
end

return { setup = function()
    local coq = require 'coq'
    local lspconfig = require('lspconfig');

    lspconfig.clangd.setup(coq.lsp_ensure_capabilities{
        cmd = { "clangd", "--background-index" },
        on_attach = on_attach
    });

    lspconfig.pylsp.setup{}
    lspconfig.ts_ls.setup{}

    coq.Now('--shut-up')
end }
