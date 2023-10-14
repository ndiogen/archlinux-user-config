return { 
setup = function(project_menu)
    require('text-to-colorscheme').setup {
        ai = {
            openai_api_key = os.getenv("OPENAI_API_KEY"),
            gpt_model = "gpt-3.5-turbo",
        },
    }

    vim.keymap.set('n', '<A-2>', ':T2CAddContrast -0.1<CR>', {noremap = true, silent = true})
    vim.keymap.set('n', '<A-8>', ':T2CAddContrast +0.1<CR>', {noremap = true, silent = true})

    vim.keymap.set('n', '<A-4>', ':T2CAddSaturation +0.1<CR>', {noremap = true, silent = true})
    vim.keymap.set('n', '<A-6>', ':T2CAddSaturation +0.1<CR>', {noremap = true, silent = true})

    vim.keymap.set('n', '<A-5>', ':T2CShuffleAccents<CR>', {noremap = true, silent = true})
end }
