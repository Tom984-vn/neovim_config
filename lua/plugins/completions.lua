return {
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<C-y>"]     = cmp.mapping.confirm({ select = true }),
          ["<C-j>"]     = cmp.mapping.select_next_item(),
          ["<C-k>"]     = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Which-key 2.0+ registration
      require("which-key").add({
        mode = { "i" },
        { "<C-Space>", desc = "Trigger completion" },
        { "<C-b>", desc = "Scroll docs up" },
        { "<C-e>", desc = "Abort completion" },
        { "<C-f>", desc = "Scroll docs down" },
        { "<C-j>", desc = "Next suggestion" },
        { "<C-k>", desc = "Previous suggestion" },
        { "<C-y>", desc = "Confirm selection" },
      })
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
  },
}
