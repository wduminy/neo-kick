return {
  'lervag/vimtex',
  lazy = true,
  ft = 'tex', -- laod ony on tex
  init = function()
    -- the init runs before the plugin loads
    local tele_find = function()
      local line = vim.api.nvim_get_current_line()
      local cpos = vim.fn.getpos '.' -- current cursorpos
      local pos = cpos[3] -- select col value
      local left = string.sub(line, 1, pos)
      local left_i = string.find(left, '[/{][^/}]*$')
      local right_i = string.find(line, '[/}]', pos)
      vim.print(left_i, right_i)
      if left_i and right_i and right_i > left_i + 1 then
        local ref_braced = string.sub(line, left_i, right_i)
        require('telescope.builtin').grep_string {
          search = '\\label' .. ref_braced,
        }
      else
        vim.print 'Cannot find reference to search'
      end
    end
    -- I used this as starter: https://github.com/lervag/vimtex?tab=readme-ov-file#installation
    -- TODO: Some investigation is needed to figure out why tabstop=8 for tex files
    --
    -- a command to help with navigation
    vim.api.nvim_create_autocmd({ 'Filetype' }, {
      pattern = 'tex',
      callback = function()
        vim.keymap.set('n', '<c-]>', tele_find, { desc = 'VimTex: lookup', buffer = true })
      end,
    })

    -- general setup
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
        -- for svg rendering
        '-latexoption="-write18 -shell-escape -f"',
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
    local mapkey4 = function(mode, chord, name, desc)
      vim.keymap.set(mode, chord, '<plug>(vimtex-' .. name .. ')', { desc = 'VimTex: ' .. desc })
    end

    local nmapk = function(chord, name, desc)
      mapkey4('n', chord, name, desc)
    end

    local nmapk2 = function(chord, desc)
      mapkey4('n', chord, chord, desc)
    end

    nmapk2(']]', 'Next section')
    nmapk2('[[', 'Previous section')
    nmapk2('][', 'Ignore')

    local new_prefix = '<localleader>l'
    local xmapp = function(chord, name, desc)
      mapkey4('x', new_prefix .. chord, name, desc)
    end
    local nmapp = function(chord, name, desc)
      nmapk(new_prefix .. chord, name, desc)
    end
    require('which-key').register {
      [prefix] = { name = '[I]nvestigating', _ = 'which_key_ignore' },
      [new_prefix] = { name = '[L]atex', _ = 'which_key_ignore' },
      [new_prefix .. 'p'] = { name = '[P]rocess', _ = 'which_key_ignore' },
    }
    xmapp('e', 'env-surround-visual', 'Add [E]nvironment around')
    nmapp('e', 'env-surround-line', 'Add [E]nvironment around line')
    nmapp('i', 'info', '[I]nfo')
    nmapp('l', 'compile', 'compi[L]e')
    nmapp('v', 'view', '[V]iew')
    nmapp('pk', 'stop', '[K]ill')
    nmapp('ps', 'status', '[S]tatus')
    nmapp('c', 'clean', '[C]lean')
    nmapp('pr', 'reload', '[R]eload')
    nmapp('pt', 'toc-toggle', 'Toggle [T]able of contents')
  end,
}
