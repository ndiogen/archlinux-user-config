local nvim_execute = vim.api.nvim_command

local function bootstrap_packer_plugin()
    local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if vim.fn.empty(vim.fn.glob(install_path)) ~= 0 then
	  nvim_execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	  nvim_execute('packadd packer.nvim')
	end
end 

local load_config = function(config_file)
    require(config_file).configure()
end

return { configure = function()
    bootstrap_packer_plugin();

    require('packer').startup(function()
        use{ "nvim-lua/plenary.nvim" }
        use{ 'nvim-lua/popup.nvim'}
        use{ 'nvim-tree/nvim-web-devicons' }

        use{ 'nvim-telescope/telescope.nvim' }
        use{ "nvim-telescope/telescope-file-browser.nvim" }
        use{ 'octarect/telescope-menu.nvim' }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }

        use{ 'ms-jpq/coq_nvim' }
        use{ 'neovim/nvim-lspconfig' }
        use{ 'ahmedkhalf/project.nvim' }
        use{ 'MunifTanjim/exrc.nvim' }
        use{ 'akinsho/toggleterm.nvim' }

        use{ 'rhysd/vim-clang-format' }

        use{ 'easymotion/vim-easymotion' }

        use{ 'wadackel/vim-dogrun' }
        use{ 'EdenEast/nightfox.nvim' }
    end)

    require('nvim-web-devicons').setup{default = true}

    require("nerdtree_config").setup()
    require("telescope_config").setup()

    require("treesitter_config").setup()
    require("lsp_config").setup()
    require("project_config").setup()
    require("exrc_config").setup()
    require("toggleterm_config").setup()

    require("clang_format_config").setup()

    require("easymotion_config").setup()

    nvim_execute("colorscheme duskfox")
end}
