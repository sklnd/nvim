require('toggleterm').setup {}

vim.keymap.set({ 'n', 'i' }, '<C-`>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.keymap.set({ 't' }, '<C-`>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })
