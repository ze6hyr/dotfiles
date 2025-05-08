vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', '<leader>f', function()
            -- chatgpt says add this so
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'html',
        'cssls',
        'intelephense',
        'emmet_ls',
        'ts_ls',
        'tailwindcss'
    },
})

-- Use a single setup_handlers block
require('mason-lspconfig').setup_handlers({
    -- Default handler for all servers except those listed below
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = lsp_capabilities,
        })
    end,

    ["intelephense"] = function()
        require("lspconfig").intelephense.setup({
            capabilities = lsp_capabilities,
            filetypes = { "php" },
            root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
        })
    end,
    -- Custom PHPActor config -- never use phpactor for php this is pure shitt 
    -- and crush so much so you dont remember why people left you,
    -- or why you dont have job
    --
    --    ["phpactor"] = function()
    --        require("lspconfig").phpactor.setup({
    --            cmd = { vim.fn.stdpath("data") .. "/mason/bin/phpactor", "language-server" },
    --            filetypes = { "php" },
    --            root_dir = require("lspconfig.util").root_pattern(
    --                "composer.json",
    --                ".git",
    --                ".phpactor.json",
    --                ".phpactor.yml"),
    --            capabilities = lsp_capabilities,
    --        })
    --    end,
    ["tailwindcss"] = function()
        require("lspconfig").tailwindcss.setup({
            capabilities = lsp_capabilities,
            filetypes = {
                "html",
                "php",
                "css",
                "javascript",
                "javascriptreact",
                "typescriptreact" },
            root_dir = require("lspconfig.util").root_pattern(
                "tailwind.config.js",
                "tailwind.config.ts",
                "postcss.config.js",
                "package.json",
                ".git"),
        })
    end,
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
-- 👇 Explicit Phpactor handler
-- Confiqure specific  LSP servers with custom settings
--        lua_ls = function()
--            require('lspconfig').lua_ls.setup({
--                capabilities = lsp_capabilities,
--                settings = {
--                    Lua = {
--                        runtime = {
--                            version = 'LuaJIT'
--                        },
--                        diagnostics = {
--                            globals = { 'vim' },
--                        },
--                        workspace = {
--                            library = {
--                                vim.env.VIMRUNTIME,
--                            }
--                        }
--                    }
--                }
--            })
--        end,
--
--
--
-- Completion Sources:
-- path: Suggests filesystem paths.
-- nvim_lsp: Provides suggestions from the LSP.
-- luasnip: Adds snippet completion from luasnip.
-- buffer: Completes based on words in the current buffer.
--
--
-- Mappings:
-- <C-p> and <C-n>: Navigate up and down through the completion list.
-- <C-y>: Confirm the selected completion item.
-- <C-Space>: Manually trigger the completion menu.
-- Snippet Expansion: luasnip is used to expand snippets in the completion menu, and it loads extra snippets from friendly-snippets.
--
--
--mapping = cmp.mapping.preset.insert({
--['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--['<C-y>'] = cmp.mapping.confirm({ select = true }),
--['<C-Space>'] = cmp.mapping.complete(),
--}),
--snippet = {
--expand = function(args)
--require('luasnip').lsp_expand(args.body)
--end,
--},
--})
