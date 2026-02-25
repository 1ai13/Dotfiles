--REFACTOR MAPPING
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

--DEBUG MAPPING
vim.keymap.set("n", "<leader>dp", function()
	require("refactoring").debug.printf({ below = false })
end, { desc = "Print marker" })
vim.keymap.set({ "x", "n" }, "<leader>dv", function()
	require("refactoring").debug.nt_var()
end, { desc = "Print variable" })
vim.keymap.set("n", "<leader>dc", function()
	require("refactoring").debug.cleanup({})
end, { desc = "Clear prints" })
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "Terminate debugger" })
vim.keymap.set("n", "<leader>dr", function()
	require("dap").continue()
end, { desc = "Start debugger" })
vim.keymap.set("n", "<leader>dac", function()
	require("dap").clear_breakpoints()
end, { desc = "Clear breakpoints" })

-- COMMENTOR MAPPING
vim.keymap.set("", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })
vim.keymap.set("", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
vim.keymap.set("", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
vim.keymap.set("", "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })

-- OUTLINER MAPPING
vim.keymap.set("", "<leader>o", "<cmd>Outline!<CR>", { desc = "Toggle outline" })

--SESSION MANAGMENT
vim.keymap.set("n", "çl", function()
	local nvim_tree = require("nvim-tree.api")
	if nvim_tree.tree.is_visible() then
		nvim_tree.tree.toggle()
	end
	require("persistence").load({ last = true })
	nvim_tree.tree.toggle({
		focus = false,
	})
	require("outline").open({ focus_outline = false })
end, { desc = "load last session" })
vim.keymap.set("n", "çD", function()
	require("persistence").stop()
end, { desc = "Stop saving session" })

--SIGNATURE HELPER
vim.keymap.set({ "i" }, "<C-g>", function()
	require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "Toggle signature" })

vim.keymap.del("i", "<C-s>")
