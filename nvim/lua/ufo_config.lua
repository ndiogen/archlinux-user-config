return { setup = function()
    local ufo = require('ufo')

    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set('n', 'zJ', ufo.openAllFolds)
    vim.keymap.set('n', 'zK', ufo.closeAllFolds)
    vim.keymap.set('n', 'zj', ufo.openFoldsExceptKinds)
    vim.keymap.set('n', 'zk', ufo.closeFoldsWith)

    -- ufo.setup()
end }
