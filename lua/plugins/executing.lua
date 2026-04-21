return {
  'CRAG666/code_runner.nvim',
  config = function()
    require('code_runner').setup({
      filetype = {
        python = "python3 -u",
        cpp = "g++ $fileName -o $fileNameWithoutExt.exe && $fileNameWithoutExt.exe",
        c = "gcc $fileName -o $fileNameWithoutExt.exe && $fileNameWithoutExt.exe",
        java = "JavaRunnerRunMain<CR>"
      },
    })
    vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = true , desc = "Executing"})
  end
}
