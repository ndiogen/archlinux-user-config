return { setup = function()
    local hop = require('hop')
    local hop_directions = require('hop.hint').HintDirection

    hop.setup()

    local hop_line_after = function()
        hop.hint_lines({ direction = hop_directions.AFTER_CURSOR, current_line_only = false })
    end
    local hop_line_before = function()
        hop.hint_lines({ direction = hop_directions.BEFORE_CURSOR, current_line_only = false })
    end

    local hop_word_after = function()
        hop.hint_words({ direction = hop_directions.AFTER_CURSOR, current_line_only = false })
    end
    local hop_word_before = function()
        hop.hint_words({ direction = hop_directions.BEFORE_CURSOR, current_line_only = false })
    end

    local hop_pattern = function() hop.hint_pattern() end

    vim.keymap.set('', '<A-j>', hop_line_after,  {})
    vim.keymap.set('', '<A-k>', hop_line_before, {})

    vim.keymap.set('', '<A-w>', hop_word_after,  {})
    vim.keymap.set('', '<A-b>', hop_word_before, {})

    vim.keymap.set('', '<A-p>', hop_pattern, {})
end }
