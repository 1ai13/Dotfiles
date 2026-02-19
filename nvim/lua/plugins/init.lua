-- This file was automatically created by the NvChad system package lazy = false,
--to ensure NvChad starts correctly without errors.
-- You can add your custom lazy.nvim plugin specifications here.
-- For example:
-- return {
--   { "nvim-lua/plenary.nvim" },
--   -- add more plugins here
-- }
-- If you have no custom plugins yet, NvChad requires this file to return an empty table.
return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		-- This will provide type hinting with LuaLS
		opts = function()
			return require("plugins.configs.formatter")
		end,
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		-- stylua: ignore
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("plugins.configs.tree-sitter"),
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
		opts = require("plugins.configs.outliner"),
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = require("plugins.configs.refactor"),
	},
}
