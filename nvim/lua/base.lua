config_font_size = 8
config_font_type = 'Input Nerd Font'

function config_font()
    vim.opt.guifont = config_font_type .. ':h' .. config_font_size
end

function increase_font_size()
    config_font_size = config_font_size + 1
    config_font()
end

function decrease_font_size()
    config_font_size = config_font_size - 1
    config_font()
end

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

    -- Gui config
    vim.g['neovide_scroll_animation_length'] = 0.15

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

    -- Selection
    vim.keymap.set('n', '<C-Esc>', ":noh<CR>", {})

    -- Register some filetypes
    vim.filetype.add({
        extension = {
            ush = 'hlsl',
            usf = 'hlsl',
            cl = 'glsl'
        }
    })

    --vim.api.nvim_create_autocmd("FileType", {
        --callback = function() vim.opt_local.formatoptions:remove("cro") end,
    --})

    config_font()
    vim.keymap.set('n', '<C-=>', ":lua increase_font_size()<CR>", {})
    vim.keymap.set('n', '<C-->', ":lua decrease_font_size()<CR>", {})
end
}
