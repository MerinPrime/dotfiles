return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                telescope = { enabled = true },
                indent_blankline = { enabled = true, colored_indent_levels = false },
            },

            custom_highlights = function(colors)
                return {
                    Normal = { bg = "NONE" },
                    NormalFloat = { bg = "NONE" },
                    FloatBorder = { fg = colors.blue, bg = "NONE" },
                    NvimTreeNormal = { bg = "NONE" },
                    NvimTreeWinSeparator = { fg = colors.blue, bg = "NONE" },
                    LineNr = { bg = "NONE" },
                    SignColumn = { bg = "NONE" },
                    TelescopeNormal = { bg = "NONE" },
                    TelescopeBorder = { bg = "NONE" },
                }
            end
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
