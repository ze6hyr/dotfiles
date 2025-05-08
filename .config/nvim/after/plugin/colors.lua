function ColorMyPencils(color)
    color = color or "rose-pine-main"
    require("rose-pine").setup({
        styles = { italic = false },
    })
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "#050505" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { fg ="#5c5c5c", bg = "#151320" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#151320" })
    -- Customize specific styles
    --
    -- run this command in neovim if you want to change some color,
    -- just hover your cursor and run this bottom command in normal mode
    -- :lua print(vim.inspect(vim.treesitter.get_captures_at_cursor())) 
    --
    -- if treesitter playground plugin installed then this bottom command works to
    -- :TSHighlightCapturesUnderCursor

    --  vim.api.nvim_set_hl(0, "Comment", { italic = true, bold = false, underline = false, fg = "#a06967" }) -- Comments italic only, no bold
    -- vim.api.nvim_set_hl(0, "Comment", { italic = true, bold = false, underline = false, fg = "#908caa" }) -- Comments italic only, no bold + real comment color
    vim.api.nvim_set_hl(0, "cursorline", { bg = "#101010"})                                                 -- Cursorline color
--    vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#ffffff"})                                                 -- Cursorline color
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#388eb0", bold = false })                       -- Give <?php tag a brighter color
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#388eb0", bold = false })                       -- Give <?php tag a brighter color
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#388eb0", bold = false })                             -- Give <html> thing
    vim.api.nvim_set_hl(0, "@constant", { italic = false, bold = false, underline = false, fg = "#ebbcba" }) -- this is for builtin variables in php 
    vim.api.nvim_set_hl(0, "@variable", { italic = false, bold = false, underline = false, fg = "#ebbcba" }) -- this is for builtin variables in php 
    vim.api.nvim_set_hl(0, "@markup.link.label", { fg = "#c4a7e7" }) -- Comments italic only, no bold + real comment color
--    vim.api.nvim_set_hl(0, "Visual", { fg = "#908caa", bg = "#38313d" })                                   -- Visual color for fg or bg
    vim.api.nvim_set_hl(0, "Visual", { bg = "#1e1b1b" })    -- i get the idea of removing fg color         -- Visual color for fg or bg
--    vim.api.nvim_set_hl(0, "@function.builtin", { bold = false })                                          -- @function.builtin no bold
--    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#eb6f92", bold = false })                          -- @variable.builtin with colors no bold
--    vim.api.nvim_set_hl(0, "@module.builtin", { fg = "#e0def4", bold = false })                            -- @variable.builtin with colors no bold
--    vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#9ccfd8", bold = false })                              -- @variable.builtin with colors no bold
--    vim.api.nvim_set_hl(0, "@markup.strong", { fg = "#9ccfd8", bold = false })                             -- @variable.builtin with colors no bold
--    vim.api.nvim_set_hl(0, "@markup.heading", { fg = "#9ccfd8", bold = false })                            -- @variable.builtin with colors no bold
--    vim.api.nvim_set_hl(0, "Title", { fg = "#9ccfd8", bold = false })                                      -- @this is for html h1 or p tags
--    vim.api.nvim_set_hl(0, "@none", { fg = "#242424" }) -- Comments italic only, no bold + real comment color
--    vim.api.nvim_set_hl(0, "@spell", { fg = "#242424" }) -- Comments italic only, no bold + real comment color
    vim.api.nvim_set_hl(0, "Comment",   { italic = true, bold = false, underline = false, fg = "#242424" }) -- Comments italic only, no bold + real comment color
    vim.api.nvim_set_hl(0, "@comment",  { italic = true, bold = false, underline = false, fg = "#242424" }) -- Comments italic only, no bold + real comment color
    vim.api.nvim_set_hl(0, "SpellBad",  { underline = false })                              -- this line for comment underline
    vim.api.nvim_set_hl(0, "SpellCap",  { underline = false })                              -- @this is for html h1 or p tags
    vim.api.nvim_set_hl(0, "SpellRare", { underline = false })                             -- @this is for html h1 or p tags
    vim.api.nvim_set_hl(0, "SpellLocal",{ underline = false })                            -- @this is for html h1 or p tags
--    vim.api.nvim_set_hl(0, "SpellBad", { fg = "#333333", underline = false })                              -- this line for comment underline
--    vim.api.nvim_set_hl(0, "SpellCap", { fg = "#242424", underline = false })                              -- @this is for html h1 or p tags
--    vim.api.nvim_set_hl(0, "SpellRare", { fg = "#242424", underline = false })                             -- @this is for html h1 or p tags
--    vim.api.nvim_set_hl(0, "SpellLocal", { fg = "#242424", underline = false })                            -- @this is for html h1 or p tags
end

ColorMyPencils()
