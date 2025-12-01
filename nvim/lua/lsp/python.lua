local capabilities = require('user.lsp').make_client_capabilities()

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    local root_dir = vim.fs.root(0, { 'pyproject.toml', 'setup.py', '.git', 'requirements.txt' })

    -- basedpyright
    vim.lsp.start {
      name = 'basedpyright',
      cmd = { 'basedpyright-langserver', '--stdio' },
      root_dir = root_dir,
      capabilities = capabilities,
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          analysis = {
            diagnosticMode = 'openFilesOnly',
            inlayHints = {
              genericTypes = true,
            },
          },
        },
      },
    }

    -- ruff
    vim.lsp.start {
      name = 'ruff',
      cmd = { 'ruff', 'server' },
      root_dir = root_dir,
      capabilities = capabilities,
      init_options = {
        settings = {},
      },
    }
  end,
})
