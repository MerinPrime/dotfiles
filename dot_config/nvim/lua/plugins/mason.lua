return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "prismals",
                    "vtsls",
                    "basedpyright",
                    "ruff",
                    "rust_analyzer",
                    "html",
                    "cssls",
                    "lua_ls",
                },
                automatic_installation = true,
            })
        end
    }
}
