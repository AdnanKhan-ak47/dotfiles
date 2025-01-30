require "nvchad.mappings"
local mappings = require "custom.mappings"
-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ss", ":SessionSave<CR>", { desc = "Save Session"})
map("n", "<leader>sl", ":SessionLoad<CR>", { desc = "Load Session"})

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
