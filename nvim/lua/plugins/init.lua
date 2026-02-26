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
		"lazy.nvim",
		opts = {
			library = { "nvim-dap-ui" },
		},
	},
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
		dependencies = {
			"hrsh7th/cmp-emoji",
			-- , "hrsh7th/cmp-nvim-lsp-signature-help"
		},
		opts = function(_, opts)
			local cmp = require("cmp")
			table.insert(opts.sources, { name = "emoji" })
			-- table.insert(opts.sources, { name = "nvim_lsp_signature_help" })
			opts.window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
					max_height = 15,
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
				}),
			}
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			floating_window = true,
			hint_enable = false,
			hint_prefix = {
				above = "↙ ", -- when the hint is on the line above the current line
				current = "← ", -- when the hint is on the same line
				below = "↖ ", -- when the hint is on the line below the current line
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = require("plugins.configs.filetree"),
	},
	{
		"hedyhli/outline.nvim",
		event = "User PersistenceLoadPre",
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
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = require("plugins.configs.git"),
	},
	{
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = require("plugins.configs.dap-ui"),
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = { "codelldb" },
		},
	},
}
