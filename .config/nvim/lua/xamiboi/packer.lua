-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} } }

	use({ 'rose-pine/neovim', as = 'rose-pine' })
	vim.cmd('colorscheme rose-pine')

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('christoomey/vim-tmux-navigator')
    use ('wakatime/vim-wakatime')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
		-- lsp support
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		-- Auto Completion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lua'},
		{'hrsh7th/cmp-nvim-lsp'},
		
		-- Snippets
		{'L3MON4D3/luaSnip'},
		{'rafamadriz/friendly-snippets'},
	}
}
end)
