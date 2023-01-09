return { setup = function()
    local nvimtree = require('nvim-tree')

    nvimtree.setup({
        renderer = {
            group_empty = false
        }
    });

    vim.keymap.set('', '<C-n>', function() nvimtree.toggle(false) end, {})
    vim.keymap.set('', '<C-N>', function() nvimtree.toggle(true) end, {})
end }
