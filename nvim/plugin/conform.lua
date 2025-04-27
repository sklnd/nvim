-- Conform is a formatting plugin that unifies lsp formatting behavior
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff' },
    javascript = { 'prettier' },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
