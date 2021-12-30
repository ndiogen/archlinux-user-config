local buf_set_keymap = function(...) 
    vim.api.nvim_buf_set_keymap(bufnr, ...) 
    vim.api.nvim_set_keymap(...) 
end

local on_attach = function()
    require'completion'.on_attach()
    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gd',    ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gt',    ':lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gD',    ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi',    ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr',    ':lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K',     ':lua vim.lsp.buf.hover()<CR>', opts)

    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end

return { setup = function()
    local lspconfig = require('lspconfig');
    lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index", "--compile-commands-dir=build" },
        on_attach = on_attach
    });
end }
