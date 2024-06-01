return { setup = function()
    local zen = require('zen-mode')

    local config = {
        window = {
            width = 200,
        },
    }

    vim.keymap.set('n', 'Z', function() zen.toggle( config ) end)
end }
