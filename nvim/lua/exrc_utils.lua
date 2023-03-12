local overseer = require('overseer')
local telescope_config = require("telescope_config")

local telescope_menu = {items={}}

local register_global_task_template = function(name, hotkey, parameters)
    overseer.register_template({
        name = name,
        condition = {
            dir = vim.fn.getcwd(),
        },
        builder = function()
            return vim.tbl_deep_extend('force', {name = name}, parameters)
        end,
    })

    local run_callback = function() 
        overseer.run_template(
            {name = name},
            function(task) 
                if hotkey ~= nil then
                    local hotkey_open = '<C-' .. hotkey .. '>'
                    vim.api.nvim_set_keymap('n', hotkey_open, '', {callback = function() overseer.run_action(task, 'open float') end})
                end
            end
        ) 
    end


    if hotkey ~= nil then
        local hotkey_run = '<' .. hotkey .. '>'
        vim.api.nvim_set_keymap('n', hotkey_run, '', {callback = run_callback})
    end

    local telescope_menu_entity = {name, run_callback}
    table.insert(telescope_menu.items, telescope_menu_entity)
    telescope_config.setup(telescope_menu)
end

return {
    register_global_task_template = register_global_task_template
}
