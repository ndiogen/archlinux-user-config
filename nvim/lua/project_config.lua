return { setup = function()
    require("project_nvim").setup{}
    require('telescope').load_extension('projects')

    local bufopts = { noremap=true, silent=true }
    vim.api.nvim_create_user_command('OpenProject', require('telescope').extensions.projects.projects, { nargs = 0 })
end }
