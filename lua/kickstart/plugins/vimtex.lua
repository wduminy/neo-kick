-- I used this as starter: https://github.com/lervag/vimtex?tab=readme-ov-file#installation
return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- started from here: https://github.com/lervag/vimtex

    --[[ 
" This enables Vim's and neovim's syntax-related features. Without his, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

  --]]
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = 'out',
      out_dir = 'out',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      hooks = {},
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_reading_bar = 1
  end,
}
