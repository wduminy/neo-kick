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
    -- keep them on while we figure out which ones are nice
    vim.g.vimtex_mappings_enabled = true
    -- do not replace local leader
    local prefix = '<localleader>i'
    vim.g.vimtex_mappings_prefix = prefix

    -- setting some keys: see :h vimtex-default-mappings
    local mapkey = function(chord, name, desc)
      vim.keymap.set('n', chord, '<plug>(vimtex-' .. name .. ')', { desc = 'VimTex: ' .. desc })
    end

    local mapkey2 = function(chord, desc)
      mapkey(chord, chord, desc)
    end

    -- to remove: ']['
    mapkey2(']]', 'Next section')
    mapkey2('[[', 'Previous section')
    mapkey2('][', 'Ignore')

    local new_prefix = '<localleader>l'
    local mapkey_p = function(chord, name, desc)
      mapkey(new_prefix .. chord, name, desc)
    end
    require('which-key').register {
      [prefix] = { name = '[I]nvestigating', _ = 'which_key_ignore' },
      [new_prefix] = { name = '[L]atex', _ = 'which_key_ignore' },
      [new_prefix .. 'p'] = { name = '[P]rocess', _ = 'which_key_ignore' },
    }
    mapkey_p('i', 'info', '[I]nfo')
    mapkey_p('l', 'compile', 'compi[L]e')
    mapkey_p('v', 'view', '[V]iew')
    mapkey_p('pk', 'stop', '[K]ill')
    mapkey_p('ps', 'status', '[S]tatus')
    mapkey_p('c', 'clean', '[C]lean')
    mapkey_p('pr', 'reload', '[R]eload')
    mapkey_p('pt', 'toc-toggle', 'Toggle [T]able of contents')
  end,
}
