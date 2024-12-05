-- NOTE: You can add your own plugins here or in other files in this directory!
--
-- https://github.com/catppuccin/nvim?tab=readme-ov-file
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
    config = function()
      require('catppuccin').setup {
        custom_highlights = function(colors)
          return {
            Comment = { fg = colors.sky },
          }
        end,
      }
    end,
  },
}
