local codecompanion = require('codecompanion')

codecompanion.setup {
  strategies = {
    chat = {
      adapter = 'copilot',
      model = 'claude-sonnet-4.5',
    },
  },
  opts = {
    log_level = 'DEBUG',
  },
}
