return { 
configure = function() 
    local function set_option(scope, key, value)
        local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
        scopes[scope][key] = value
        scopes['o'][key] = value
    end

    indent_size = 4;

    set_option( 'w', 'number', true )

    set_option( 'b', 'expandtab', true )
    set_option( 'b', 'tabstop', indent_size )
    set_option( 'b', 'shiftwidth', indent_size )


    set_option( 'o', 'completeopt', 'menuone,noinsert,noselect' )


    vim.g['clang_format#detect_style_file'] = 1

    -- Vim shortcuts
    vim.api.nvim_set_keymap('v', '/', [["-y/<C-R>-]],  {})

    -- Vim autocomplete
    vim.api.nvim_set_keymap('i', '<C-Space>', "<Plug>(completion_trigger)",  {})

    -- Vim qlist
    vim.api.nvim_set_keymap('n', '<C-j>', ":cnext<CR>",   {})
    vim.api.nvim_set_keymap('n', '<C-k>', ":cprev<CR>",   {})

    -- Buffers managment
    vim.api.nvim_set_keymap('n', '<C-b>j', ":bnext<CR>",   {})
    vim.api.nvim_set_keymap('n', '<C-b>k', ":bprev<CR>",   {})
    vim.api.nvim_set_keymap('n', '<C-b>c', ":bdelete<CR>", {})
end
}
