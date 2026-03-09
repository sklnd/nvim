local capabilities = require('user.lsp').make_client_capabilities()

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    local root_dir = vim.fs.root(0, { 'pyproject.toml', 'setup.py', '.git', 'requirements.txt' })

    if vim.fn.executable('ty') == 1 then
      -- ty
      vim.lsp.start {
        name = 'ty',
        cmd = { 'ty', 'server' },
        root_dir = root_dir,
        capabilities = capabilities,
      }
    else
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
              diagnosticSeverityOverrides = {
                reportAny = 'hint',
                reportExplicitAny = 'hint',
                reportImplicitStringConcatenation = 'hint',
                reportPrivateImportUsage = 'hint',
                reportPrivateUsage = 'hint',
                reportUnannotatedClassAttribute = 'none',
                reportUnknownArgumentType = 'none',
                reportUnknownMemberType = 'none',
                reportUnknownVariableType = 'none',
                reportUnusedCallResult = 'none',
              },
            },
          },
        },
      }
    end

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
