--REFACTOR MAPPING
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.keymap.set("n", "<leader>dp", function()
	require("refactoring").debug.printf({ below = false })
end, { desc = "Print marker" })

--DEBUG PRINT MAPPING
vim.keymap.set({ "x", "n" }, "<leader>dv", function()
	require("refactoring").debug.print_var()
end, { desc = "Print variable" })

vim.keymap.set("n", "<leader>dc", function()
	require("refactoring").debug.cleanup({})
end, { desc = "Clear prints" })

-- COMMENTOR MAPPING
vim.keymap.set("", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })

vim.keymap.set("", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
vim.keymap.set("", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
vim.keymap.set("", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })

-- OUTLINER MAPPING
vim.keymap.set("", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle outline" })
