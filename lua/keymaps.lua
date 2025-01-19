--  See `:help vim.keymap.set()`
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '[q', '<cmd>:cprev<cr>', { desc = 'Previous in quicklist' })
vim.keymap.set('n', ']q', '<cmd>:cnext<cr>', { desc = 'Next in quicklist' })
vim.keymap.set('n', '[t', '<cmd>:tabprev<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', ']t', '<cmd>:tabnext<cr>', { desc = 'Next tab' })

--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
