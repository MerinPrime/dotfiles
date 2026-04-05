return {
    "natecraddock/workspaces.nvim",
    cmd = {
        "WorkspacesAdd",
        "WorkspacesList",
        "WorkspacesOpen",
        "WorkspacesAddDir",
        "WorkspacesRemove",
        "WorkspacesRename",
        "WorkspacesListDirs",
        "WorkspacesSyncDirs",
        "WorkspacesRemoveDir",
    },
    dependencies = { "nvim-tree/nvim-tree.lua", "nvim-telescope/telescope.nvim" },
    config = function()
        require("workspaces").setup({
            path = vim.fn.stdpath("data") .. "/workspaces",
            cd_type = "global",
            sort = true,
            auto_open = false,
            hooks = {
                open = {
                    'silent %bdelete!',
                    'NvimTreeOpen',
                },
            }
        })
    end
}

