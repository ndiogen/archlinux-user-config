return { setup = function()
    local actions = require('telescope.actions');

    local dropdown_custom = require('telescope.themes').get_dropdown({
      results_height = 20;
      winblend = 20;
      width = 0.8;
      prompt_title = '';
      prompt_prefix = 'Files>';
      previewer = false;
      borderchars = {
        prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        results = {' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' };
        preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
      };
    })

    require('telescope').setup{
      defaults = {
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        set_env = { ['COLORTERM'] = 'truecolor' },
        windblend = 0.8,

        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },

        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<c-q>"] = require("telescope.actions").send_to_qflist,
            }
        }
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          theme = "dropdown",
          previewer = false,
          mappings = {
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            }
          }
        },
        find_files = {
          theme = "dropdown"
        },
        grep_files = {
          theme = "cursor"
        }
      }
    }

    vim.keymap.set('n', 'sf', require('telescope.builtin').find_files(dropdown_custom),  {})
    vim.api.nvim_set_keymap('n', 'gs', ":lua require('telescope.builtin').grep_string()<CR>", {})
    vim.api.nvim_set_keymap('n', 'ss', ":lua require('telescope.builtin').live_grep()<CR>", {})
    vim.api.nvim_set_keymap('n', 'sc', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {})
    vim.api.nvim_set_keymap('n', 'sb', ":lua require('telescope.builtin').buffers()<CR>", {})

    vim.api.nvim_set_keymap('n', 'sS', ":lua require('telescope.builtin').builtin()<CR>",     {})
end }
