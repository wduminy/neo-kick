return {
  -- https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#configuration-options
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre /Users/willemduminy/Library/Mobile Documents/com~apple~CloudDocs/obsidian/sb/*.md',
    'BufNewFile /Users/willemduminy/Library/Mobile Documents/com~apple~CloudDocs/obsidian/sb/*.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    -- disable markdown formatting
    ui = { enable = false },
    workspaces = {
      {
        name = 'second brain',
        path = '/Users/willemduminy/Library/Mobile Documents/com~apple~CloudDocs/obsidian/sb',
      },
    },
  },
}
