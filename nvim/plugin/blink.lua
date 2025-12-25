require('blink.cmp').setup {
  completion = {
    ghost_text = {
      enabled = true,
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
  },
  highlight = {
    use_nvim_cmp_as_default = true,
  },
  windows = {
    autocomplete = {
      border = 'rounded',
    },
  },
}
