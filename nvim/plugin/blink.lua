require('blink.cmp').setup {
  completion = {
    ghost_text = {
      enabled = true,
      show_with_menu = false,
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
