-- See https://github.com/folke/zen-mode.nvim

-- toggle zen mode
vim.keymap.set('n', '<C-w>z', '<cmd>ZenMode<cr>', { desc = 'Zenmode' })

return {
  'folke/zen-mode.nvim',
  opts = {},
}
