local M = {}

M.statusline = {
  hl = { fg = "fg", bg = "bg" },
  {
    provider = function()
      return " " .. vim.fn.mode() .. " "
    end,
  },
  {
    provider = " " .. vim.b.gitsigns_head, -- Requires Gitsigns plugin
    hl = { fg = "green", bold = true },
  },
  {
    provider = " %f ", -- Show filename
  },
  {
    provider = "%=", -- Right align
  },
  {
    provider = " %p%% ", -- Percentage through the file
  },
  {
    provider = "%l:%c ", -- Line and column
  },
}

return M

