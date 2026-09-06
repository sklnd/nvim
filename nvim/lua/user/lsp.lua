---@mod user.lsp
---
---@brief [[
---LSP related functions
---@brief ]]

local M = {}

---Gets a 'ClientCapabilities' object, describing the LSP client capabilities
---Extends the object with capabilities provided by plugins.
---@return lsp.ClientCapabilities
function M.make_client_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require('blink.cmp').get_lsp_capabilities(capabilities)
  -- Add com_nvim_lsp capabilities
  --local cmp_lsp = require('cmp_nvim_lsp')
  --local cmp_lsp_capabilities = cmp_lsp.default_capabilities()
  --capabilities = vim.tbl_deep_extend('keep', capabilities, cmp_lsp_capabilities)
  -- Add any additional plugin capabilities here.
  -- Make sure to follow the instructions provided in the plugin's docs.
  -- return capabilities
end

-- Specify how the border looks like
local border = {
  { '┌', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '┐', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '┘', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '└', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

return M
