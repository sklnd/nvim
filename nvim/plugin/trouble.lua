require('trouble').setup {}

vim.keymap.set('n', '<leader>dt', '<cmd>Trouble diagnostics toggle<cr>', {
  silent = true,
  noremap = true,
})
