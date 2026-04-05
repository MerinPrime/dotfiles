return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = { "Telescope" },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                    get_selection_window = function()
                        require("edgy").goto_main()
                        return 0
                    end
                },
                pickers = {
                    -- find_files = { theme = "dropdown" },
                },
            })
            
            pcall(require("telescope").load_extension, "workspaces")
        end,
    },
}
