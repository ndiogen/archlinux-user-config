return { setup = function()
    vim.notify = require('notify')

    vim.notify.setup({
        fps = 120,
        top_down = false,
        stages = "slide",
        timeout = 3000,
    })
end }
