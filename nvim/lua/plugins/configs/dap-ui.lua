return function()
	vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStoppedLine", numhl = "DapStoppedLine" })
	vim.fn.sign_define("DapBreakpoint", {
		text = "●", -- the dot
		texthl = "DapBreakpoint",
	})
	vim.cmd([[hi DapBreakpoint guifg=#FF5555]])
	vim.cmd([[hi DapStoppedLine guifg=#00FF00]])

	local dap, dapui, tree = require("dap"), require("dapui"), require("nvim-tree.api")
	dap.listeners.before.attach.dapui_config = function()
		tree.tree.close()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		tree.tree.close()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
		tree.tree.toggle({
			focus = false,
		})
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
		tree.tree.toggle({
			focus = false,
		})
	end
end
