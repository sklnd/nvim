local toggleterm = require('toggleterm')

local function term_toggle(direction)
  return function()
    local size
    if direction == 'vertical' then
      local vim_width = vim.o.columns
      size = math.min(80, vim_width)
    end

    if direction == 'horizontal' then
      local vim_height = vim.o.lines
      size = math.min(20, vim_height)
    end

    toggleterm.toggle(nil, size, nil, direction)
  end
end

vim.keymap.set({ 'n', 'i' }, '<C-`>', term_toggle('horizontal'), { noremap = true, silent = true })
vim.keymap.set({ 't' }, '<C-`>', term_toggle('horizontal'), { noremap = true, silent = true })
vim.keymap.set(
  { 'n' },
  '<leader>tv',
  term_toggle('vertical'),
  { noremap = true, silent = true, desc = 'Toggle vertical terminal' }
)
vim.keymap.set(
  { 'n' },
  '<leader>ts',
  term_toggle('horizontal'),
  { noremap = true, silent = true, desc = 'Toggle horizontal terminal' }
)
