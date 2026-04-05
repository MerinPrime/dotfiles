return {
    "antosha417/nvim-lsp-file-operations",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    event = "LspAttach",
    config = function()
        require("lsp-file-operations").setup()
    end,
}
