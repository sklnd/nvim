-- Shows a lightbulb icon when a line has a lsp codeaction

require('nvim-lightbulb').setup {
  autocmd = { enabled = true },
  action_kinds = { 'quickfix', 'refactor' },
  sign = {
    enabled = true,
  },
  virtual_text = { enabled = false },
}
