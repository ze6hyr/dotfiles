-- Modern, clean LSP setup without lsp-zero
-- This assumes Mason is installed and working

-- Diagnostic signs setup using modern API
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "",
            [vim.diagnostic.severity.INFO]  = "",
        },
    },
    --  Virtual_text = {
    --  OK, Cool can you see what I did there
    --    prefix = '●', Change the prefix if you like
    --    source = "always", Show the LSP source that reported the diagnostic
    --    format = function(diagnostic)
    --      return diagnostic.message .. " (" .. diagnostic.source .. ")"
    --    end,
    --  },
    virtual_text = true,  -- set this to true if you need to see error with code
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
-- Setup capabilities for cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup handlers for all servers
local lspconfig = require('lspconfig')

-- Attach keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Setup mason + mason-lspconfig
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'intelephense',
--        'html',
 --       'cssls',
  --      'emmet_ls',
        'ts_ls', -- use tsserver not ts_ls
        'tailwindcss',
    },
    automatic_installation = true,
})

-- Setup servers one-by-one
lspconfig.intelephense.setup({
    capabilities = capabilities,
    filetypes = { 'php' },
    root_dir = lspconfig.util.root_pattern('composer.json', '.git'),
})

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'php', 'css', 'javascript', 'javascriptreact', 'typescriptreact' },
    root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js',
        'package.json', '.git'),
})

lspconfig.ts_ls.setup({
    capabilities = capabilities,
    filetypes = { 'javascript', 'javascriptreact', 'typescriptreact' },
    -- dont add html filetype in ts_ls again this will not do right formatting with lsp
    --filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact' },
    root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'postcss.config.js', 'package.json', '.git'),
})

-- Default setup for the rest
--local default_servers = { "html", "cssls", "emmet_ls" }
local default_servers = { "html", "lua_ls" }--"cssls", "emmet_ls" }
for _, server in ipairs(default_servers) do
    lspconfig[server].setup({})
end

-- Completion engine
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
 mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  --  mapping = cmp.mapping.preset.insert({
  --      ['<Tab>'] = cmp.mapping.select_next_item(),
  --      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  --      ['<C-Space>'] = cmp.mapping.complete(),
  --      ['<CR>'] = cmp.mapping.confirm({ select = true }),
  --  }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'path' },
    })
})
require('lspconfig').harper_ls.setup {
  settings = {
    ["harper-ls"] = {
      userDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 120000
    }
  }
}
