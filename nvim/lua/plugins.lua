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

        use{ 'kyazdani42/nvim-web-devicons' }
        use{ 'nvim-telescope/telescope.nvim' }

        use{ 'sheerun/vim-polyglot' }
        --use{ 'RRethy/vim-illuminate' }

        use{ 'ms-jpq/coq_nvim' }
        use{ 'neovim/nvim-lspconfig' }

        use{ 'rhysd/vim-clang-format' }

        use{ 'preservim/nerdtree' }

        use{ 'easymotion/vim-easymotion' }

        use{ 'wadackel/vim-dogrun' }
    end)

    nvim_execute("colorscheme dogrun")
    require('nvim-web-devicons').setup{default = true}

    require("nerdtree_config").setup()
    require("telescope_config").setup()

    require("lsp_config").setup()

    require("clang_format_config").setup()

    require("easymotion_config").setup()
end}
