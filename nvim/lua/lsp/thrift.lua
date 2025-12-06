local M = {}

local capabilities = require('user.lsp').make_client_capabilities()

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'thrift',
  callback = function()
    local root_dir = vim.fs.root(0, { '.git' })

    -- determine if the rapacity binary is installed
    if not vim.fn.executable('rapacity') == 1 then
      return
    end

    vim.lsp.start {
      root_dir = root_dir,
      capabilities = capabilities,
      cmd = { 'rapacity', 'lsp', '--stdio' },
    }
  end,
})

return M
