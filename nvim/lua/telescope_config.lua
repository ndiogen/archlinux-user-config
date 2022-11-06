return { setup = function()
    local actions = require('telescope.actions');

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
          previewer = false,
          theme = "dropdown"
        },
        grep_files = {
          theme = "cursor"
        }
      }
    }

    require("telescope").load_extension("file_browser")

    local bufopts = { noremap=true, silent=true }
    vim.keymap.set('n', 'sf', require('telescope.builtin').find_files,  bufopts)
    vim.keymap.set('n', 'sc', require('telescope.builtin').current_buffer_fuzzy_find, bufopts)

    vim.keymap.set('n', '<Tab>', require('telescope.builtin').buffers,  bufopts)
    vim.keymap.set('n', '<C-n>', require("telescope").extensions.file_browser.file_browser, bufopts)
end }
