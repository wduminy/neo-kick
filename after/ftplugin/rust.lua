-- configuration for rust files
-- TODO: Move all the rust specific configuration here

-- Disable the feature to inlay messages on the editor
vim.diagnostic.config { virtual_text = false }
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ck', '<cmd>RustLsp moveItem up<cr>', { desc = 'Move item up' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cj', '<cmd>RustLsp moveItem down<cr>', { desc = 'Move item down' })

local bufnr = vim.api.nvim_get_current_buf()
-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
-- I tried this - not sure whether i like it
-- vim.keymap.set('n', 'L', function()
--   vim.cmd.RustLsp { 'hover', 'actions' }
-- end, { silent = true, buffer = bufnr, desc = 'Rust actions' })

vim.keymap.set('n', '<leader>c<C-D>', function()
  vim.cmd.RustLsp { 'openDocs' }
end, { buffer = bufnr, desc = 'Open the docrs documentation' })
-- supports rust-analyzer's grouping
-- I tried this - not sure whether i like it
-- vim.keymap.set('n', '<leader>ra', function()
--   vim.cmd.RustLsp 'codeAction'
-- end, { silent = true, buffer = bufnr, desc = 'Rust code action' })
