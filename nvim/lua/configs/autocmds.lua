--Tree Explorer
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		require("nvim-tree.api").tree.toggle({
			focus = false,
		})
	end,
	once = true,
})

--Outline
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	callback = function()
		local outline = require("outline")
		if not outline.is_open() then
			require("outline").open({ focus_outline = false })
		end
	end,
	once = true,
})

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "PersistenceSavePre",
	callback = function()
		require("outline").close()
	end,
})
