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
    set_option( 'o', 'laststatus', 0 )
    set_option( 'o', 'ruler', false )

    set_option( 'o', 'exrc', false )

    vim.g['clang_format#detect_style_file'] = 1

    -- Vim shortcuts
    vim.keymap.set('v', '/', [["-y/<C-R>-]],  {})

    -- Vim qlist
    vim.keymap.set('n', '<C-j>', ":cnext<CR>",   {})
    vim.keymap.set('n', '<C-k>', ":cprev<CR>",   {})

    -- Buffers managment
    vim.keymap.set('n', '<C-b>j', ":bnext<CR>",   {})
    vim.keymap.set('n', '<C-b>k', ":bprev<CR>",   {})
    vim.keymap.set('n', '<C-b>c', ":bdelete<CR>", {})

    -- Terminal managment
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {})
end
}
