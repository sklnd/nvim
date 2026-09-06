-- Shows a lightbulb icon when a line has a lsp codeaction

require('nvim-lightbulb').setup {
  autocmd = { enabled = true },
  action_kinds = { 'quickfix', 'refactor', 'refactor.extract', 'refactor.inline', 'refactor.rewrite' },
  sign = {
    enabled = true,
  },
  virtual_text = { enabled = false },
}
