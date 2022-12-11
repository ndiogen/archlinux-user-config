return { 
setup = function(project_menu)
    local actions = require('telescope.actions');
    local telescope = require('telescope');

    telescope.setup{
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
        },
        extensions = {
            menu = {
                project = project_menu or {},
            },
        },
    }

    telescope.load_extension("file_browser")
    telescope.load_extension("menu")

    local bufopts = { noremap=false, silent=true }
    vim.keymap.set('n', 'sf', require('telescope.builtin').find_files,  bufopts)
    vim.keymap.set('n', 'sc', require('telescope.builtin').current_buffer_fuzzy_find, bufopts)
    vim.keymap.set('n', '<Tab>', require('telescope.builtin').buffers,  bufopts)

    vim.keymap.set('n', '<C-n>', function() telescope.extensions.file_browser.file_browser() end, bufopts)
    vim.keymap.set('n', '<C-p>', function() telescope.extensions.menu.project({}) end, bufopts)
end }
