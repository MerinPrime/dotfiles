return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    ft = { "lua", "python", "rust", "html", "css", "javascript", "typescript", "prisma" },
    event = 'BufReadPre',
    config = function()
        local servers = {
            "basedpyright",
            "bashls",
            "cssls",
            "dockerls",
            "html",
            "jsonls",
            "lua_ls",
            "prismals",
            "ruff",
            "rust_analyzer",
            "vtsls",
            "yamlls",
        }

        for _, name in ipairs(servers) do
            vim.lsp.enable(name)
        end

        vim.diagnostic.config({
            virtual_text = {
                prefix = "#",
                spacing = 2,
            },
            signs = true,
            underline = true,
            update_in_insert = true,
        })
    end
}
