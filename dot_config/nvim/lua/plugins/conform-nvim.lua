return {
	"stevearc/conform.nvim",
	opts = function()
		local util = require("conform.util")

		return {
			formatters_by_ft = {
				javascript = { "biome-check", "biome" },
				javascriptreact = { "biome-check", "biome" },
				typescript = { "biome-check", "biome" },
				typescriptreact = { "biome-check", "biome" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format" },
				-- python = { "ruff_format" },
				rust = { "rustfmt" },

				toml = { "taplo" },
				markdown = { "prettier" },
				dockerfile = { "hadolint" },
				sh = { "shfmt" },

				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
			},
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
				biome = {
					require_cwd = true,
				},
				ruff_format = {
					require_cwd = true,
					cwd = util.root_file({
						"ruff.toml",
						"pyproject.toml",
						".ruff.toml",
					}),
				},
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 2000,
				async = false,
			},
		}
	end,
}
