return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    init = function()
        local persistence_group = vim.api.nvim_create_augroup("PersistenceNvimTree", { clear = true })

        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistenceSavePre",
            group = persistence_group,
            callback = function()
                local p_loaded, nvim_tree_api = pcall(require, "nvim-tree.api")
                if p_loaded then
                    nvim_tree_api.tree.close()
                end
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistenceLoadPost",
            group = persistence_group,
            callback = function()
                local p_loaded, nvim_tree_api = pcall(require, "nvim-tree.api")
                if p_loaded then
                    nvim_tree_api.tree.toggle({ focus = false, find_file = true })
                end
            end,
        })
    end
}
