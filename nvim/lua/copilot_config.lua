return { setup = function()
    require("copilot").setup({
        panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>"
            },
            layout = {
                position = "right",
                ratio = 0.4
            },
        },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<A-c>",
                accept_word = false,
                accept_line = false,
                next = "<A-]>",
                prev = "<A-[>",
                dismiss = "<C-c>",
            },
        }
    })

    require("CopilotChat").setup({
        prompts = {
            Explain = {
                mapping = '<A-e>',
            },
            Review = {
                mapping = '<A-r>',
            },
            Tests = {
                mapping = '<A-t>',
            },
            Fix = {
                mapping = '<A-f>',
            },
            Optimize = {
                mapping = '<A-o>',
            },
        },
        window = {
            layout = "horizontal",
        },
        mappings = {
            accept_diff = {
              normal = '<A-c>',
              insert = '<A-c>'
            },
            show_diff = {
              normal = '<A-C>',
            },
        },
    })
end }
