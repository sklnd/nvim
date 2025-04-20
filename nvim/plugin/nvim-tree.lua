require("nvim-tree").setup({
    filters = { dotfiles = false },
    hijack_directories = { auto_open = false },
    view = { preserve_window_proportions = true, side = "left", width = 30 },
})

vim.keymap.set(
    {'n', 'i'},
    "<leader>t", ":NvimTreeToggle<CR>",
    { noremap = true, silent = true }
)
