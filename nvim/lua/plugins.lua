local nvim_execute = vim.api.nvim_command

local function bootstrap_packer_plugin()
    local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if vim.fn.empty(vim.fn.glob(install_path)) ~= 0 then
	  nvim_execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	  nvim_execute('packadd packer.nvim')
	end
end 

return { configure = function()
    bootstrap_packer_plugin();

    require('packer').startup(function()
        use{ 'wbthomason/packer.nvim' }
        use{ "nvim-lua/plenary.nvim" }
        use{ 'nvim-lua/popup.nvim'}
        use{ 'nvim-tree/nvim-web-devicons' }

        use{ 'nvim-telescope/telescope.nvim' }
        use{ "nvim-telescope/telescope-file-browser.nvim" }
        use{ 'octarect/telescope-menu.nvim' }
        use{ 'nvim-tree/nvim-tree.lua' }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
        use { 'nvim-treesitter/nvim-treesitter-context' }

        use{ 'ms-jpq/coq_nvim', branch = 'coq' }
        use{ 'ms-jpq/coq.artifacts', branch = 'artifacts' }

        use{ 'neovim/nvim-lspconfig' }
        use{ 'ahmedkhalf/project.nvim' }
        use{ 'MunifTanjim/exrc.nvim' }
        use{ 'akinsho/toggleterm.nvim' }
        use{ 'stevearc/overseer.nvim' }

        use{ 'lewis6991/gitsigns.nvim' }

        use{ 'phaazon/hop.nvim', branch = 'v2' } -- optional but strongly recommended

        use{ 'rcarriga/nvim-notify' }
        use{ 'EdenEast/nightfox.nvim' }
    end)

    require('nvim-web-devicons').setup{default = true}
    require("exrc_config").setup()

    require("telescope_config").setup()
    require("nvimtree_config").setup()

    require("treesitter_config").setup()
    require("lsp_config").setup()
    require("toggleterm_config").setup()
    require("overseer_config").setup()

    require("gitsigns_config").setup()

    require("notify_config").setup()
    require("hop_config").setup()

    nvim_execute("colorscheme duskfox")
end,
}
