local M = {}

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

--- Create a floating terminal window.
-- @param opts table Optional config: { width = <number>, height = <number>, buf = <buffer> }
local function create_floating_window(opts)
  opts = opts or {}

  -- Get current window size
  local ui = vim.api.nvim_list_uis()[1]
  local width = opts.width or math.floor(ui.width * 0.8)
  local height = opts.height or math.floor(ui.height * 0.8)

  -- Center the window
  local row = math.floor((ui.height - height) / 2)
  local col = math.floor((ui.width - width) / 2)

  -- Create a new empty buffer (no file, scratch)
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- Enter insert mode automatically
  vim.cmd('startinsert')

  return { buf = buf, win = win }
end

local function toggle()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    -- Start a terminal in the buffer if we don't already have one
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command('Floterm', toggle, {})
vim.keymap.set({ 'n', 't' }, '<leader>tt', toggle, { desc = 'Toggle floating terminal' })

return M
