local overseer = require('overseer')

local run_overseer_task = function(task)
    if task:is_pending() then
        overseer.run_action(task, 'start')
    else
        overseer.run_action(task, 'restart')
    end
end

local open_overseer_task = function(task)
    if not task:is_pending() then
        overseer.run_action(task, 'open float')
    end
end

local setup_project_menu = function(menu)
    local telescope_menu = {items={}}

    for i=1, #menu do
        local task = menu[i][1]
        local base_hotkey = menu[i][2]

        task.name = task.name .. " <" .. base_hotkey .. ">";

        local hotkey_run = '<' .. base_hotkey .. '>'
        local hotkey_open = '<C-' .. base_hotkey .. '>'
        local telescope_menu_entity = {task.name, function() run_overseer_task(task) end}

        vim.api.nvim_set_keymap('n', hotkey_run, '', {callback = function() run_overseer_task(task) end})
        vim.api.nvim_set_keymap('n', hotkey_open, '', {callback = function() open_overseer_task(task) end})
        table.insert(telescope_menu.items, telescope_menu_entity)
    end

    require("telescope_config").setup(telescope_menu)
end

return {
    setup_project_task_menu = setup_project_menu
}
