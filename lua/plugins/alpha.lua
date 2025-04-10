return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    math.randomseed(os.time())

    local function pick_color()
      local colors = { 'String', 'Identifier', 'Keyword', 'Number' }
      return colors[math.random(#colors)]
    end

    local function footer()
      local total_plugins = #vim.tbl_keys(require('lazy').plugins())
      local datetime = os.date ' %d-%m-%Y   %H:%M:%S'
      local version = vim.version()
      local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

      return datetime .. '   ' .. total_plugins .. ' plugins' .. nvim_version_info
    end

    local logo = {
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '          |\\      _,,,---,,_            ',
      "    ZZZzz /,`.-'`'    -.  ;-;;,_         ",
      "         |,4-  ) )-,_. ,\\ (  `'-'       ",
      "        '---''(_/--'  `-'\\_)            ",
    }

    dashboard.section.header.val = logo
    dashboard.section.header.opts.hl = pick_color()

    dashboard.section.buttons.val = {
      dashboard.button('<Leader>e', '󰈞  File Explorer'),
      dashboard.button('<Leader>sf', '  Find File'),
      dashboard.button('<Leader>sg', '  Find Word'),
      dashboard.button('<Leader>lu', '  Update plugins'),
      dashboard.button('q', '󰈆  Quit', ':qa<cr>'),
    }

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = 'Constant'

    alpha.setup(dashboard.opts)

    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
  end,
}
