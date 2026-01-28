local dap_python = require('dap-python')

dap_python.test_runner = 'pytest'

local function project_root(bufnr)
  bufnr = bufnr or 0
  local fname = vim.api.nvim_buf_get_name(bufnr)
  if fname == '' then
    return vim.loop.cwd()
  end

  return vim.fs.root(fname, { '.git', 'pyproject.toml' }) or vim.loop.cwd()
end

local function python_path_for_root(root)
  local venv = root .. '/.venv/bin/python'
  if vim.fn.executable(venv) == 1 then
    return venv
  end
  -- fall back
  return 'python'
end

local function debug_config(config)
  config.justMyCode = false
  if config.module == 'pytest' then
    config.args = vim.list_extend(config.args or {}, { '--no-cov' })
  end
  return config
end

dap_python.setup(python_path_for_root(project_root()))

--
-- Keybinds
--

vim.keymap.set('n', '<leader>dm', function()
  require('dap-python').test_method { config = debug_config }
end, { silent = false, desc = '[d]ebug [m]method' })

vim.keymap.set('n', '<leader>df', function()
  require('dap-python').test_class { config = debug_config }
end, { silent = true, desc = '[d]ebug [f]unction' })

vim.keymap.set('v', '<leader>ds', function()
  require('dap-python').debug_selection { config = debug_config }
end, { silent = true, desc = '[d]ebug [s]election' })
