require('blink.cmp').setup {
  completion = {
    ghost_text = {
      enabled = true,
      show_with_menu = false,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      snippets = {
        min_keyword_length = 2,
        score_offset = 4,
      },
      lsp = {
        min_keyword_length = 3,
        score_offset = 3,
      },
      path = {
        min_keyword_length = 3,
        score_offset = 2,
      },
      buffer = {
        min_keyword_length = 5,
        score_offset = 1,
      },
    },
  },
  documentation = {
    auto_show = true,
    auto_show_delay = 200,
  },
  keymap = {
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
  },
  signature = {
    enabled = true,
    window = {
      show_documentation = false,
    },
  },
}
