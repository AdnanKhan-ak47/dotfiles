vim.api.nvim_create_autocmd("VimLeavePre", {
  pattern = "*",
  callback = function()
    vim.cmd("SessionSave")
  end,
})

