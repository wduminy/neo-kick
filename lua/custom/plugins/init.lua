-- NOTE: You can add your own plugins here or just add files in this directory
return {
  {
    -- https://github.com/catppuccin/nvim?tab=readme-ov-file
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
    config = function()
      require('catppuccin').setup {
        custom_highlights = function(_colors)
          return {
            --            Comment = { fg = colors.sky },
          }
        end,
      }
    end,
  },
  {
    -- https://github.com/saecki/crates.nvim
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup {
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      }
    end,
  },
}
