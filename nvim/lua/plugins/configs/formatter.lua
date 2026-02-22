return {
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		html = { "prettier" },
		css = { "prettier" },
		cpp = { "clang-format" },
		cmake = { "cmake_format" },
	},
	-- Set default options
	default_format_opts = {
		lsp_format = "fallback",
		timeout_ms = 3000,
		async = false,
		quiet = false,
	},
	-- Set up format-on-save
	format_on_save = { timeout_ms = 500 },
}
