--return {
--    vim.keymap.set('n', 'C-h', ':TmuxNavigatorLeft<CR>'),
--    vim.keymap.set('n', 'C-j', ':TmuxNavigatorDown(CR>'),
--    vim.keymap.set('n', 'C-k', ':TmuxNavigatorUp<CR>'),
--    vim.keymap.set('n', 'C-l', ':TmuxNavigatorRight<CR>'),
--}
return {
    vim.keymap.set('n', 'C-h', ':TmuxNavigatorLeft<CR>', { noremap = true, silent = true } ),
    vim.keymap.set('n', 'C-j', ':TmuxNavigatorDown<CR>', { noremap = true, silent = true } ),
    vim.keymap.set('n', 'C-k', ':TmuxNavigatorUP<CR>', { noremap = true, silent = true } ),
    vim.keymap.set('n', 'C-l', ':TmuxNavigatorRight<CR>', { noremap = true, silent = true } ),
}
