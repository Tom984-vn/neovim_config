return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    config = function()
      require("java").setup({
        spring_boot_tools = { enable = false },

        vim.lsp.config('jdtls', {
          cmd = { 'jdtls' }, -- Path to your jdtls executable
          root_dir = vim.fs.root(0, {'.git', 'mvnw', 'gradlew'}),
        }),

        vim.lsp.enable('jdtls')
      -- Khởi động JDTLS
      -- Với nvim-java bản mới, cách gọi chuẩn qua lspconfig sẽ ổn định hơn.
    })
    end,
},
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },
}
