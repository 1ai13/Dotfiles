--Tree Explorer
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		require("nvim-tree.api").tree.open()
	end,
	once = true,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	callback = function()
		require("outline").open({
			focus_outline = false,
		})
	end,
	once = true,
})
