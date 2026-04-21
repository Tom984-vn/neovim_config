return {
  -- only install & setup mason itself
  {
    "williamboman/mason.nvim",
    opts = {},
  },  -- no mason-lspconfig block at all!

  -- now the lspconfig for lua_ls
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- explicit, single lua_ls setup:
      local lsp = vim.lsp
      local util      = require("lspconfig.util")

      lsp.config('lua_ls', {
        capabilities = capabilities,

        -- force the workspace root to your nvim config folder (unless you open a git repo)
        root_dir = function(fname)
          -- local root = util.root_pattern(".git", ".luarc.json", ".luarc.jsonc")(fname)
          -- if root then
          --   return root
          -- end
          return vim.fn.stdpath("config")
        end,

        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library         = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.stdpath("config") .. "/lua",
              },
              maxPreload      = 2000,
              preloadFileSize = 1000,
            },
            telemetry = { enable = false },
          },
        },
      })
      lsp.enable('lua_ls')

      lsp.config('pyright', {
        capabilities = capabilities,
      })
      lsp.enable("pyright")

      lsp.config("clangd", {})
      lsp.enable("clangd")

      -- your LSP keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {desc = "diagnostic open_float"})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename in LSP"})
    end,
  },
}
