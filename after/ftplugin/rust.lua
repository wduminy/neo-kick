-- configuration for rust files
-- TODO: Move all the rust specific configuration here

-- Disable the feature to inlay messages on the editor
vim.diagnostic.config { virtual_text = false }
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ck', '<cmd>RustLsp moveItem up<cr>', { desc = 'Move item up' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cj', '<cmd>RustLsp moveItem down<cr>', { desc = 'Move item down' })
