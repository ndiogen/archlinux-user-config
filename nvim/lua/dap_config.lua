return { setup = function()
    local dap = require("dap");
    local dapui = require("dapui");

    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- adjust as needed
        name = "lldb",
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
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

    vim.keymap.set('n', '<F5>',  function() dap.continue()  end, {})
    vim.keymap.set('n', '<F10>', function() dap.step_over() end, {})
    vim.keymap.set('n', '<F11>', function() dap.step_into() end, {})
    vim.keymap.set('n', '<F12>', function() dap.step_out()  end, {})
    vim.keymap.set('n', '<C-t>',  function() dap.terminate()  end, {})

    vim.keymap.set('n', 'tb', function() dap.toggle_breakpoint() end, {})
    vim.keymap.set('n', 'tB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {})
    vim.keymap.set('n', 'tl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {})

    vim.keymap.set('n', 'dr', function() dap.repl_open() end, {})
    vim.keymap.set('n', 'dl', function() dap.run_last() end, {})

    vim.keymap.set('n', '<C-d>', function() dapui.toggle() end, {})

    vim.keymap.set('n', '<C-e>', function() dapui.eval() end, {})
    vim.keymap.set('v', '<C-e>', function() dapui.eval() end, {})

end }
