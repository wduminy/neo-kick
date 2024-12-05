-- disabled while troubleshooting
if true then
  return {}
end
return {
  'ludovicchabant/vim-gutentags',
  lazy = false,
  init = function()
    vim.g.gutentags_exclude_filetypes = { 'lua', 'rust' }
    vim.g.gutentags_cache_dir = '~/.cache/gutentags'
  end,
}
