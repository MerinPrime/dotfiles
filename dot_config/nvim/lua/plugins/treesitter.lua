return {
	{
		"romus204/tree-sitter-manager.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"javascript",
				"typescript",
				"html",
				"css",
				-- "scss",
				-- "svelte",
				-- "vue",
				-- "tsx",

				"python",
				"rust",
				"java",
				"kotlin",
				"lua",
				"c_sharp",
				"c",
				"cpp",
				-- "regex",

				"bash",
				"make",
				"cmake",

				"json",
				"json5",
				"yaml",
				"toml",
				-- "xml",
				"nix",

				"markdown",
				"markdown_inline",
				-- "latex", -- Need treesitter-cli
				"typst",

				"prisma",

				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
			},
			auto_install = true,
		}
	}
}
