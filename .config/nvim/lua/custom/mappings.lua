local M = {}

M.general = {
  n = {
    ["<leader>sq"] = { ":SessionSave<CR>", "Save session" },
    ["<leader>sl"] = { ":SessionLoad<CR>", "Load session" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

return M

