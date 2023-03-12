return { setup = function()
    local overseer = require('overseer');
    overseer.setup();

    vim.keymap.set('n', '<C-b>', overseer.toggle,  bufopts)
end }
