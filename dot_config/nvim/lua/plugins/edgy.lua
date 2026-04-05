return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	config = function()
		opts = {
			options = {
				left = { size = 40 },
				bottom = { size = 15 },
				right = { size = 45 },
				top = { size = 30 },
			},
			animate = {
				enabled = false,
			},
			wo = {
				-- winbar = "",
			},
			left = {
				{
					ft = "NvimTree",
				},
			},
			bottom = {},
			right = {},
			top = {},
			keys = {
				["]w"] = function(win)
					win:next({ visible = true, focus = true })
				end,
				["[w"] = function(win)
					win:prev({ visible = true, focus = true })
				end,
				["<c-w>>"] = function(win)
					win:resize("width", 2)
				end,
				["<c-w><lt>"] = function(win)
					win:resize("width", -2)
				end,
				["<c-w>+"] = function(win)
					win:resize("height", 2)
				end,
				["<c-w>-"] = function(win)
					win:resize("height", -2)
				end,
			},
		}

		for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
			opts[pos] = opts[pos] or {}
			table.insert(opts[pos], {
				ft = "trouble",
				filter = function(_buf, win)
					return vim.w[win].trouble
						and vim.w[win].trouble.position == pos
						and vim.w[win].trouble.type == "split"
						and vim.w[win].trouble.relative == "editor"
						and not vim.w[win].trouble_preview
				end,
			})
		end

		require("edgy").setup(opts)
	end,
}
