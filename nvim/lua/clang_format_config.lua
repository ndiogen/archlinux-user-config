local buf_set_keymap = function(...) 
    vim.api.nvim_buf_set_keymap(bufnr, ...) 
end

return { setup = function()
    local opts = { noremap=true, silent=true }

    buf_set_keymap('v', '<Leader>f',    ':ClangFormat<CR>', opts)

    buf_set_keymap('n', '<Leader>F',    ':ClangFormatAutoToogle<CR>', opts)
end }
