local coq = require 'coq'

local on_attach = function()
    -- Mappings.
    local opts = { noremap=true, silent=true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=true })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer=true })
end

return { setup = function()
    local lspconfig = require('lspconfig');
    lspconfig.clangd.setup(coq.lsp_ensure_capabilities{
        cmd = { "clangd", "--background-index", "--compile-commands-dir=build" },
        on_attach = on_attach
    });
end }
