return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,     -- (999 is fine too, but 1000 is default max)
    opts = {
      flavour = "mocha", -- or "latte", "frappe", "macchiato"
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  }

