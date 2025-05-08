vim.opt.spell = true
vim.opt.spelllang = "en"

--Keybindings for Spell Checking:
--[s → Go to the previous misspelled word.
--]s → Go to the next misspelled word.
--z= → Show spelling suggestions for the current word.
--zg → Add the word to your dictionary.
--zw → Mark the word as incorrect.

-- Enable line numbers in Netrw/ file explorer in neovim
vim.cmd([[
    autocmd FileType netrw setlocal number
    autocmd FileType netrw setlocal relativenumber
]])


-- this down lines are from primeagen i just copy
-- Navigation vim + tmux panes better
--vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

--vim.o.statusline = '%F %m%r%h%w%=' -- this is for file path in statusline all the time  (there is a diffrence between -f or -F)
vim.o.winbar = '%F %m%r%h%w'
vim.o.statusline = '%t %{FugitiveStatusline()} %=%l:%c %y '

--%m → modified flag (+ if unsaved)
--%r → readonly flag
--%h → help buffer flag
--%w → preview window flag
--%= → separates left/right
--%l:%c → line:column
--%y → file type
--%{FugitiveStatusline()} → Git info if using vim-fugitive
--%F → full path in winbar

--vim.opt.guicursor = ""
vim.opt.guicursor = {
    "n-v-c:block-blinkon200-blinkoff200", -- Normal, visual, commond mode: blinking block cursor
    "i-ci:block-blinkon0-blinkoff0", -- insert, commond insert mode: solid block cursor (no blinking)
    "v-ci:block-blinkon0-blinkoff0", -- visual, commond visual mode: solid block cursor (no blinking)
    "r-cr:block-blinkon0-blinkoff0", --replace mode: solid block cursor (no blinking)
}


-- mouse off
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.opt.mouse = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- cursorline things
vim.opt.cursorline = true
vim.opt.cursorcolumn = false


-- Define highlight groups
--vim.cmd("highlight ActiveWindow guibg=#050505")
--vim.cmd("highlight InactiveWindow guibg=#050505")
---- Apply highlight when window focus changes
--vim.api.nvim_create_autocmd("WinEnter", {
--  callback = function()
--    vim.cmd("setlocal winhighlight=Normal:ActiveWindow")
--    vim.wo.cursorline = true
--    vim.wo.relativenumber = true
--    vim.wo.number = true
--  end,
--})
--
--vim.api.nvim_create_autocmd("WinLeave", {
--  callback = function()
--    vim.cmd("setlocal winhighlight=Normal:InactiveWindow")
--    vim.wo.cursorline = false
--    vim.wo.relativenumber = false
--    vim.wo.number = false
--  end,
--})


-- for tmux unactive windows
-- and add this line of code in tmux.conf  set -g focus-events on
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  callback = function()
    vim.wo.cursorline = true
    vim.wo.relativenumber = true
    vim.wo.number = true
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*",
  callback = function()
    vim.wo.cursorline = false
    vim.wo.relativenumber = false
    vim.wo.number = false
  end,
})

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard = "unnamed"
