return {
  'echasnovski/mini.nvim', 
  version = false ,
  config = function()
    require('mini.files').setup()
    vim.keymap.set('n', '<C-e>', ':lua MiniFiles.open()<CR>', {desc = "Open file tree"})
    vim.api.nvim_create_autocmd("User", {
      -- Bắt cả sự kiện đổi tên và di chuyển file
      pattern = { "MiniFilesActionRename", "MiniFilesActionMove" },
      callback = function(event)
        -- Lấy thông tin chuẩn từ document của mini.files
        local action = event.data.action
        local from = event.data.from
        local to = event.data.to

        -- Tạo payload theo chuẩn giao thức của LSP
        local rename_payload = {
          files = {
            {
              oldUri = vim.uri_from_fname(from),
              newUri = vim.uri_from_fname(to),
            }
          }
        }

        -- Lấy danh sách các LSP client đang chạy (tương thích cả nvim 0.9 và 0.10+)
        local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
        local clients = get_clients()

        for _, client in ipairs(clients) do
          -- BƯỚC 1: Yêu cầu LSP tính toán các thay đổi code (VD: sửa import, sửa package)
          if client.supports_method("workspace/willRenameFiles") then
            local resp = client.request_sync("workspace/willRenameFiles", rename_payload, 2000, 0)
            -- Nếu LSP trả về các đoạn code cần sửa, áp dụng chúng ngay lập tức
            if resp and resp.result ~= nil then
              vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
            end
          end

          -- BƯỚC 2: Thông báo cho LSP biết file đã chính thức đổi tên để nó cập nhật lại cây thư mục nội bộ
          if client.supports_method("workspace/didRenameFiles") then
            client.notify("workspace/didRenameFiles", rename_payload)
          end
        end
      end,
    })
  end,
}


