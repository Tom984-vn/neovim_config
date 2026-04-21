return {
  -- Web devicons (for icons)
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false, -- 👈 ensure it loads
    priority = 1000,
    config = function()
      require('nvim-web-devicons').setup {
        default = true,
      }
    end,
  },
}
