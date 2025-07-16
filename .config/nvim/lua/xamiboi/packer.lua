-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } } }

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    vim.cmd('colorscheme rose-pine')

    use {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup({
                filetypes = { "*" },     -- Enable for all filetypes
                user_default_options = {
                    names = false,       -- Disable "blue", "red", etc.
                    RRGGBBAA = true,     -- Enable #RRGGBBAA
                    rgb_fn = true,       -- Enable rgb(), rgba(), hsl()
                    mode = "background", -- Show color in background (like VSCode)
                },
            })
        end
    }


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('christoomey/vim-tmux-navigator')
    use('wakatime/vim-wakatime')
    -- lazygit after mistakenly remove order-view.php file
    -- on reddit user says that get to much load in neovim
    -- instead neovim use in tmux window
    --    use('kdheepak/lazygit.nvim')

    -- hardtime plugin 2025-05-19
    use({
        "m4xshen/hardtime.nvim",
        tag = "v1.0.0", -- <- force the correct version
        requires = { "MunifTanjim/nui.nvim" },
    })
    -- lsp support
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- Auto Completion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lua')

    -- Snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')
end)
