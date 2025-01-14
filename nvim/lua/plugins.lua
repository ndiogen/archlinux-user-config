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

        use{
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
        use{ 'nvim-treesitter/nvim-treesitter-context' }

        use{ 'mfussenegger/nvim-dap' }
        use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

        use{ 'hrsh7th/cmp-nvim-lsp' }
        use{ 'hrsh7th/cmp-buffer' }
        use{ 'hrsh7th/cmp-path' }
        use{ 'hrsh7th/cmp-cmdline' }
        use{ 'hrsh7th/nvim-cmp' }
        use{ 'zbirenbaum/copilot.lua' }
        use{ "zbirenbaum/copilot-cmp" }
        use{ 'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary' }

        use{ 'neovim/nvim-lspconfig' }
        use{ 'ahmedkhalf/project.nvim' }
        use{ 'MunifTanjim/exrc.nvim' }
        use{ 'akinsho/toggleterm.nvim' }
        use{ 'stevearc/overseer.nvim' }

        use{ 'lewis6991/gitsigns.nvim' }

        use{ 'folke/zen-mode.nvim' }
        use{ 'RaafatTurki/hex.nvim' }
        use{ 'azazel7/hop.nvim' }
        use{ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

        use{ 'rcarriga/nvim-notify' }
        use{ 'EdenEast/nightfox.nvim' }

        use{ 
            'glacambre/firenvim', 
            run = function() 
                vim.fn['firenvim#install'](0)
            end  
        }
    end)

    require('nvim-web-devicons').setup{default = true}
    require("exrc_config").setup()

    require("telescope_config").setup()
    require("nvimtree_config").setup()

    require("copilot_config").setup()

    require("treesitter_config").setup()
    require("lsp_config").setup()
    require("toggleterm_config").setup()
    require("overseer_config").setup()

    require("dap_config").setup()

    require("gitsigns_config").setup()

    require("notify_config").setup()

    require("zen_mode").setup()
    require("hex_config").setup()
    require("hop_config").setup()
    require("ufo_config").setup()

    nvim_execute("colorscheme duskfox")
end,
}
