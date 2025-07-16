-- this is neovim spell support
--vim.opt.spell = true
--vim.opt.spelllang = "en"

--Keybindings for Spell Checking:
--[s → Go to the previous misspelled word.
--]s → Go to the next misspelled word.
--z= → Show spelling suggestions for the current word.
--zg → Add the word to your dictionary.
--zw → Mark the word as incorrect.


-- this is for file search in child repo
--vim.opt.path:append("**")
--vim.opt.path:append({
--  "src",
--  "include",
--  "lua",
--  "/home/zephyr/zephyr/**",  -- selectively recurse
--})
--vim.opt.wildmenu = true

-- Enable line numbers in Netrw/ file explorer in neovim
vim.cmd([[
    autocmd FileType netrw setlocal number
    autocmd FileType netrw setlocal relativenumber
]])

-- THIS IS MY TO-DO LIST SHORTCUT
--vim.keymap.set("n", "<leader>nn", function()
--  vim.cmd("edit ~/NOTES.md")
--end, { desc = "Open NOTES.md" })

-- NICE TOGGLE BETWEEN NOTES.MD AND PREVIOUS FILE
--vim.keymap.set("n", "<leader>nn", function()
--  local notes_path = vim.fn.expand("~/NOTES.md")
--  local current_file = vim.api.nvim_buf_get_name(0)
--
--  if current_file == notes_path then
--    vim.cmd("edit #")  -- toggle back to last file
--  else
--    vim.cmd("edit " .. notes_path)
--  end
--end, { desc = "Toggle NOTES.md" })

--Press <leader>nn → opens NOTES.md
--Press <leader>nn again → returns to your code file
--Press again? Back to notes
--Seamless toggle!


-- THIS IS THE FINAL NOTES.MD CODE TO TOGGLE
vim.keymap.set("n", "<leader>nn", function()
  local notes_path = vim.fn.expand("~/NOTES.md")
  local current_file = vim.api.nvim_buf_get_name(0)

  if current_file == notes_path then
    vim.cmd("edit #")
    return
  end

  vim.cmd("edit " .. notes_path)

  local date_header = "## " .. os.date("%B %d, %Y - %H:%M")
  local new_block = {
    "",
    date_header,
    "",
    "      TITLE: ",
    "             ",
    "- [ ] TO-DO: ",
    "- [ ] ERROR: ",
    "- [ ] IDEA:  ",
    "      REF:   ",
    "",
    string.rep("-", 80),
    ""
  }

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local has_today = false
  for _, line in ipairs(lines) do
    if line:find(os.date("%B %d, %Y")) then
      has_today = true
      break
    end
  end

  if not has_today then
    -- Insert at END of file
    local last_line = #lines
    vim.api.nvim_buf_set_lines(0, last_line, last_line, false, new_block)
    vim.api.nvim_win_set_cursor(0, { last_line + 4, 8 })  -- Line 4 of new_block, column after "- TO-DO: "
    vim.cmd("startinsert!")
  else
    --vim.cmd("normal! G")
    vim.cmd("normal! gg")
    --vim.cmd("startinsert!")
  end
end, { desc = "Toggle NOTES.md with date and time block" })


-- CHECKBOX OR UNCHECKED
-- Normal mode: insert a new unchecked task
vim.keymap.set("n", "<leader>cb", "o- [ ] ", { desc = "Insert checkbox", noremap = true })

-- Visual mode: toggle selected lines into checkboxes
vim.keymap.set("v", "<leader>cb", ":s/^\\s*- /- [ ] /<CR>", { desc = "Add checkboxes" })


-- PHP SNIPPET custom snippets
vim.keymap.set("n", ",b", "i<?php<CR><CR><CR><CR>?><Esc>3kI", { noremap = true, silent = true })
vim.keymap.set("n", ",h", "o<?=   ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",t", "xi><?=    ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",n", "i<?=    ?><Esc>3hi", { noremap = true, silent = true })

--vim.api.nvim_set_keymap(
--  'n',
--  ',p',
--  [[:-1read $HOME/.config/nvim/snippets/1php_snippet.lua<CR>jI]],
--  { noremap = true, silent = true }
--)

--vim.api.nvim_set_keymap(
--  'n',
--  ',h',
--  [[:-1read $HOME/.config/nvim/snippets/2php_snippet.lua<CR>f=a]],
--  { noremap = true, silent = true }
--)
--
-- this down lines are from primeagen i just copy
-- Navigation vim + tmux panes better
--vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

