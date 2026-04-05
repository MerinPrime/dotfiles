return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    event = { "BufReadPre" },
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle<cr>",
            desc = "Document Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
    },
    config = function()
        require("trouble").setup({
            warn_no_results = false,
            open_no_results = true,
            indent_guides = false,
            modes = {
                diagnostics = {
                    win = {
                        position = "bottom",
                    },
                },
                symbols = {
                    win = {
                        position = "right",
                    },
                },
                lsp = {
                    win = {
                        position = "right",
                    },
                },
            },
            filter = {
                function (item)
                    return not string.match(item.filename, "node_modules")
                end
            }
        })
    end
}
