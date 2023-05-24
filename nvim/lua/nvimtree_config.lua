return { setup = function()
    local nvimtree = require('nvim-tree')
    local nvimtreeapi = require('nvim-tree.api')

    nvimtree.setup({
        view = {
            float = {
                enable = false,
            },
        },
        renderer = {
            group_empty = false
        }
    });

    vim.keymap.set('', '<C-n>', function() nvimtreeapi.tree.toggle(false) end, {})
    vim.keymap.set('', '<C-N>', function() nvimtreeapi.tree.toggle(true) end, {})
end }
