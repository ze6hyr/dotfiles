local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(3) end)
-- ramdan mein mein krounga isko Insha Allah
-- update ramadan bhi guzar gaya aur isko nhi dekha wesy dekhna ya tha k ismy 
-- toggle kind of last file k sath hu sakta q k abhi ya 1 side py huta rehta hai
--
--vim.keymap.set("n", "<C-m>", function() ui.nav_next() end)
--vim.keymap.set("n", "<C-b>", function() ui.nav_prev() end)
