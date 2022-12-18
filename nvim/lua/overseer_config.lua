return { setup = function()
    local overseer = require('overseer');
    overseer.setup();

    vim.keymap.set('n', '<C-Tab>', overseer.toggle,  bufopts)
end }