--vim.o.statusline = '%F %m%r%h%w%=' -- this is for file path in statusline all the time  (there is a diffrence between -f or -F)
--
--math.random(x) -- Returns a random number between 1 and x.
--math.random(x, y) -- Returns a random number between x and y.
--
-->print "Hello, switch> local a = 'hello' a=a .. ' world' print(a)
--hello world
--> local a = 'hello'.. ' world' print(a)
--hello world
--local x = math.random(1,9)
--local result =
--	   x == 1 and " "
--	or x == 2 and "󰴈 "
--	or x == 3 and "󱢅 "
--	or x == 4 and "󰉊 "
--	or x == 5 and "󰋑 "
--	or x == 6 and " "
--	or x == 7 and " "
--	or x == 8 and "󱩡 "
--	or x == 9 and " "
--	or " "
----print(result)
--vim.o.winbar = ' %F  %='.. result


--local icons = {
--  " ", " ", " ", " ","󰴈 ", " ", "'", "󰭎 ", "󰞷", "󰆘 ", " ", " ",
--    " ", "󱣻 ", "󰭟 ", " ", " ", "󱢴 ", "󰾡", " ", "󱢅 ", " ",
--    "󰉊 ", "󰋑 ", " ", "󱩡 ", "󰫢 ", " ", "󰊠 ", "󰖔 ",
--    --" ","🔥"," ", "󰴈 ", "󱍢 ","🤝 ",
--}
--
--local function random_icon()
--    return icons[math.random(#icons)]
--end
--
--vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
--    callback = function()
--     -- vim.o.winbar = ' %F %=' .. random_icon() .. ' '
--    end
--})
--

-- https://symbl.cc/en/unicode-table/#braille-patterns  2809
function _G.scroll_bar()
    --local chars = { '█','▇','▆','▅','▄','▃','▂','▁' }  -- reversed!
    --local chars = { '▁','▂','▃','▄','▅','▆','▇','█' }

    --    local chars = { '▀','⠉','⠒','⠶', '━','⠤','⣀', '▄'}

    local chars = { '⠉', '⣶', '▄', '⣭', '⣉', '⣛', '▀', '⠿', '⣀' }

    --  local chars = { '⠉','⠒', '━','⠤','⣀'}
    --local chars = { '⣶', '⣭', '⣛', '⠿' }
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local ratio = current_line / total_lines
    local index = math.floor(ratio * (#chars - 1)) + 1
    return chars[index]
end

-- SET STATUSLINE
vim.o.statusline = table.concat {
--    ' %-10{v:lua.display_mode()}', -- modes
    ' %F',                          -- File name
    ' %m%r%h%w',                    -- Flags
    -- ' [%{&ff}]',              -- File format
    -- ' [%{&fileencoding}]',
    ' %=',
    '%y ',                       -- File type
    ' %{FugitiveStatusline()} ', -- → Git info if using vim-fugitive
    -- '%l:%c',                 -- Line and column
    '%l:%c',                     -- Line and column
    ' [%p%%]',                   -- Percentage through file
    ' %{v:lua.scroll_bar()}'     -- Our scrollbar!
}
-- Return full mode name
--function _G.display_mode()
--    local mode_map = {
--        n = "[NORMAL]",
--        no = "[N-PENDING]",
--        v = "[VISUAL]",
--        V = "[V-LINE]",
--        [""] = "[V-BLOCK]",
--        i = "[INSERT]",
--        ic = "[INSERT]",
--        R = "[REPLACE]",
--        Rv = "[V-REPLACE]",
--        c = "[COMMAND]",
--        cv = "[VIM EX]",
--        ce = "[EX]",
--        s = "[SELECT]",
--        S = "[S-LINE]",
--        [""] = "[S-BLOCK]",
--        t = "[TERMINAL]",
--    }
--
--    local current_mode = vim.api.nvim_get_mode().mode
--    return mode_map[current_mode] or current_mode
--end

--vim.o.statusline = ' %t %m%r%h%w %=%l,%c %y %{FugitiveStatusline()} '
--%m → modified flag (+ if unsaved)
--%r → readonly flag
--%h → help buffer flag
--%w → preview window flag
--%= → separates left/right
--%l:%c → line:column
--%y → file type
--%{FugitiveStatusline()} → Git info if using vim-fugitive
--%F → full path in winbar

-- this is why i get blinking cursor
--vim.opt.guicursor = ""
vim.opt.guicursor = {
    "n-v-c:block-blinkon200-blinkoff200", -- Normal, visual, commond mode: blinking block cursor
    "i-ci:block-blinkon0-blinkoff0",      -- insert, commond insert mode: solid block cursor (no blinking)
    "v-ci:block-blinkon0-blinkoff0",      -- visual, commond visual mode: solid block cursor (no blinking)
    "r-cr:block-blinkon0-blinkoff0",      --replace mode: solid block cursor (no blinking)
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



vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard = "unnamed"
