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
end }
