vim.g.rustaceanvim = {
  ---@type rustaceanvim.lsp.ClientOpts
  server = {
    root_dir = function()
      local root = vim.fs.root(0, { 'Cargo.toml' })
      print('found root' .. root)
      return vim.fs.root(0, { 'Cargo.toml' })
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
        files = {
          exclude_dirs = {
            '.git',
            '.jj',
            '.venv',
            '.direnv',
            'bin',
            'node_modules',
          },
        },
      },
    },
  },
}
