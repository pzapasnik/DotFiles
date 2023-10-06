-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- use({ 'rose-pine/neovim', as = 'rose-pine' })
	-- vim.cmd('colorscheme rose-pine')

	use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
	vim.cmd('colorscheme tokyonight')

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('jose-elias-alvarez/null-ls.nvim')
	use('hrsh7th/cmp-nvim-lsp-signature-help')
	use { "ray-x/lsp_signature.nvim" }

	--Debugger
	use('mfussenegger/nvim-dap')
	use('leoluz/nvim-dap-go')
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
	use { "theHamsta/nvim-dap-virtual-text" }
	use { "nvim-telescope/telescope-dap.nvim" }

	--Flutter
	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                         -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}

	use { 'numToStr/Comment.nvim' }
	use { 'github/copilot.vim' }
end)