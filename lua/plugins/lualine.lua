return {
  -- Dracula colorscheme
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('dracula')
    end,
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        --theme = 'dracula',
        icons_enabled = true,
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},  -- ✅ this should show an icon
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },      
    },
  },
}

