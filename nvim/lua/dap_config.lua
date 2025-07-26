local telescope_find_executable_callback = function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    return coroutine.create(function(coro)
        local opts = {}
        pickers.new(opts, {
                prompt_title = "Path to executable",
                finder = finders.new_oneshot_job({ "fd", "-E", "*CMakeFiles*", "--type", "x", ".", "./build/" }, {}),
                sorter = conf.generic_sorter(opts),
                attach_mappings = function(buffer_number)
                    actions.select_default:replace(function()
                    actions.close(buffer_number)
                    coroutine.resume(coro, action_state.get_selected_entry()[1])
                    end)
                return true
                end,
          }):find()
    end)
end

return { setup = function()
    local dap = require("dap");
    local dapui = require("dapui");

    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            command = '/usr/bin/codelldb',
            args = {"--port", "${port}"},
        }
    }
    dap.adapters.codelldbtest = {
      type = 'server',
      host = '127.0.0.1',
      port = 13000 -- 💀 Use the port printed out or specified with `--port`
    }

    dap.adapters.gdb = {
        type = "executable",
        command = "arm-none-eabi-gdb",
        args = { "-i", "dap" }
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "gdb",
            request = "attach",
            target = 'localhost:4500',
            program = telescope_find_executable_callback,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            runInTerminal = false
        }
    }

    dapui.setup({
        layouts = { {
            elements = { 
                { id = "breakpoints", size = 0.25 }, 
                { id = "scopes", size = 0.25 },
                { id = "stacks", size = 0.5 } 
            },
            position = "left",
            size = 40
          }, {
            elements = { 
                { id = "watches", size = 0.5 },
                { id = "console", size = 0.5 } 
            },
            position = "bottom",
            size = 10
          } 
      },
      render = {
          max_type_length = 25
      },
    })

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end

    vim.keymap.set('n', '<F5>',    function() dap.continue()  end, {})
    vim.keymap.set('n', '<C-F5>',  function() dap.run_tp_cursor()  end, {})
    vim.keymap.set('n', '<F10>',   function() dap.step_over() end, {})
    vim.keymap.set('n', '<F11>',   function() dap.step_into() end, {})
    vim.keymap.set('n', '<F12>',   function() dap.step_out()  end, {})
    vim.keymap.set('n', '<C-S-t>',   function() dap.terminate()  end, {})

    vim.keymap.set('n', '<C-[>',    function() dap.up()  end, {})
    vim.keymap.set('n', '<C-]>',    function() dap.down()  end, {})

    vim.keymap.set('n', 'tb', function() dap.toggle_breakpoint() end, {})
    vim.keymap.set('n', 'tB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {})
    vim.keymap.set('n', 'tl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {})

    vim.keymap.set('n', 'dr', function() dap.repl_open() end, {})
    vim.keymap.set('n', 'dl', function() dap.run_last() end, {})

    vim.keymap.set('n', '<C-d>', function() dapui.toggle() end, {})

    vim.keymap.set('n', '<C-e>', function() dapui.eval() end, {})
    vim.keymap.set('v', '<C-e>', function() dapui.eval() end, {})

end }
