-- A playground for trying out lua commands
-- :wa | luafile %
-- vim = require("vim")
vim.print 'hello world!'

local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
end
map('<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, '[T]oggle Inlay [H]ints')
