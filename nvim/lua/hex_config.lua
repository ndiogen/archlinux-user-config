return { setup = function()
    local hex = require('hex');

    hex.setup({
        -- cli command used to dump hex data
        dump_cmd = 'xxd -g 1 -u',

        -- cli command used to assemble from hex data
        assemble_cmd = 'xxd -r',
    })
end }
