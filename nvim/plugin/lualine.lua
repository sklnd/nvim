if vim.g.did_load_lualine_plugin then
  return
end
vim.g.did_load_lualine_plugin = true

local navic = require('nvim-navic')
navic.setup {
  lsp = { auto_attach = true, preference = { 'basedpyright', 'ruff' } },
  click = true,
}

---Indicators for special modes,
---@return string status
local function extra_mode_status()
  -- recording macros
  local reg_recording = vim.fn.reg_recording()
  if reg_recording ~= '' then
    return ' @' .. reg_recording
  end
  -- executing macros
  local reg_executing = vim.fn.reg_executing()
  if reg_executing ~= '' then
    return ' @' .. reg_executing
  end
  -- ix mode (<C-x> in insert mode to trigger different builtin completion sources)
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'ix' then
    return '^X: (^]^D^E^F^I^K^L^N^O^Ps^U^V^Y)'
  end
  return ''
end

-- The default toggleterm plugin stomps on mode
local toggleterm = {
  sections = { lualine_a = { 'mode' }, lualine_b = {
    function()
      return 'Terminal'
    end,
  } },
  filetypes = { 'toggleterm' },
}

require('lualine').setup {
  globalstatus = true,
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diff' },
    lualine_z = {
      -- (see above)
      { extra_mode_status },
    },
  },
  options = {
    theme = 'auto',
  },
  winbar = {
    lualine_a = {
      {
        'filename',
        path = 1,
        file_status = true,
        newfile_status = true,
        -- avoid showing weird filenames when we're in a term
        cond = function()
          local hide_filetypes = {
            'terminal',
            'jjdescription',
          }
          for _, hide_filetype in hide_filetypes do
            if vim.bo.buftype == hide_filetype then
              return true
            end
          end
          return false
        end,
      },
      {},
    },
    lualine_c = { 'navic' },
  },
  extensions = { 'fugitive', 'fzf', toggleterm, 'quickfix' },
}
