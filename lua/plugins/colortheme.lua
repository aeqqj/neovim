return {
  {
    -- main color theme
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or "light" for light mode
      vim.cmd 'let g:gruvbox_material_diagnostic_line_highlight=1'
      vim.cmd "let g:gruvbox_material_diagnostic_virtual_text='colored'"
      vim.cmd 'let g:gruvbox_material_enable_bold=1'
      vim.cmd 'let g:gruvbox_material_enable_italic=1'
      vim.cmd [[colorscheme gruvbox-material]] -- Set color scheme
    end,
  },

  {
    -- color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    event = {
      'BufReadPre',
      'BufNewFile',
      'BufRead',
    },
    config = function()
      local hl = vim.api.nvim_set_hl
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        hl(0, 'RainbowDelimiter1', { fg = '#ea6962' }),
        hl(0, 'RainbowDelimiter2', { fg = '#d8a657' }),
        hl(0, 'RainbowDelimiter3', { fg = '#458588' }),
        hl(0, 'RainbowDelimiter4', { fg = '#8ec07c' }),
        hl(0, 'RainbowDelimiter5', { fg = '#d3869b' }),
        hl(0, 'RainbowDelimiter6', { fg = '#e78a4e' }),
        hl(0, 'RainbowDelimiter7', { fg = '#83a598' }),
        strategy = {
          [''] = 'rainbow-delimiters.strategy.global',
          vim = 'rainbow-delimiters.strategy.local',
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiter1',
          'RainbowDelimiter2',
          'RainbowDelimiter3',
          'RainbowDelimiter4',
          'RainbowDelimiter5',
          'RainbowDelimiter6',
          'RainbowDelimiter7',
        },
      }
    end,
  },
}
