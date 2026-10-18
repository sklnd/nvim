if vim.g.did_load_tmux_title_plugin then
  return
end
vim.g.did_load_tmux_title_plugin = true

-- Set the terminal title. tmux intercepts this escape sequence (OSC 2) and
-- uses it as the pane title, which is rendered via 'pane-border-format' in the
-- tmux configuration.
vim.o.title = true

local function set_title()
  local name = vim.api.nvim_buf_get_name(0)
  local title
  if name == '' then
    title = 'nvim'
  else
    local flags = vim.bo.modified and ' [+]' or ''
    title = string.format('%s%s - nvim', vim.fn.fnamemodify(name, ':t'), flags)
  end
  vim.o.titlestring = title
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufFilePost', 'BufWritePost', 'TextChanged', 'TextChangedI' }, {
  group = vim.api.nvim_create_augroup('tmux_title', { clear = true }),
  callback = set_title,
})

set_title()
