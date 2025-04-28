local root_files = {
  '.git',
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
}

vim.lsp.start {
  name = 'basedpyright',
  cmd = { 'basedpyright-langserver', '--stdio' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  settings = {
    Python = {
      hint = {
        enable = true,
      },
      analysis = {
        typeCheckingMode = 'basic', -- Set to "strict" for stricter type checking
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
