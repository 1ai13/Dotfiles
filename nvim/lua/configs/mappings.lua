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

vim.keymap.set("n", "<F9>", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F11>", function()
	require("dap").terminate()
end, { desc = "Terminate debugger" })
vim.keymap.set("n", "<F10>", function()
	require("dap").continue()
end, { desc = "Start debugger" })
vim.keymap.set("n", "<leader>dbc", function()
	require("dap").clear_breakpoints()
end, { desc = "Clear breakpoints" })

--COMMENTOR MAPPING
vim.keymap.set("", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })
vim.keymap.set("", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
vim.keymap.set("", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
vim.keymap.set("", "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })

--OUTLINER MAPPING
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

--COMPILER & BUILDER
local term = nil
local job = nil
vim.keymap.set({ "i", "v", "n" }, "<F5>", function()
	if term == nil then
		vim.cmd("20new | terminal")
		vim.bo.buflisted = false
		term = vim.api.nvim_get_current_buf()
		job = vim.b.terminal_job_id
		vim.api.nvim_create_autocmd("BufWinLeave", {
			buffer = term,
			callback = function()
				term = nil
				job = nil
			end,
		})
	end
	vim.fn.chansend(job, "clear; runner -b\n")
end)

vim.keymap.set({ "i", "v", "n" }, "<F7>", function()
	if term == nil then
		vim.cmd("20new | terminal")
		vim.bo.buflisted = false
		term = vim.api.nvim_get_current_buf()
		job = vim.b.terminal_job_id
		vim.api.nvim_create_autocmd("BufWinLeave", {
			buffer = term,
			callback = function()
				term = nil
				job = nil
			end,
		})
	end
	vim.fn.chansend(job, "clear; runner -b -t release\n")
end)

vim.keymap.set({ "i", "v", "n" }, "<F6>", function()
	if term == nil or not vim.api.nvim_buf_is_valid(term) then
		vim.cmd("20new | terminal")
		vim.bo.buflisted = false
		term = vim.api.nvim_get_current_buf()
		job = vim.b.terminal_job_id
		vim.api.nvim_create_autocmd("BufWinLeave", {
			buffer = term,
			callback = function()
				term = nil
				job = nil
			end,
		})
	end
	vim.fn.chansend(job, "runner -r\n")
end)

vim.keymap.set({ "i", "v", "n" }, "<F8>", function()
	if term == nil or not vim.api.nvim_buf_is_valid(term) then
		vim.cmd("20new | terminal")
		vim.bo.buflisted = false
		term = vim.api.nvim_get_current_buf()
		job = vim.b.terminal_job_id
		vim.api.nvim_create_autocmd("BufWinLeave", {
			buffer = term,
			callback = function()
				term = nil
				job = nil
			end,
		})
	end
	vim.fn.chansend(job, "runner -r -t release\n")
end)
