return { setup = function()
    local hardtime = require('hardtime');

    local config = {
       max_time = 1000,
       max_count = 2,
       disable_mouse = true,
       hint = true,
       notification = true,
       allow_different_key = false,
       resetting_keys = {
          ["1"] = { "n", "x" },
          ["2"] = { "n", "x" },
          ["3"] = { "n", "x" },
          ["4"] = { "n", "x" },
          ["5"] = { "n", "x" },
          ["6"] = { "n", "x" },
          ["7"] = { "n", "x" },
          ["8"] = { "n", "x" },
          ["9"] = { "n", "x" },
          ["c"] = { "n" },
          ["C"] = { "n" },
          ["d"] = { "n" },
          ["x"] = { "n" },
          ["X"] = { "n" },
          ["y"] = { "n" },
          ["Y"] = { "n" },
          ["p"] = { "n" },
          ["P"] = { "n" },
       },
       restricted_keys = {
          ["h"] = { "n", "x" },
          ["j"] = { "n", "x" },
          ["k"] = { "n", "x" },
          ["l"] = { "n", "x" },
          ["-"] = { "n", "x" },
          ["+"] = { "n", "x" },
          ["gj"] = { "n", "x" },
          ["gk"] = { "n", "x" },
          ["<CR>"] = { "n", "x" },
          ["<C-M>"] = { "n", "x" },
          ["<C-P>"] = { "n", "x" },
       },
       disabled_keys = {},
       disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason" },
    }

    hardtime.setup(config);

    -- Hotkeys
    vim.keymap.set('n', '<A-z>', function() hardtime.toggle() end, {})
end }
